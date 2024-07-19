# **Vector2 Class Documentation**

## Overview
The `vector2` (vec2) class is a fundamental component for representing and manipulating 2D coordinates. It's extensively used for various calculations and graphical representations in the game.

## Vec2 Constructors
### Create New Vector2 Object
`vec2(x, y)`
- `x`: Number - The x-coordinate of the vector.
- `y`: Number - The y-coordinate of the vector.

> [!NOTE]
> Initializes a new `vec2` object with the specified x and y coordinates, essential for 2D spatial operations.

## Vec2 Methods

### X & Y Coordinates
- `.x`: Returns the x-coordinate (Number).
- `.y`: Returns the y-coordinate (Number).

### Check for Zero Vector
`is_zero()` -> Boolean
> Determines if the vector represents a zero vector (both x and y are zero).

### Project to 3D
`project_3d()` -> [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3)
> Projects the 2D vector into a 3D space, creating a `vec3` object.

### Calculate Distance
`distance(other)` -> Number
- `other`: [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2) - Another vector to measure distance to.

> Calculates the Euclidean distance to another `vec2`.

### Calculate Squared Distance
`distance_squared(other)` -> Number
- `other`: [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2) - The other vector.

> Returns the squared distance to another `vec2`, useful for performance-sensitive calculations.

### Check for Intersection
`intersects()` -> Boolean
> Evaluates if this vector intersects with another object or vector.

### Vector Length
`length()` -> Number
> Computes the length (magnitude) of the vector.

### Dot Product
`dot_product(other)` -> Number
- `other`: [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2) - The vector to dot with.

> Calculates the dot product with another `vec2`.

### Get Unit Vector
`get_unit_vector()` -> [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2)
> Returns the normalized unit vector of this vector.

### Calculate Angle
`get_angle(point, origin)` -> Number
- `point`: [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2) - The point vector.
- `origin`: [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2) - The origin vector.

> Determines the angle to a point from an origin.

### Extend Towards Target
`get_extended(target, dist)` -> [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2)
- `target`: [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2) - The target vector.
- `dist`: Number - Distance to extend.

> Extends the vector towards a target by the specified distance.

### Screen to Game Coordinates
`screen_to_coordinate()` -> [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2)
> Converts screen coordinates to corresponding game coordinates.

### Game to Screen Coordinates
`coordinate_to_screen()` -> [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2)
> Translates game coordinates to screen coordinates.

### Rotate Around Origin
`rotate_around(origin, degree)` -> [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2)
- `origin`: [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2) - The pivot point for rotation.
- `degree`: Number - The angle in degrees for rotation.

> Rotates this vector around a specified origin by a given degree.

### Check Equality
`equals(other)` -> Boolean
- `other`: [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2) - The vector to compare with.

> Evaluates if this vector is equal to another `vec2`.
