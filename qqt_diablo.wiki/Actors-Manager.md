# **Actors Manager Documentation**

## Overview
The Actors Manager component, is an easy way to get list of objects already pre-filtered in the core.

## Functions

### Get All Actors
`actors_manager.get_all_actors()`

> [!NOTE]
> Returns a table with all actors in game memory.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)


```lua
local actors = actors_manager.get_all_actors()

-- sorting actors by distance to the local player
local player_position = get_player_position()
table.sort(actors, function(a, b)
    return a:get_position():squared_dist_to_ignore_z(player_position) <
     b:get_position():squared_dist_to_ignore_z(player_position)
end);

-- now interact with the actors in order of proximity
for _, actor in ipairs(actors) do
    if actor:is_enemy() and actor:is_alive() then
        -- Process only living enemies
        -- Add your logic here
    end
end
```

### Get Enemy Actors
`actors_manager.get_enemy_actors()`

> [!NOTE]
> Returns a table with all enemy actors in game memory.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get Ally Actors
`actors_manager.get_ally_actors()`

> [!NOTE]
> Returns a table with all ally actors in game memory.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get All Particles
`actors_manager.get_all_particles()`

> [!NOTE]
> Returns a table with all particles in game memory.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get Ally Particles
`actors_manager.get_ally_particles()`

> [!NOTE]
> Returns a table with all ally particles in game memory.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get Enemy Particles
`actors_manager.get_enemy_particles()`

> [!NOTE]
> Returns a table with all enemy particles in game memory.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get All Players
`actors_manager.get_all_players()`

> [!NOTE]
> Returns a table with all players in game memory.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get Ally Players
`actors_manager.get_ally_players()`

> [!NOTE]
> Returns a table with all ally players in game memory.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get Enemy Players
`actors_manager.get_enemy_players()`

> [!NOTE]
> Returns a table with all enemy players in game memory.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get All NPCs
`actors_manager.get_all_npcs()`

> [!NOTE]
> Returns a table with all npc in game memory.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get Ally NPCs
`actors_manager.get_ally_npcs()`

> [!NOTE]
> Returns a table with all ally npc in game memory.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get Enemy NPCs
`actors_manager.get_enemy_npcs()`

> [!NOTE]
> Fetches data on enemy NPCs, organizing it in a table format.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get All Items
`actors_manager.get_all_items()`

> [!NOTE]
> Returns a table with all items in game memory.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)
