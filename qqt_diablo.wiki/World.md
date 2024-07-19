# **World Class Documentation**

## Overview
The `world` class in the Diablo Lua API is essential for accessing information about the game world, including details about the current zone and world identifiers.

## Accessing Current World Data
To retrieve the current world instance from the game memory, use the following function provided by the Lua API:

```lua
local current_world = world.get_current_world()
```

This function fetches the active `world` instance, allowing scripts to interact with and retrieve information about the game world.

## World Class Methods

### Get World Name
`get_name()`
> Retrieves the name of the world.
> - Returns: String - The name of the world.

### Get Current Zone Name
`get_current_zone_name()`
> Fetches the name of the current zone within the world.
> - Returns: String - The name of the current zone.

### Get World ID
`get_world_id()`
> Obtains the unique identifier of the world.
> - Returns: Integer - The ID of the world.

> [!NOTE]
> The `world` class methods provide key insights into the game's environment, offering scripts the ability to adapt and respond to different world settings and zones dynamically. Accessing the current world instance is crucial for scripts that depend on the context of the player's location and the overall game environment.


## Example Usage
```lua
-- Example: Fetching information about the current game world
local world_instance = world.get_current_world()
if world_instance then
    local world_name = world_instance:get_name()
    local zone_name = world_instance:get_current_zone_name()
    local world_id = world_instance:get_world_id()

    console.print("World Name: ",  world_name)
    console.print("Current Zone: ", zone_name)
    console.print("World ID: ", world_id)
end
```