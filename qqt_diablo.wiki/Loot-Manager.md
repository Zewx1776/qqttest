# **Loot Manager Module Documentation**

## Overview
The Loot Manager module provides a comprehensive set of functions for managing lootable items and objects within the game, enhancing player interactions with the game environment.

## Functions

### Get Item Identifier
`loot_manager.get_item_identifier(obj)`
- `obj`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The item to identify.

> [!NOTE]
> Retrieves the unique identifier of an item, crucial for differentiating and tracking items in the game world.

### Is Interactable Object
`loot_manager.is_interactuable_object(obj)`
- `obj`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The object to check.

> [!NOTE]
> Determines if the specified object is interactable, aiding in automating interactions within the game.

### Is Item Lootable
`loot_manager.is_item_looteable(obj)`
- `obj`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The item to check.

> [!NOTE]
> Checks whether an item is lootable, facilitating inventory management and item collection strategies.

### Is Potion Necessary
`loot_manager.is_potion_necesary()`
> Evaluates the player's current inventory to determine the necessity of looting a potion.

### Can Loot Potion
`loot_manager.can_loot_potion()`
> Assesses whether the player can loot a potion based on inventory space and game conditions.

### Is Gold
`loot_manager.is_gold(obj)`
- `obj`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The object to evaluate.

> [!NOTE]
> Identifies if the object in question is gold, an essential aspect of resource management.

### Is Potion
`loot_manager.is_potion(obj)`
- `obj`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The object to check.

> [!NOTE]
> Checks if the object is a potion, aiding in automating potion collection and usage.

### Is Shrine
`loot_manager.is_shrine(obj)`
- `obj`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The shrine object.

> [!NOTE]
> Determines whether an object is a shrine, useful for automated interactions with game shrines.

### Is Obols
`loot_manager.is_obols(obj)`
- `obj`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The object to evaluate.

> [!NOTE]
> Identifies if the object is obols, a specific type of in-game currency or item.

### Is Locked Chest
`loot_manager.is_locked_chest(obj)`
- `obj`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The chest object.

> [!NOTE]
> Checks if a chest is locked, which is key for deciding whether to attempt opening it.

### Has Whispering Key
`loot_manager.has_whispering_key(obj)`
- `obj`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The object to inspect.

> [!NOTE]
> Determines if an object, typically a chest, contains a whispering key.

### Is Ore Exception
`loot_manager.is_ore_exception(obj)`
- `obj`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The ore object.

> [!NOTE]
> Identifies if an ore object is an exception, often used in specialized loot collection logic.

### Is Chest Exception
`loot_manager.is_chest_exception(obj)`
- `obj`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The chest object.

> [!NOTE]
> Determines if a chest is an exception, aiding in automated decision-making regarding chest interactions.

### Is Event Trigger Exception
`loot_manager.is_event_trigger_exception(obj)`
- `obj`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The event trigger object.

> [!NOTE]
> Checks if an object is an exception in triggering events, important for automating event-related actions.

### Get All Items and Chests Sorted by Distance
`loot_manager.get_all_items_and_chest_sorted_by_distance()`
> Retrieves all lootable items and chests in the game environment, sorted by their distance from the player.

### Any Item Around
`loot_manager.any_item_around(point, threshold, exclude_potions, exclude_gold)`
- `point`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The center point to check around.
- `threshold`: Number - The radius to check within.
- `exclude_potions`, `exclude_gold`: Booleans to exclude specific items.

> [!NOTE]
> Scans for any items within a specified radius, with options to exclude potions and gold, aiding in targeted loot collection.

### Loot Item
`loot_manager.loot_item(obj, exclude_potions, exclude_gold)`
- `obj`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The item to loot.
- `exclude_potions`, `exclude_gold`: Booleans to exclude these types of items.

> [!NOTE]
> Executes the action of looting a specified item, with options to filter out potions and gold.

### Loot Item with Orbwalker
`loot_manager.loot_item_orbwalker(item)`
- `item`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The item for the orbwalker to loot.

> [!NOTE]
> Requests the orbwalker to loot a specific item, integrating item collection into movement and combat routines.

### Interact with Object
`loot_manager.interact_with_object(obj)`
- `obj`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The object to interact with.

> [!NOTE]
> Triggers an interaction with the specified game object, useful for engaging with various elements in the game world.

### Interact with Vendor and Sell All
`loot_manager.interact_with_vendor_and_sell_all(vendor)`
- `vendor`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The vendor to interact with.

> [!NOTE]
> Automates the process of interacting with a vendor and selling all items in the player's inventory, streamlining inventory management.

### Sell All Items
`loot_manager.sell_all_items()`
- Executes the action of selling all items in the player's inventory. This function requires the vendor window to be open already.

### Salvage All Items
`loot_manager.salvage_all_items()`
- Executes the action of salvaging all items in the player's inventory. This function requires the vendor window to be open already.

### Sell Specific Item
`loot_manager.sell_specific_item(item)`
- `item`: [`item_data`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Item-Data) - The specific item to sell.
- Sells a specified item from the player's inventory. This function requires the vendor window to be open already.

### Salvage Specific Item
`loot_manager.salvage_specific_item(item)`
- `item`: [`item_data`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Item-Data) - The specific item to salvage.
- Salvages a specified item from the player's inventory. This function requires the vendor window to be open already.

> [!NOTE]
> The actions to sell or salvage items interact directly with the game's vendor interface. Ensure that the vendor interface is open before attempting to use these functions to prevent errors or unexpected behavior.
