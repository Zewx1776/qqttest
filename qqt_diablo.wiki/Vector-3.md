# **Vector3 Class Documentation**

## Overview
The `vector3` (vec3) class is essential for representing and manipulating 3D coordinates, widely used in spatial calculations and graphical positioning.

## Vec3 Constructors
### Create New Vector3 Object
`vec3(x, y, z)`
- `x`: Number - The x-coordinate of the vector.
- `y`: Number - The y-coordinate of the vector.
- `z`: Number - The z-coordinate of the vector.

### Copy Vector3 Object
`vec3(other)`
- `other`: `vec3` - Another vec3 object to copy.

> [!NOTE]
> These constructors allow for the creation of vec3 objects either from specific coordinates or as a copy of another vec3, facilitating 3D operations.

## Vec3 Methods

### Get Rotation
`get_rotation()` -> `vec3`
> Calculates and returns the rotation vector corresponding to the direction this vec3 is pointing.

### Normalize Rotation
`normalize_rotation()` -> `vec3`
> Normalizes the rotation component of this vec3, useful in rotational calculations.

### Normalize Vector
`normalize()` -> `vec3`
> Normalizes this vec3, scaling it to a unit vector while maintaining direction.

### X, Y, Z Coordinates
- `x()`: Returns the x-coordinate (Float).
- `y()`: Returns the y-coordinate (Float).
- `z()`: Returns the z-coordinate (Float).

### Equals Ignore Z
`equals_ignore_z(other)` -> Boolean
- `other`: `vec3` - The vector to compare with, ignoring Z coordinates.

> Checks if this vec3 is equal to another vec3, disregarding the Z coordinate.

### Equals Ignore Z with Threshold
`equals_ignore_z_threshold(other, threshold)` -> Boolean
- `other`: `vec3` - The vector to compare with.
- `threshold`: Number - The maximum allowed difference.

> Evaluates if this vec3 is approximately equal to another vec3 within a specified threshold, ignoring Z coordinates.

### Intersects
`intersects(segment_end, point, margin, radius, denominator)` -> Boolean
- `segment_end`: `vec3` - The end point of the line segment.
- `point`: `vec3` - The point to check for intersection.
- `margin`, `radius`, `denominator`: Numbers - Parameters for intersection calculation.

> Determines if a line segment from this vec3 to `segment_end` intersects a point within given margins.

### Is Facing
`is_facing(other)` -> Boolean
- `other`: `vec3` - The vector to check orientation against.

> Returns true if this vec3 is oriented towards the specified vector.

### To String
`to_string()` -> String
> Converts this vec3 to a string representation, displaying its coordinates.

### Randomize XZ
`randomize_xz(margin)`
- `margin`: Number - The range for randomization.

> Randomizes the X and Z coordinates within the specified margin, altering the vector's position.

### Length (2D and 3D)
- `length_2d()`: Calculates the 2D length (ignoring Z coordinate).
- `length_3d()`: Computes the full 3D length of the vector.
- `length_3d_ignore_z()`: Determines the 3D length, excluding Z coordinate.
- `length_3d_squared()`: Calculates the squared 3D length for performance efficiency.

### Distance Calculations
- `dist_to(other)`: Measures the distance to another vec3.
- `dist_to_ignore_z(other)`: Measures distance, ignoring Z coordinates.
- `squared_dist_to(other)`: Calculates the squared distance for efficiency.
- `squared_dist_to_ignore_z(other)`: Squared distance calculation, excluding Z.

> [!TIP]
> These distance methods are useful for determining proximity between points in both 2D and 3D contexts, with options to consider or ignore the Z-axis.

### Rotate Around
`rotate_around(origin, degree)` -> `vec3`
- `origin`: `vec3` - The pivot point for rotation.
- `degree`: Number - The angle in degrees for rotation.

> Rotates this vec3 around a specified origin point by a given degree, altering its orientation.

### Project to 2D
`project_2d()` -> [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2)
> Projects the vec3 onto a 2D plane, typically by ignoring the Y coordinate, and returns a vec2.

### Cross Product
`cross(other)` -> `vec3`
- `other`: `vec3` - The vector to cross with.

> Calculates the cross product with another vec3, yielding a vector perpendicular to both.

### Other Methods
- `get_unit_vector()`: Returns the normalized unit vector.
- `get_extended(target, units)`: Extends towards the target by a specified distance.
- `get_perp_left(origin, factor)`: Calculates the left perpendicular vector.
- `get_perp_right(origin, factor)`: Calculates the right perpendicular vector.
- `lerp(target, coefficient)`: Linear interpolation towards another vec3.
- `get_relative_angle(other)`: Angle relative to another vector.
- `is_nan()`: Checks for NaN values.
- `is_zero()`: Determines if the vector represents zero.
- `get_angle(target, origin)`: Angle to a target from an origin.
- `get_angle_side(target, origin)`: Angle including the side (left/right) relative to an origin.

> [!NOTE]
> The `vec3` class offers a comprehensive set of methods for 3D vector manipulation, pivotal for spatial calculations, movement, and graphical positioning in the Diablo Lua API.

> [!TIP]
> Use `get_player_position()` to get local player [vec3](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) position from [global_functions](https://github.com/qqtnn/diablo_lua_documentation/wiki/Global-Functions#get-player-position)
>
> Use `actors_manager.get_enemy_npcs()` to get a list of enemies [game_object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) from [Actors Manager](https://github.com/qqtnn/diablo_lua_documentation/wiki/Actors-Manager#get-enemy-npcs)
> 
> Use `vec3`:`squared_dist_to_ignore_z`(`vec3`) for performance
>

```lua
-- Example: Using vec3 in enemy proximity checks
local player_position = get_player_position();
local enemies = actors_manager.get_enemy_npcs();

for _, obj in ipairs(enemies) do
    local enemy_position = obj:get_position();
    -- note squared_dist_to_ignore_z for performance
    local distance_sqr = enemy_position:squared_dist_to_ignore_z(player_position);
    if distance_sqr > (2.0 * 2.0) then
        -- Skip if the enemy is not in melee range
        goto continue;
    end;

    -- Logic for close-range enemy interaction

    ::continue::
end;
```
