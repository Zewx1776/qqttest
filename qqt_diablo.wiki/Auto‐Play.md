# **Auto Play Documentation**

## Overview
The Auto Play component provides functionalities to manage automated gameplay. It allows setting various parameters and states related to automated dungeon running and other activities.

## Functions

### Is Active
`auto_play.is_active()`

> [!NOTE]
> Checks if the auto play is fully active.
> - Returns: A boolean indicating whether auto play is active.

### Set Profile Active
`auto_play.set_is_profile_active(state)`

> [!NOTE]
> Sets the state of the profile to active or inactive.
> - Parameters:
>   - `state`: A boolean value indicating the desired state.

### Set Selected Dungeon Text
`auto_play.set_selected_dungeon_text(text)`

> [!NOTE]
> Sets the text for the selected dungeon.
> - Parameters:
>   - `text`: A string representing the dungeon text.

### Set Dungeon Entrance Name
`auto_play.set_dungeon_entrance_name(text)`

> [!NOTE]
> Sets the name of the dungeon entrance.
> - Parameters:
>   - `text`: A string representing the dungeon entrance name.

### Set Dungeon Map Name
`auto_play.set_dungeon_map_name(text)`

> [!NOTE]
> Sets the name of the dungeon map.
> - Parameters:
>   - `text`: A string representing the dungeon map name.

### Set World Map Name
`auto_play.set_world_map_name(text)`

> [!NOTE]
> Sets the name of the world map.
> - Parameters:
>   - `text`: A string representing the world map name.

### Set Dungeon Entry Point
`auto_play.set_dungeon_entry_point(point)`

> [!NOTE]
> Sets the entry point for the dungeon.
> - Parameters:
>   - `point`: A `vec3` object representing the entry point coordinates.

### Set World Waypoints
`auto_play.set_world_waypoints(waypoints_table)`

> [!NOTE]
> Sets the waypoints for the world map.
> - Parameters:
>   - `waypoints_table`: A table of `vec3` objects representing the waypoints.

### Set Dungeon Waypoints
`auto_play.set_dungeon_waypoints(waypoints_table)`

> [!NOTE]
> Sets the waypoints for the dungeon.
> - Parameters:
>   - `waypoints_table`: A table of `vec3` objects representing the waypoints.

### Get Objective
`auto_play.get_objective()`

> [!NOTE]
> Gets the current objective.
> - Returns: An integer representing the current objective.

## Enum: objective
The `objective` enum defines the different objectives that can be set for auto play. These objectives determine the tasks that the auto play system will focus on.

### Enum Values
- `unknown`: Represents an unknown objective.
- `revive`: Represents the objective to revive the character.
- `fight`: Represents the objective to engage in combat.
- `quest`: Represents the objective to complete quests.
- `travel`: Represents the objective to travel to a location.
- `loot`: Represents the objective to loot items.
- `sell`: Represents the objective to sell items.
- `reset`: Represents the objective to reset the dungeon or instance.
