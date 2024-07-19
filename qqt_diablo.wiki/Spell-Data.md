# `spell_data` Usertype Documentation

The `spell_data` usertype in Lua provides a structured way to handle various attributes of spells in game programming, allowing for detailed configuration and prediction calculations. Below are the properties and constructor parameters available for use.

## Constructor

The `spell_data` constructor allows for creating new spell data instances with specific attributes. It accepts the following parameters:

- **radius**: `float` - The radius of the spell effect.
- **range**: `float` - The maximum range of the spell.
- **cast_delay**: `float` - The delay before the spell is cast, in seconds.
- **projectile_speed**: `float` - The speed of the spell's projectile.
- **has_wall_collision**: `bool` - Indicates whether the spell's projectile can collide with walls.
- **spell_id**: `int32_t` - A unique identifier for the spell.
- **geometry_type**: `prediction::spell_geometry` - The geometric type of the spell, defining its shape and area of effect.
- **targeting_type**: `prediction::targeting_type` - The targeting mechanism type of the spell.

Example of constructing a `spell_data` object:
```lua
local spell_data = spell_data:new(
    3.0,                        -- radius
    9.0,                        -- range
    1.5,                        -- cast_delay
    3.0,                        -- projectile_speed
    true,                       -- has_collision
    spell_id_barrage,           -- spell_id
    spell_geometry.rectangular, -- geometry_type
    targeting_type.skillshot    --targeting_type
)
```

## Properties

Each `spell_data` object offers access to its defined properties, allowing adjustments and real-time updates based on gameplay dynamics:

- **radius**: Manages the operational radius of the spell's effect, adaptable to different gameplay scenarios.
- **range**: Sets the operational range within which the spell can be effectively cast.
- **cast_delay**: Controls the initiation time before the spell's effect begins, crucial for timing strategies in gameplay.
- **projectile_speed**: Determines the travel speed of the spell's projectiles, affecting how quickly they reach their target.
- **has_wall_collision**: Indicates if the spell's projectiles are meant to interact with environmental obstacles.
- **spell_id**: Acts as a unique reference for the spell, important for tracking and differentiating between multiple spells.
- **geometry_type**: Describes the physical shape of the spell's effect area, important for visual and mechanical aspects of the spell.
- **targeting_type**: Details the targeting mechanics of the spell, influencing how it selects and affects targets within the game environment.

This usertype is integral for developers to finely tune the characteristics and behaviors of spells in game development, ensuring that each spell operates according to specific gameplay requirements and strategies.

