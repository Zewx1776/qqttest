# **Utility Module Documentation**

## Functions

### Is Spell Ready
`utility.is_spell_ready(spell_id)`
- `spell_id`: number (int) - The identifier of the spell to check.

> [!NOTE]
> Determines if a specific spell is ready to be cast.
> - Returns: `bool`

### Is Spell Affordable
`utility.is_spell_affordable(spell_id)`
- `spell_id`: number (int) - The identifier of the spell to check affordability.

> [!NOTE]
> Checks if a spell can be afforded based on current resources.
> - Returns: `bool`

### Can Cast Spell
`utility.can_cast_spell(spell_id)`
- `spell_id`: number (int) - The identifier of the spell to check castability.

> [!NOTE]
> Evaluates both is_spell_ready and is_spell_affordable
> - Returns: `bool`

### Get Units Inside Circle
`utility.get_units_inside_circle_list(center, radius)`
- `center`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The center point of the circle.
- `radius`: number (float) - The radius of the circle.

> [!NOTE]
> Retrieves a list of units within a specified circular area.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get Units Inside Rectangle
`utility.get_units_inside_rectangle_list(origin, destination, width)`
- `origin`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The starting point of the rectangle.
- `destination`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The ending point of the rectangle.
- `width`: number (float) - The width of the rectangle.

> [!NOTE]
> Retrieves a list of units within a specified rectangular area.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Count Units Inside Circle
`utility.get_amount_of_units_inside_circle(center, radius)`
- `center`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The center point of the circle.
- `radius`: number (float) - The radius of the circle.

> [!NOTE]
> Counts the number of units within a circular area.
> - Returns: number (int)

### Count Units Inside Rectangle
`utility.get_amount_of_units_inside_rectangle(origin, destination, width)`
- `origin`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The starting point of the rectangle.
- `destination`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The ending point of the rectangle.
- `width`: number (float) - The width of the rectangle.

> [!NOTE]
> Counts the number of units within a rectangular area.
> - Returns: number (int)

## Utility Functions

### Set Map Pin
`utility.set_map_pin(point)`
- `point`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The point where the map pin should be set.

> [!NOTE]
> Sets a pin at a specific point on the map. This can be useful for marking locations for navigation or other purposes.
> - Returns: `bool` indicating whether the pin was successfully set.


### Is Point Walkable
`utility.is_point_walkeable(point)`
- `point`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The point to check walkability.

> [!NOTE]
> Determines if a given point in the game world is walkable.
> - Returns: `bool` indicating whether the point is walkable.

### Is Point Walkable Exception
`utility.is_point_walkeable_exception(point)`
- `point`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The point to check walkability with exceptions.

> [!NOTE]
> Determines if a given point in the game world is walkable, considering specific exceptions.
> - Returns: `bool` indicating whether the point is walkable with exceptions.

### Is Point Walkable Heavy
`utility.is_point_walkeable_heavy(point)`
- `point`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The point to check walkability with a heavier computation.

> [!NOTE]
> Determines if a given point in the game world is walkable using a more computationally heavy method.
> - Returns: `bool` indicating whether the point is walkable.

### Ray Cast Walkability
Determines if a path from the origin point to the destination point is walkable within a given width, checking at specified step intervals.

`utility.is_ray_cast_walkeable(origin, destination, width, steps_distance)`
- `origin`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The starting point of the raycast.
- `destination`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The endpoint of the raycast.
- `width`: number (float) - The width of the raycast area.
- `steps_distance`: number (float) - The distance between each step of the raycast check.

> [!NOTE]
> Returns `bool` indicating whether the entire specified path is walkable.

### Get Raycast Table
Returns a table containing information about the raycast from an origin to a destination within a specified width, checking at given step intervals.

`utility.get_raycast_table(origin, destination, width, steps_distance)`
- `origin`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The starting point of the raycast.
- `destination`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The endpoint of the raycast.
- `width`: number (float) - The width of the raycast area.
- `steps_distance`: number (float) - The distance between each step of the raycast.

> [!NOTE]
> Returns a table of results from the raycast, potentially including hit information and exact points of collision or walkability.

### Set Height of Valid Position
Adjusts the height of a given point to the floor world level, not 100% reliable but works very often.

`utility.set_height_of_valid_position(point)`
- `point`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The point to adjust height.

> [!NOTE]
> Modifies the input `vec3` to reflect the correct walkable height based on the game world's terrain data.
> - Returns: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) with the adjusted height.

## Code Example, Bruteforce Simple Pathfinder

> [!NOTE]
> Its just an example, not a finished feature

