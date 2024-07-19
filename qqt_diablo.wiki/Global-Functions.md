# **Global Functions Documentation**

## Overview
Global Functions are a collection of essential tools for interacting with the game environment. These functions provide streamlined access to player data, game objects, and other crucial aspects of the game.

## Functions

### Get Local Player
`get_local_player()`
> [!NOTE]
> Accesses the game object representing the local player, essential for many player-centric operations.
> - Returns: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get Player Name
`get_local_player_name()`
> [!NOTE]
> Retrieves Character Name of Local Player.
> - Returns: String

### Get Player Position
`get_player_position()`
> [!NOTE]
> Retrieves the current geographical position of the local player in the game world, useful for navigation and positioning strategies.
> - Returns: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3)

### Get Actors List
`get_actors_list()`
> [!NOTE]
> Gathers a comprehensive list of all active game actors, providing a broad overview of the entities present in the current game environment.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get Attachments List
`get_attachments_list()`
> [!NOTE]
> Fetches a list of all game objects that are currently attached, offering insights into various game entities and their interactions.
> - Returns: Table of [`gameobjects`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Get Hash
`get_hash(str)`
- `str`: String - The string to be hashed.
> [!NOTE]
> Converts a given string into a hash integer, facilitating efficient data storage and retrieval operations.
> - Returns: Integer

### Get Cursor Position
`get_cursor_position()`
> [!NOTE]
> Obtains the precise position of the cursor in the game world, useful for UI interactions and in-game targeting.
> - Returns: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3)

### Get Game Time
`get_gametime()`
> [!NOTE]
> Provides the current in-game time, essential for time-based events and game dynamics.
> - Returns: Number

### Get Time Since Inject
`get_time_since_inject()`
> [!NOTE]
> Measures the duration since the last code injection, offering a timing benchmark for scripts and operations.
> - Returns: Number

### Get Equipped Spells IDs
`get_equipped_spell_ids()`
> [!NOTE]
> - Returns: Table of number (int) spells ids

### Get Name For  Spell
`get_name_for_spell(spell_id)`

> spell_id parameter is number(int)

> [!NOTE]
> - Returns: Name of the spell sent by parameter

### Is Inventory Open
`is_inventory_open()`

> [!NOTE]
> - Returns: Return `Boolean` of inventory open state.

### Get Open Inventory Bag
`get_open_inventory_bag()`

State | ID
-- | --
Not Open| -1
Items | 0
Consumables | 1

> [!NOTE]
> - Returns: Return `number (int)` indicating which inventory is open.

### Get Key State
`get_key_state(key)`
- `key`: Byte - The key code to check.
> [!NOTE]
> Checks if the specified key is currently pressed down.
> - Returns: Boolean

### Get Quests
`get_quests()`
> [!NOTE]
> Retrieves a table of all active quests in the game.
> - Returns: Table of quests

### Get Hovered Item
`get_hovered_item()`
> [!NOTE]
> Fetches the game object that is currently being hovered by the cursor.
> - Returns: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)

### Interact With Object
`interact_object(object)`
- `object`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The object to interact with.
> [!NOTE]
> Initiates an interaction with the specified game object.
> - Returns: Boolean (indicates success or failure)

### Interact with Vendor
`interact_vendor(object)`
- `object`: [`game.object`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The vendor object to interact with.

> [!NOTE]
> Initiates an interaction with the specified vendor object.
> - Returns: `void`

### Get Screen Width
`get_screen_width()`
> [!NOTE]
> Retrieves the current width of the game screen in pixels.
> - Returns: Number

### Get Screen Height
`get_screen_height()`
> [!NOTE]
> Retrieves the current height of the game screen in pixels.
> - Returns: Number

### Get Helltide Coin Cinders
`get_helltide_coin_cinders()`
> [!NOTE]
> Retrieves the current count of Helltide coin cinders.
> - Returns: Number

### Get Helltide Coin Hearts
`get_helltide_coin_hearts()`
> [!NOTE]
> Retrieves the current count of Helltide coin hearts.
> - Returns: Number

### Leave Dungeon
`leave_dungeon()`
> [!NOTE]
> Initiates the action to exit the current dungeon, useful for automating transitions or escaping unfavorable situations.
> - Returns: `bool` (indicates success or failure)

### Revive at Checkpoint
`revive_at_checkpoint()`

> [!NOTE]
> Revives the player at the nearest checkpoint.
> - Returns: `void`

### Start Game
`start_game()`

> [!NOTE]
> Starts the game session.
> - Returns: `void`

### Leave Game
`leave_game()`

> [!NOTE]
> Leaves the current game session.
> - Returns: `void`

### Use Health Potion
`use_health_potion()`

> [!NOTE]
> Uses a health potion to restore the player's health.
> - Returns: `void`


### Reset All Dungeons
`reset_all_dungeons()`
> [!NOTE]
> Initiates the action to reset dungeons which also kicks you for any dungeon you are into
> - Returns: `nil`

### Teleport To Waypoint
`teleport_to_waypoint(id)`
- `id`: `number`- The id of the waypoint to teleport
> [!NOTE]
> Initiates the action to teleport to an specific waypoint
> - Returns: `nil`

> [!TIP]
> Waypoints ID Enum

```lua
local waypoints_enum = {
    GEA_KUL = 0xB66AB,
    IRON_WOLVES_ENCAMPMENT = 0xDEAFC,
    IMPERIAL_LIBRARY = 0x10D63D,
    DENSHAR = 0x8AF45,
    TARSARAK = 0x8C7B7,
    ZARBINZET = 0xA46E5,
    JIRANDAI = 0x462E2,
    ALZUUDA = 0x792DA,
    WEJINHANI = 0x9346B,
    RUINS_OF_RAKHAT_KEEP_INNER_COURT = 0xF77C2,
    THE_TREE_OF_WHISPERS = 0x90557,
    BACKWATER = 0xA491F,
    KED_BARDU = 0x34CE7,
    HIDDEN_OVERLOOK = 0x460D4,
    FATES_RETREAT = 0xEEEB3,
    FAROBRU = 0x2D392,
    TUR_DULRA = 0x8D596,
    MAROWEN = 0x27E01,
    BRAESTAIG = 0x7FD82,
    CERRIGAR = 0x76D58,
    FIREBREAK_MANOR = 0x803EE,
    CORBACH = 0x22EBE,
    TIRMAIR = 0xB92BE,
    UNDER_THE_FAT_GOOSE_INN = 0xEED6B,
    MENESTAD = 0xACE9B,
    KYOVASHAD = 0x6CC71,
    BEAR_TRIBE_REFUGE = 0x8234E,
    MARGRAVE = 0x90A86,
    YELESNA = 0x833F8,
    NEVESK = 0x6D945,
    NOSTRAVA = 0x8547F
}

-- Usage example:
teleport_to_waypoint(waypoints_enum.GEA_KUL)

```


