# **Target Selector Documentation**

## Overview
The Target Selector module offers a variety of functions for selecting targets based on specific criteria, enabling more strategic gameplay decision making.

### Data Types

#### `area_result`
- Constructor: `area_result()`
- Contains:
  - `.main_target`: Reference to a [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)
  - `.victim_list`: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)
  - `.n_hits`: Number of hits (int)
  - `.score`: Scoring value of the target area (float)

#### `area_result_light`
- Constructor: `area_result_light()`
- Contains:
  - `.main_target`: Reference to a [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)
  - `.n_hits`: Number of hits (int)
  - `.score`: Scoring value of the target area (float)

## Functions

### Is Valid Enemy
`target_selector.is_valid_enemy(obj)`
- `obj`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The object to check.

> [!NOTE]
> Determines if the provided game object is a valid enemy target.
> - Returns: `bool`

### Get PvP Target
`target_selector.get_pvp_target(source, dist)`
- `source`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The source position for targeting.
- `dist`: Distance in units to search for the target.

> [!NOTE]
> Retrieves the most suitable target for PvP within the specified distance from the source.
> - Returns: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get Closest Target
`target_selector.get_target_closer(source, dist)`
- `source`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The source position for targeting.
- `dist`: Distance in units to search for the target.

> [!NOTE]
> Finds the nearest target within the given distance from the source.
> - Returns: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get Least HP Target
`target_selector.get_target_low_hp(source, dist)`
- `source`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The source position for targeting.
- `dist`: Distance in units to search for the target.

> [!NOTE]
> Selects the target within range that has the lowest health.
> - Returns: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get Most HP Target
`target_selector.get_target_most_hp(source, dist)`
- `source`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The source position for targeting.
- `dist`: Distance in units to search for the target.

> [!NOTE]
> Chooses the target within range that has the highest health.
> - Returns: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get Target in Circular Area
`target_selector.get_target_area_circle(source, dist, radius, min_hits)`
- `source`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The source position for targeting.
- `radius`: Radius in units of the circular area.
- `min_hits`: Minimum number of targets required in the area (int).

> [!NOTE]
> Identifies the optimal target within a specified circular area, based on the minimum hits criteria.
> - Returns: `area_result` object

### Get Most Hits in Rectangle - Light
`target_selector.get_most_hits_target_rectangle_area_light(source, rect_length, rect_width, prio_champion)`
- `source`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The source position for targeting.
- `rect_length`: Length in units of the rectangular area.
- `rect_width`: Width in units of the rectangular area.
- `prio_champion`: Boolean indicating whether to prioritize champions.

> [!NOTE]
> Finds the target in a rectangular area that maximizes the hit count, with an option to prioritize champions.
> - Returns: `area_result_light` object

### Get Most Hits in Circle - Light
`target_selector.get_most_hits_target_circular_area_light(source, dist, radius, prio_champions)`
- `source`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The source position for targeting.
- `dist`: Distance in units to search for targets.
- `radius`: Radius in units of the circular area.
- `prio_champions`: Boolean indicating whether to prioritize champions.

> [!NOTE]
> Selects the target in a circular area that maximizes hit count, with an option to prioritize champions.
> - Returns: `area_result_light` object

### Get Most Hits in Rectangle - Heavy
`target_selector.get_most_hits_target_rectangle_area_heavy(source, rect_length, rect_width)`
- `source`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The source position for targeting.
- `rect_length`: Length in units of the rectangular area.
- `rect_width`: Width in units of the rectangular area.

> [!NOTE]
> Identifies the best target in a rectangular area based on the maximum number of hits possible.
> - Returns: `area_result` object

### Get Most Hits in Circle - Heavy
`target_selector.get_most_hits_target_circular_area_heavy(source, dist, radius)`
- `source`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The source position for targeting.
- `dist`: Distance in units to search for targets.
- `radius`: Radius in units of the circular area.

> [!NOTE]
> Determines the optimal target in a circular area based on the maximum number of hits possible.
> - Returns: `area_result` object

```lua
local function generate_points_around_target(target_position, radius, num_points)
    local points = {};
    for i = 1, num_points do
        local angle = (i - 1) * (2 * math.pi / num_points);
        local x = target_position:x() + radius * math.cos(angle);
        local y = target_position:y() + radius * math.sin(angle);
        table.insert(points, vec3.new(x, y, target_position:z()));
    end
    return points;
end

local function get_best_point(target_position, width, current_hits)
    local radius = width * 0.5;
    local points = generate_points_around_target(target_position, radius * 0.75, 8); -- Generate 8 points around target
    local hit_table = {};

    for _, point in ipairs(points) do
        local hits = utility.get_amount_of_units_inside_circle(point, radius);
        table.insert(hit_table, {point = point, hits = hits});
        graphics.circle_3d(point, radius, color_red(100))
    end

    -- sort by the number of hits
    table.sort(hit_table, function(a, b) return a.hits > b.hits end);

    if hit_table[1].hits > current_hits then
        return hit_table[1].point; -- returning the point with the most hits
    end
    
    return target_position;
end

-- register on_update callback to call the code each frame
on_update(function()

    -- filter the code to work only with orbwalker runing some mode
    if orbwalker.get_orb_mode() == orb_mode.none then
        return;
    end;
    
    local circle_width = 7.5;
    local circle_radius = circle_width * 0.5;
    local player_position = get_player_position();
    local area_data = target_selector.get_most_hits_target_circular_area_heavy(player_position, 10.0, circle_radius)
    local best_target = area_data.main_target;
    
    if not best_target then
        return;
    end

    local current_hits = area_data.n_hits;
    local best_target_position = best_target:get_position();
    local best_cast_position = get_best_point(best_target_position, circle_width, current_hits);

    local spell_id = 915150;
    if cast_spell.position(spell_id, best_cast_position) then
        console.print("Casted Circle Are Spell Successfully"); -- in the best position where hits most units
        return;
    end
end);
```

> Green circle represents the position where it would cast to hit most of the units

![](https://aimsharp.net/wp-content/uploads/2023/12/d3.jpg)

### Get Nearby Target List
`target_selector.get_near_target_list(source, max_range)`
- `source`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The source position for targeting.
- `max_range`: Maximum range in units to include targets.

> [!NOTE]
> Retrieves a list of all potential targets within the specified range from the source.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Find Quick Champion
`target_selector.get_quick_champion(source, max_range)`
- `source`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The source position for targeting.
- `max_range`: Maximum range in units to search for the champion.

> [!NOTE]
> Locates the nearest enemy champion within the given range from the source.
> - Returns: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Is Wall Collision
`target_selector.is_wall_collision(source, target, width)`
- `source`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The source position for the check.
- `target`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The target object.
- `width`: Width in units of the path to check for collision.

> [!NOTE]
> Determines if there is a wall collision between the source position and the target along a specified path width.
> - Returns: `bool`

### Is Unit Collision
`target_selector.is_unit_collision(source, target, width)`
- `source`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The source position for the check.
- `target`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The target object.
- `width`: Width in units of the path to check for collision.

> [!NOTE]
> Determines if there is any unit collision between the source position and the target along a specified path width.
> - Returns: `bool`

