local utils = require "core.utils"
local enums = require "data.enums"
local settings = require "core.settings"
local explorer = {
    enabled = false,
}
local explored_areas = {}
local target_position = nil
local grid_size = 1               -- Größe der Rasterzellen in Metern
local exploration_radius = 8      -- Radius, in dem Bereiche als erkundet gelten
local explored_buffer = 1         -- Puffer um erkundete Bereiche in Metern
local max_target_distance = 15    -- Maximale Entfernung für ein neues Ziel
local unstuck_target_distance = 5 -- Maximale Entfernung für ein Unstuck-Ziel
local stuck_threshold = 4         -- Sekunden, bevor der Charakter als "steckengeblieben" gilt
local last_position = nil
local last_move_time = 0
local last_explored_targets = {}
local max_last_targets = 5

-- A* pathfinding variables
local current_path = {}
local path_index = 1

-- Explorationsmodus
local exploration_mode = "unexplored" -- "unexplored" oder "explored"

-- Richtung für den "explored" Modus
local exploration_direction = { x = 1, y = 0 } -- Initiale Richtung (kann angepasst werden)

-- Neue Variable für die letzte Bewegungsrichtung
local last_movement_direction = nil


local function get_grid_key(point)
    return math.floor(point:x() / grid_size) .. "," ..
        math.floor(point:y() / grid_size) .. "," ..
        math.floor(point:z() / grid_size)
end

local function calculate_distance(point1, point2)
    return point1:dist_to_ignore_z(point2)
end

local explored_area_bounds = {
    min_x = math.huge,
    max_x = -math.huge,
    min_y = math.huge,
    max_y = -math.huge,
}

local function update_explored_area_bounds(point, radius)
    explored_area_bounds.min_x = math.min(explored_area_bounds.min_x, point:x() - radius)
    explored_area_bounds.max_x = math.max(explored_area_bounds.max_x, point:x() + radius)
    explored_area_bounds.min_y = math.min(explored_area_bounds.min_y, point:y() - radius)
    explored_area_bounds.max_y = math.max(explored_area_bounds.max_y, point:y() + radius)
end

local function is_point_in_explored_area(point)
    return point:x() >= explored_area_bounds.min_x and point:x() <= explored_area_bounds.max_x and
        point:y() >= explored_area_bounds.min_y and point:y() <= explored_area_bounds.max_y
end

local function mark_area_as_explored(center, radius)
    update_explored_area_bounds(center, radius)
    -- Hier können Sie zusätzliche Logik hinzufügen, um die erkundeten Bereiche zu markieren
    -- z.B. durch Hinzufügen zu einer Datenstruktur oder durch Setzen von Flags
end

local function check_walkable_area()
    local player_pos = get_player_position()
    local check_radius = 50 -- Überprüfungsradius in Metern

    mark_area_as_explored(player_pos, exploration_radius)

    for x = -check_radius, check_radius, grid_size do
        for y = -check_radius, check_radius, grid_size do
            local point = vec3:new(
                player_pos:x() + x,
                player_pos:y() + y,
                player_pos:z()
            )

            if utility.is_point_walkeable(point) then
                if is_point_in_explored_area(point) then
                    graphics.text_3d("explored", point, 15, color_white(128))
                else
                    graphics.text_3d("unexplored", point, 15, color_green(255))
                end
            end
        end
    end
end

local function reset_exploration()
    explored_area_bounds = {
        min_x = math.huge,
        max_x = -math.huge,
        min_y = math.huge,
        max_y = -math.huge,
    }
    target_position = nil
    last_position = nil
    last_move_time = 0
    current_path = {}
    path_index = 1
    exploration_mode = "unexplored"
    last_movement_direction = nil

    console.print("Exploration reset. All areas marked as unexplored.")
end

local function is_near_wall(point)
    local wall_check_distance = 1.5 -- Abstand zur Überprüfung von Wänden
    local directions = {
        { x = 1, y = 0 }, { x = -1, y = 0 }, { x = 0, y = 1 }, { x = 0, y = -1 },
        { x = 1, y = 1 }, { x = 1, y = -1 }, { x = -1, y = 1 }, { x = -1, y = -1 }
    }

    for _, dir in ipairs(directions) do
        local check_point = vec3:new(
            point:x() + dir.x * wall_check_distance,
            point:y() + dir.y * wall_check_distance,
            point:z()
        )
        if not utility.is_point_walkeable(check_point) then
            return true
        end
    end
    return false
end

local function find_central_unexplored_target()
    local player_pos = get_player_position()
    local check_radius = max_target_distance
    local unexplored_points = {}
    local min_x, max_x, min_y, max_y = math.huge, -math.huge, math.huge, -math.huge

    for x = -check_radius, check_radius, grid_size do
        for y = -check_radius, check_radius, grid_size do
            local point = vec3:new(
                player_pos:x() + x,
                player_pos:y() + y,
                player_pos:z()
            )

            if utility.is_point_walkeable(point) and not is_point_in_explored_area(point) then
                table.insert(unexplored_points, point)
                min_x = math.min(min_x, point:x())
                max_x = math.max(max_x, point:x())
                min_y = math.min(min_y, point:y())
                max_y = math.max(max_y, point:y())
            end
        end
    end

    if #unexplored_points == 0 then
        return nil
    end

    local center_x = (min_x + max_x) / 2
    local center_y = (min_y + max_y) / 2
    local center = vec3:new(center_x, center_y, player_pos:z())

    table.sort(unexplored_points, function(a, b)
        return calculate_distance(a, center) < calculate_distance(b, center)
    end)

    return unexplored_points[1]