```lua
local pathfinding_state = {
    open_list = {},
    closed_list = {},
    iterations = 0,
    max_iterations = 100000,
    path_complete = true,
    current_path = {}
}

local function distance(pos1, pos2)
    return math.sqrt((pos1:x() - pos2:x())^2 + (pos1:y() - pos2:y())^2 + (pos1:z() - pos2:z())^2)
end

local function get_neighbors(pos)
    local neighbors = {}
    local directions = {
        vec3:new(1, 0, 0), vec3:new(-1, 0, 0),
        vec3:new(0, 1, 0), vec3:new(0, -1, 0),
        vec3:new(0, 0, 1), vec3:new(0, 0, -1)
    }

    -- utility.set_height_of_valid_position()
    for _, dir in ipairs(directions) do
        table.insert(neighbors, vec3:new(pos:x() + dir:x(), pos:y() + dir:y(), pos:z() + dir:z()))
    end
    return neighbors
end

local function is_in_list(list, pos)
    for _, node in ipairs(list) do
        if node.pos:x() == pos:x() and node.pos:y() == pos:y() and node.pos:z() == pos:z() then
            return true
        end
    end
    return false
end

local function get_node_from_list(list, pos)
    for _, node in ipairs(list) do
        if node.pos:x() == pos:x() and node.pos:y() == pos:y() and node.pos:z() == pos:z() then
            return node
        end
    end
    return nil
end

local function continue_pathfinding(goal_position, max_distance)
    local start_time = os.clock()
    local time_limit = 0.02 -- 0.2 ms per frame

    while os.clock() - start_time < time_limit and not pathfinding_state.path_complete do
        if #pathfinding_state.open_list == 0 or pathfinding_state.iterations >= pathfinding_state.max_iterations then
            pathfinding_state.path_complete = true
            break
        end

        -- perform a single iteration of pathfinding
        -- ensure this part is optimized as discussed

        if #pathfinding_state.open_list == 0 or pathfinding_state.iterations >= pathfinding_state.max_iterations then
            pathfinding_state.path_complete = true
            break
        end

        pathfinding_state.iterations = pathfinding_state.iterations + 1
        table.sort(pathfinding_state.open_list, function(a, b) return (a.g + a.h) < (b.g + b.h) end)
        local current = table.remove(pathfinding_state.open_list, 1)
        table.insert(pathfinding_state.closed_list, current)

        if distance(current.pos, goal_position) < 1 or #pathfinding_state.current_path >= max_distance then
            while current.parent do
                table.insert(pathfinding_state.current_path, 1, current.pos)
                current = current.parent
            end

            local start_time_ = pathfinding_state.start_time
            local end_time =  os.clock()
            local work_time = end_time - start_time_
            console.print("path solved, time: " .. work_time)
            pathfinding_state.path_complete = true
            break
        end

        local neighbors = get_neighbors(current.pos)
        for _, neighbor in ipairs(neighbors) do
            local neighbor_adjusted = utility.set_height_of_valid_position(neighbor)
            if not is_in_list(pathfinding_state.closed_list, neighbor) and utility.is_point_walkeable(neighbor_adjusted) then
                local g = current.g + distance(current.pos, neighbor)
                local h = distance(neighbor, goal_position)
                local neighbor_node = {pos = neighbor, g = g, h = h, parent = current}

                if not is_in_list(pathfinding_state.open_list, neighbor) then
                    table.insert(pathfinding_state.open_list, neighbor_node)
                else
                    local existing = get_node_from_list(pathfinding_state.open_list, neighbor)
                    if existing and g < existing.g then
                        existing.g = g
                        existing.parent = current
                    end
                end
            end
        end
    end
end

local function initiate_pathfinding(player_pos, goal_position, max_distance)
    pathfinding_state.open_list = {{pos = player_pos, g = 0, h = distance(player_pos, goal_position)}}
    pathfinding_state.closed_list = {}
    pathfinding_state.iterations = 0
    pathfinding_state.path_complete = false
    pathfinding_state.current_path = {}
    pathfinding_state.start_time = os.clock()
    console.print("initiate_pathfinding " .. os.clock())
end

local max_distance = 50
local start_pos = nil
local goal_position = nil

local debug_enabled = false
local function debug_performance(start_time, label)
    if not debug_enabled then
        return
    end
    local elapsed = os.clock() - start_time
    console.print(label .. " took: " .. elapsed .. " ms")
end

on_render(function()
    local current_time = os.clock()

    -- current_time - last_cache_update >= update_interval and not 
    if not pathfinding_state.path_complete then
        local start_time = os.clock()
        continue_pathfinding(goal_position, max_distance)
        debug_performance(start_time, "Pathfinding Iteration")
        last_cache_update = current_time
    end

    for i, pos in ipairs(pathfinding_state.current_path) do
        graphics.circle_3d(pos, 0.3, color_gold(255), 2.0)
    end
end)

on_key_release(function(key)
    if key ~= 4 then
        return
    end

    start_pos = get_player_position()
    goal_position = get_cursor_position()
    max_distance = 50

    -- utility.set_height_of_valid_position()
    initiate_pathfinding(start_pos, goal_position, max_distance)
    goal_position = goal_position
end)
```