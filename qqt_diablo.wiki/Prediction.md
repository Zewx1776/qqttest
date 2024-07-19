# **Prediction Module Documentation**

## Overview
The Prediction module is essential for enhancing interaction and engagement with moving objects and spells within the game environment. It provides functions and tools for predicting the movement of units and the interaction of spells, allowing for more strategic gameplay.

## Classes and User Types

### `prediction_parameters`
A class that holds parameters used for making predictions about spell casts.

- **Constructors**:
  - `prediction_parameters(vec3, float)`
- **Properties**:
  - `cast_origin`: vec3 - The origin point of the cast.
  - `intersection`: float - The intersection parameter used in calculations.

### `prediction_result_candidates`
A class that stores potential results of prediction calculations.

- **Constructors**:
  - `prediction_result_candidates()`
- **Properties**:
  - `center_position`: vec3 - The center position of the prediction area.
  - `intersection_position`: vec3 - The intersection position within the prediction area.
  - `max_intersection_position`: vec3 - The position with the maximum intersection.

### `prediction_result`
A class encapsulating the results of a prediction.

- **Constructors**:
  - `prediction_result()`
- **Properties**:
  - `hitchance`: float - The chance of hitting the target.
  - `cast_position`: vec3 - The position from which to cast the spell.
  - `time_to_hit`: float - The time it will take for the spell to hit the target.
  - `candidates`: `prediction_result_candidates` - The candidates of prediction results.

## Functions

### Get Prediction Result
`prediction.get_prediction_result(target, params, spell_data, debug_call)`
- Retrieves the prediction result for a given target, spell, and set of parameters.
- `target`: game::object* - The target object.
- `params`: prediction_parameters - The parameters for the prediction.
- `spell_data`: spell_data - The data regarding the spell.
- `debug_call`: bool - Whether to output debug information.

### Get Future Unit Position
`prediction.get_future_unit_position(unit, time)`
- Predicts the future position of a unit after a specified time.
- `unit`: game::object* - The unit whose position to predict.
- `time`: float - The time after which to predict the unit's position.

### Get Intersection Position
`prediction.get_intersection_position(origin, center_position, intersection)`
- Calculates the intersection position based on given parameters.
- `origin`: vec3 - The origin point for the calculation.
- `center_position`: vec3 - The central point for the calculation.
- `intersection`: float - The intersection distance.

### Get Cast Position
`prediction.get_cast_position(target, params, spell_data, prediction_result_ptr)`
- Determines the optimal cast position for a spell on a given target.
- `target`: game::object* - The target of the spell.
- `params`: prediction_parameters - Parameters used for prediction.
- `spell_data`: spell_data - Data about the spell.
- `prediction_result_ptr`: prediction_result* - Pointer to store the result of the prediction.

### Get Hit Time
`prediction.get_hit_time(source, point, speed, delay, extra_network_time, hitbox, debug_mode)`
- Calculates the time it will take for a hit to occur from the source to the target point.
- `source`: vec3 - The source position.
- `point`: vec3 - The target point.
- `speed`: float - The speed of the projectile or unit.
- `delay`: float - The delay before the projectile or action starts.
- `extra_network_time`: float - Additional network delay to consider.
- `hitbox`: float - The hitbox size of the target.
- `debug_mode`: bool - If true, outputs debug information.

### Get Collisions (Circular and Rectangular)
- `prediction.get_collisions_circular(radius, center)`
  - Determines circular collision points within a specified radius.
  - `radius`: float - The radius of the circle.
  - `center`: vec3 - The center of the circle.
- `prediction.get_collisions_rectangular(from, to, width)`
  - Determines rectangular collision points within a specified area.
  - `from`: vec3 - The starting point of the rectangle.
  - `to`: vec3 - The ending point of the rectangle.
  - `width`: float - The width of the rectangle.

### Wall Collision Check
`prediction.is_wall_collision(from, to, width)`
- Checks if a path between two points collides with a wall within a specified width.
- `from`: vec3 - The starting point of the path.
- `to`: vec3 - The ending point of the path.
- `width`: float - The width of the path to check.