end

local function find_random_explored_target()
    local player_pos = get_player_position()
    local check_radius = max_target_distance
    local explored_points = {}

    for x = -check_radius, check_radius, grid_size do
        for y = -check_radius, check_radius, grid_size do
            local point = vec3:new(
                player_pos:x() + x,
                player_pos:y() + y,
                player_pos:z()
            )

            local grid_key = get_grid_key(point)
            if utility.is_point_walkeable(point) and explored_areas[grid_key] and not is_near_wall(point) then
                table.insert(explored_points, point)
            end
        end
    end

    if #explored_points == 0 then
        return nil
    end

    return explored_points[math.random(#explored_points)]
end

function vec3.__add(v1, v2)
    return vec3:new(v1:x() + v2:x(), v1:y() + v2:y(), v1:z() + v2:z())
end

local function is_in_last_targets(point)
    for _, target in ipairs(last_explored_targets) do
        if calculate_distance(point, target) < grid_size * 2 then
            return true
        end
    end
    return false
end

local function add_to_last_targets(point)
    table.insert(last_explored_targets, 1, point)
    if #last_explored_targets > max_last_targets then
        table.remove(last_explored_targets)
    end
end

local function find_explored_direction_target()
    local player_pos = get_player_position()
    local max_attempts = 20
    local attempts = 0
    local best_target = nil
    local best_distance = 0

    while attempts < max_attempts do
        local direction_vector = vec3:new(
            exploration_direction.x * max_target_distance,
            exploration_direction.y * max_target_distance,
            0
        )
        local target_point = player_pos + direction_vector

        if utility.is_point_walkeable(target_point) and is_point_in_explored_area(target_point) then
            local distance = calculate_distance(player_pos, target_point)
            if distance > best_distance and not is_in_last_targets(target_point) then
                best_target = target_point
                best_distance = distance
            end
        end

        -- Ändere die Richtung leicht
        local angle = math.atan2(exploration_direction.y, exploration_direction.x) + math.random() * math.pi / 2 -
            math.pi / 4
        exploration_direction.x = math.cos(angle)
        exploration_direction.y = math.sin(angle)
        attempts = attempts + 1
    end

    if best_target then
        add_to_last_targets(best_target)
        return best_target
    end

    console.print("Could not find a valid explored target after " .. max_attempts .. " attempts.")
    return nil
end

local function find_unstuck_target()
    local player_pos = get_player_position()
    local valid_targets = {}

    for x = -unstuck_target_distance, unstuck_target_distance, grid_size do
        for y = -unstuck_target_distance, unstuck_target_distance, grid_size do
            local point = vec3:new(
                player_pos:x() + x,
                player_pos:y() + y,
                player_pos:z()
            )

            local distance = calculate_distance(player_pos, point)
            if utility.is_point_walkeable(point) and distance >= 2 and distance <= unstuck_target_distance then
                table.insert(valid_targets, point)
            end
        end
    end

    if #valid_targets > 0 then
        return valid_targets[math.random(#valid_targets)]
    end

    return nil
end

local function find_target(include_explored)
    last_movement_direction = nil -- Reset the last movement direction

    if include_explored then
        return find_unstuck_target()
    else
        if exploration_mode == "unexplored" then
            local unexplored_target = find_central_unexplored_target()
            if unexplored_target then
                return unexplored_target
            else
                exploration_mode = "explored"
                console.print("No unexplored areas found. Switching to explored mode.")
                last_explored_targets = {} -- Reset last targets when switching modes
            end
        end

        if exploration_mode == "explored" then
            local explored_target = find_explored_direction_target()
            if explored_target then
                return explored_target
            else
                console.print("No valid explored targets found. Resetting exploration.")
                reset_exploration()
                exploration_mode = "unexplored"
                return find_central_unexplored_target()
            end
        end
    end

    return nil
end

-- A* pathfinding functions
local function heuristic(a, b)
    return calculate_distance(a, b)
end

local function get_neighbors(point)
    local neighbors = {}
    local directions = {
        { x = 1, y = 0 }, { x = -1, y = 0 }, { x = 0, y = 1 }, { x = 0, y = -1 },
        { x = 1, y = 1 }, { x = 1, y = -1 }, { x = -1, y = 1 }, { x = -1, y = -1 }
    }

    for _, dir in ipairs(directions) do
        local neighbor = vec3:new(
            point:x() + dir.x * grid_size,
            point:y() + dir.y * grid_size,
            point:z()
        )
        if utility.is_point_walkeable(neighbor) then
            -- Prüfen, ob die Richtung nicht der letzten Bewegungsrichtung entgegengesetzt ist
            if not last_movement_direction or
                (dir.x ~= -last_movement_direction.x or dir.y ~= -last_movement_direction.y) then
                table.insert(neighbors, neighbor)
            end
        end
    end

    -- Wenn keine anderen Optionen verfügbar sind, fügen Sie die entgegengesetzte Richtung hinzu
    if #neighbors == 0 and last_movement_direction then
        local back_direction = vec3:new(
            point:x() - last_movement_direction.x * grid_size,
            point:y() - last_movement_direction.y * grid_size,
            point:z()
        )
        if utility.is_point_walkeable(back_direction) then
            table.insert(neighbors, back_direction)
        end
    end

    return neighbors
end

local function reconstruct_path(came_from, current)
    local path = { current }
    while came_from[get_grid_key(current)] do
        current = came_from[get_grid_key(current)]
        table.insert(path, 1, current)
    end
    return path
end

local function a_star(start, goal)
    local open_set = { start }
    local came_from = {}
    local g_score = { [get_grid_key(start)] = 0 }
    local f_score = { [get_grid_key(start)] = heuristic(start, goal) }
    local literations = 0

    while #open_set > 0 do
        literations = literations + 1

        if literations > 1000 then
            console.print("Max Literations reached, aborting!")
            break
        end

        table.sort(open_set, function(a, b)
            return f_score[get_grid_key(a)] < f_score[get_grid_key(b)]
        end)
        local current = table.remove(open_set, 1)

        if calculate_distance(current, goal) < grid_size then
            return reconstruct_path(came_from, current)
        end

        for _, neighbor in ipairs(get_neighbors(current)) do
            local tentative_g_score = g_score[get_grid_key(current)] + calculate_distance(current, neighbor)

            if not g_score[get_grid_key(neighbor)] or tentative_g_score < g_score[get_grid_key(neighbor)] then
                came_from[get_grid_key(neighbor)] = current
                g_score[get_grid_key(neighbor)] = tentative_g_score
                f_score[get_grid_key(neighbor)] = g_score[get_grid_key(neighbor)] + heuristic(neighbor, goal)

                local is_in_open_set = false
                for _, node in ipairs(open_set) do
                    if get_grid_key(node) == get_grid_key(neighbor) then
                        is_in_open_set = true
                        break
                    end
                end

                if not is_in_open_set then
                    table.insert(open_set, neighbor)
                end
            end
        end
    end

    return nil -- No path found
end

local function move_to_target()
    if target_position then
        local player_pos = get_player_position()

        -- Check if the player is more than 20 meters away from the target position
        if calculate_distance(player_pos, target_position) > 20 then
            target_position = find_target(false)
            current_path = {}
            path_index = 1
            return
        end

        if not current_path or #current_path == 0 or path_index > #current_path then
            current_path = a_star(player_pos, target_position)
            path_index = 1
            if not current_path then
                console.print("No path found to target. Finding new target.")
                target_position = find_target(false)
                return
            end
        end

        local next_point = current_path[path_index]
        pathfinder.request_move(next_point)

        if calculate_distance(player_pos, next_point) < grid_size then
            local direction = {
                x = next_point:x() - player_pos:x(),
                y = next_point:y() - player_pos:y()
            }
            last_movement_direction = direction
            path_index = path_index + 1
        end

        if calculate_distance(player_pos, target_position) < 2 then
            mark_area_as_explored(player_pos, exploration_radius)
            target_position = nil
            current_path = {}
            path_index = 1

            -- Überprüfe, ob es neue unerforschte Bereiche gibt
            if exploration_mode == "explored" then
                local unexplored_target = find_central_unexplored_target()
                if unexplored_target then
                    exploration_mode = "unexplored"
                    console.print("Found new unexplored area. Switching back to unexplored mode.")
                    last_explored_targets = {} -- Reset last targets when switching modes
                end
            end
        end
    else
        target_position = find_target(false)
    end
end

local function check_if_stuck()
    local current_pos = get_player_position()
    local current_time = os.time()

    if last_position and calculate_distance(current_pos, last_position) < 0.1 then
        if current_time - last_move_time > stuck_threshold then
            return true
        end
    else
        last_move_time = current_time
    end

    last_position = current_pos

    return false
end

function explorer:set_custom_target(target)
    target_position = target
end

on_render(function()
    if utils.player_on_quest(enums.quests.pit_ongoing) and settings.enabled then
        check_walkable_area()

        local is_stuck = check_if_stuck()

        if is_stuck then
            console.print("Character was stuck. Finding new target.")
            target_position = find_target(true)
            last_move_time = os.time()
            current_path = {}
            path_index = 1
        end

        move_to_target()

        if target_position then
            graphics.text_3d("TARGET", target_position, 20, color_red(255))
        end

        if current_path then
            for i, point in ipairs(current_path) do
                local color = (i == path_index) and color_green(255) or color_yellow(255)
                graphics.text_3d("PATH", point, 15, color)
            end
        end

        graphics.text_2d("Mode: " .. exploration_mode, vec2:new(10, 10), 20, color_white(255))
    end
end)

return explorer
