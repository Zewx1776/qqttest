# **Evade Module Documentation**

## Spell Registration
Evade supports the registration of circular, rectangular, and cone-shaped spells for improved gameplay awareness and response.

### Circular Spell Registration
`evade.register_circular_spell(internal_names, menu_name, radius, color, danger_lvl, explosion_delay, is_moving, set_to_player_pos, set_to_player_pos_delay)`
- `internal_names`: Array of Strings - The internal names of the spell particles, like `["monsterAffix_FireOrbs", "anotherParticleName"]`.
- `menu_name`: String - The user-friendly name of the spell that will appear in menus.
- `radius`: Float - The radius of the circular spell area.
- `color`: [color](https://github.com/qqtnn/diablo_lua_documentation/wiki/Color) - The default color used for visualization.
- `danger_lvl`: `evade::danger_levels` - The danger level of the spell.
- `explosion_delay`: Float - The delay before the spell explodes.
- `is_moving`: Boolean - Indicates whether the spell moves.
- `set_to_player_pos`: Boolean - If true, positions the spell relative to the player's position.
- `set_to_player_pos_delay`: Float - Delay before setting the spell to the player's position.

### Rectangular Spell Registration
`evade.register_rectangular_spell(identifier, names_v, width, length, color, is_dynamic, danger_lvl, is_projectile, projectile_speed, max_time_alive, set_pos_to_player_on_creation, set_to_player_pos_delay)`
- `identifier`: String - A unique identifier for the spell.
- `names_v`: Array of Strings - The internal names of the spell particles.
- `width`: Float - The width of the rectangular spell area.
- `length`: Float - The length of the rectangular spell area.
- `color`: [color](https://github.com/qqtnn/diablo_lua_documentation/wiki/Color) - The RGBA color used for visualization.
- `is_dynamic`: Boolean - Indicates if the rectangular area changes positions or dimensions dynamically during gameplay.
- `danger_lvl`: `evade::danger_levels` - The danger level of the spell.
- `is_projectile`: Boolean - Indicates whether the spell is a projectile.
- `projectile_speed`: Float - The speed of the projectile.
- `max_time_alive`: Float - Maximum time the spell stays active.
- `set_pos_to_player_on_creation`: Boolean - Positions the spell relative to the player when created.
- `set_to_player_pos_delay`: Float - Delay before setting the spell to the player's position.

### Cone Spell Registration
`evade.register_cone_spell(identifier, names_v, radius, angle, color, danger_lvl, explosion_delay, is_moving)`
- `identifier`: String - A unique identifier for the spell.
- `names_v`: Array of Strings - The internal names of the spell particles.
- `radius`: Float - The radius of the cone's circular base.
- `angle`: Float - The angle of the cone in degrees.
- `color`: [color](https://github.com/qqtnn/diablo_lua_documentation/wiki/Color) - The RGBA color used for visualization.
- `danger_lvl`: `evade::danger_levels` - The danger level of the spell.
- `explosion_delay`: Float - The delay before the spell explodes.
- `is_moving`: Boolean - Indicates whether the spell moves.

> [!TIP]
> Code Example

```lua
local initialized_evade_db = false

-- Main update function to register spells
on_update(function ()
    if initialized_evade_db then
        -- Prevent re-initialization to avoid duplicate registrations
        return
    end

    -- Example: Registering a circular spell
    local circular_spell_particles = {"fire_orb_explosion_example", "mage_fire_blast_example"}
    local circular_spell_name = "Fire Blast Example"
    local circular_spell_radius = 5.0
    local circular_spell_color = color.new(255, 0, 0, 255) -- RGBA: Red
    local circular_spell_danger_level = danger_level.high
    local circular_spell_delay = 2.0
    local circular_spell_moving = true
    local circular_spell_set_to_player_pos = false
    local circular_spell_set_to_player_pos_delay = 0.5

    evade.register_circular_spell(circular_spell_particles, circular_spell_name, circular_spell_radius,
                                  circular_spell_color, circular_spell_danger_level, circular_spell_delay,
                                  circular_spell_moving, circular_spell_set_to_player_pos, circular_spell_set_to_player_pos_delay)

    -- Example: Registering a rectangular spell
    local rectangle_spell_identifier = "Charged Strike Example"
    local rectangle_spell_particles = {"warrior_charge_example", "ground_impact_example"}
    local rectangle_spell_width = 2.5
    local rectangle_spell_length = 12.0
    local rectangle_spell_color = color.new(0, 0, 255, 255) -- RGBA: Blue
    local rectangle_spell_dynamic = true
    local rectangle_spell_danger_level = danger_level.medium
    local rectangle_spell_is_projectile = true
    local rectangle_spell_speed = 10.0
    local rectangle_spell_max_time_alive = 3.0
    local rectangle_spell_set_to_player_pos_on_creation = false
    local rectangle_spell_set_to_player_pos_delay = 0.5

    evade.register_rectangular_spell(rectangle_spell_identifier, rectangle_spell_particles, rectangle_spell_width,
                                     rectangle_spell_length, rectangle_spell_color, rectangle_spell_dynamic,
                                     rectangle_spell_danger_level, rectangle_spell_is_projectile, rectangle_spell_speed,
                                     rectangle_spell_max_time_alive, rectangle_spell_set_to_player_pos_on_creation, rectangle_spell_set_to_player_pos_delay)

    -- Example: Registering a cone spell
    local cone_spell_identifier = "Dragon's Breath Example"
    local cone_spell_particles = {"dragon_fire_example", "burning_wind_example"}
    local cone_spell_radius = 7.0
    local cone_spell_angle = 90
    local cone_spell_color = color.new(255, 165, 0, 255) -- RGBA: Orange
    local cone_spell_danger_level = danger_level.high
    local cone_spell_delay = 3.0
    local cone_spell_moving = false

    evade.register_cone_spell(cone_spell_identifier, cone_spell_particles, cone_spell_radius, cone_spell_angle,
                              cone_spell_color, cone_spell_danger_level, cone_spell_delay, cone_spell_moving)

    -- Mark as initialized to prevent re-inserting information
    initialized_evade_db = true
end)
```

## Danger Zone Analysis
### Is Position Dangerous
`evade.is_dangerous_position(pos)`
- `pos`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The position to check.

> [!NOTE]
> Analyzes if a given position lies within a dangerous spell zone, which is crucial for character movement decisions.

### Is Path Through Danger Zone
`evade.is_position_passing_dangerous_zone(pos, source_pos)`
- `pos`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The target position.
- `source_pos`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The source position.

> [!NOTE]
> Checks if the path between two points intersects with any dangerous spell zones, aiding in pathfinding and movement strategies.

### Register Dash
`evade.register_dash(initialize_condition, dash_name, spell_id, range, cast_delay, enable_dash_usage_default_value, enable_dash_for_circular_spells_default_value, enable_dash_for_rect_spells)`
- `initialize_condition`: Boolean - Condition to initialize the dash registration.
- `dash_name`: String - Name of the dash ability.
- `spell_id`: Unsigned Integer - ID of the dash spell.
- `range`: Float - Range of the dash ability.
- `cast_delay`: Float - Delay before the dash is cast.
- `enable_dash_usage_default_value`: Boolean - Default value for enabling dash usage.
- `enable_dash_for_circular_spells_default_value`: Boolean - Default value for enabling dash for circular spells.
- `enable_dash_for_rect_spells`: Boolean - Default value for enabling dash for rectangular spells.

> [!NOTE]
> Registers a dash ability with specified parameters, adding it to the evade system for usage in character movement and avoidance.

> [!TIP]
> Code Example

```lua
local initialized_evade_dash_db = false;
on_update(function ()
    if initialized_evade_dash_db then
        -- only insert information 1 time
        return
    end

    local local_player = get_local_player()
    if not local_player then
        return
    end

    local spell_range = 4.5
    local cast_delay = 0.0
    local teleport_spell_id = 288106
    local is_sorcerer = local_player:get_character_class_id() == 0 -- 0 is sorcerer
    evade.register_dash(is_sorcerer, "Sorcerer Teleport", teleport_spell_id , spell_range , cast_delay, true, true, true)

    local spell_range = 6.5
    local cast_delay = 0.10
    local dash_spell_id = 358761
    local is_rogue= local_player:get_character_class_id() == 3 -- 3 is rogue
    evade.register_dash(is_rogue, "Rogue Dash", dash_spell_id, spell_range , cast_delay, true, true, true)

    initialized_evade_dash_db = true
end)
```
