# **Game Object Class Documentation**

### get_id
`get_id()` -> `number (int)`
> [!NOTE]
> Returns the unique identifier of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_secondary_data_id
`get_secondary_data_id()` -> `number (int)`
> [!NOTE]
> Returns the secondary data identifier of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_type_id
`get_type_id()` -> `number (int)`
> [!NOTE]
> Provides the type identifier of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_position
`get_position()` -> [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3)
> [!NOTE]
> Retrieves the current position of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) as a [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3).

> [!TIP]
> Use on_render() from [callbacks](https://github.com/qqtnn/diablo_lua_documentation/wiki/Callbacks)
> 
> Use get_player_position() to get local player [vec3](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) position from > [global_functions](https://github.com/qqtnn/diablo_lua_documentation/wiki/Global-Functions#get-player-position)
> 
> Use actors_manager.get_enemy_npcs() to get a list of enemies [game_object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) > > from [Actors Manager](https://github.com/qqtnn/diablo_lua_documentation/wiki/Actors-Manager#get-enemy-npcs)
> 
> Use graphics.circle_3d() from [Graphics](https://github.com/qqtnn/diablo_lua_documentation/wiki/Graphics#draw-3d-circle)

```lua
local color_white = color.new(255,255,255,255);
on_render(function ()

    local player_position = get_player_position();
    local enemies = actors_manager.get_enemy_npcs();

    for i, obj in ipairs(enemies) do
      local position = obj:get_position();
      local distance = position:dist_to(player_position);
      local is_close = distance < 8.0;
        if not is_close then
            goto continue;
            -- when the enemy distance more than 8 units skip
        end;

        graphics.circle_3d(position, 2, color_white);
        -- draw white circle at all enemies position under 8 units of distance
        ::continue::
    end;

end);
```

### is_moving
`is_moving()` -> `bool`
> [!NOTE]
> Indicates whether the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) is currently moving.

### is_dashing
`is_dashing()` -> `bool`
> [!NOTE]
> Checks if the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) is performing a dash action.

### get_active_spell_id
`get_active_spell_id()` -> `number (int)`
> [!NOTE]
> Returns the identifier of the currently active spell of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_active_spell_origin
`get_active_spell_origin()` -> [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3)
> [!NOTE]
> Retrieves the origin of the current active spell as a [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) for the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_active_spell_destination
`get_active_spell_destination()` -> [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3)
> [!NOTE]
> Retrieves the destionation of the current active spell as a [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) for the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_move_destination
`get_move_destination()` -> [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3)
> [!NOTE]
> Retrieves the destination of the current move action as a [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) for the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_dash_destination
`get_dash_destination()` -> [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3)
> [!NOTE]
> Provides the destination of the current dash as a [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) for the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_direction
`get_direction()` -> [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3)
> [!NOTE]
> Retrieves the current direction of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) as a [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3).

### get_current_speed
`get_current_speed()` -> `number (float)`
> [!NOTE]
> Retrieves the current speed of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_total_movement_speed
`get_total_movement_speed()` -> `number (float)`
> [!NOTE]
> Retrieves the total movement speed of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object), combining base speed and any multipliers.

### get_base_movement_speed
`get_base_movement_speed()` -> `number (float)`
> [!NOTE]
> Retrieves the base movement speed of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object), excluding any multipliers.

### get_movement_speed_multiplier
`get_movement_speed_multiplier()` -> `number (float)`
> [!NOTE]
> Retrieves the movement speed multiplier of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object), indicating the factor by which the base speed is modified.

### get_skin_name
`get_skin_name()` -> `string`
> [!NOTE]
> Returns the name of the current skin of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_type
`get_type()` -> `number (int)`
> [!NOTE]
> Provides the type of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### is_basic_particle
`is_basic_particle()` -> `bool`
> [!NOTE]
> Checks if the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) is a basic particle.

### is_elite
`is_elite()` -> `bool`
> [!NOTE]
> Indicates whether the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) is classified as elite.

### is_champion
`is_champion()` -> `bool`
> [!NOTE]
> Determines if the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) is a champion.

### is_minion
`is_minion()` -> `bool`
> [!NOTE]
> Checks if the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) is a minion.

### is_boss
`is_boss()` -> `bool`
> [!NOTE]
> Indicates whether the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) is a boss.

### is_immune
`is_immune()` -> `bool`
> [!NOTE]
> Checks if the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) is currently immune.

### is_vulnerable
`is_vulnerable()` -> `bool`
> [!NOTE]
> Determines if the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) is vulnerable.

### is_untargetable
`is_untargetable()` -> `bool`
> [!NOTE]
> Checks if the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) is untargetable.

### is_item
`is_item()` -> `bool`
> [!NOTE]
> Indicates whether the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) is an item.

### can_not_interact
`can_not_interact()` -> `bool`
> [!NOTE]
> Determines if the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) cannot be interacted with.

### get_base_health
`get_base_health()` -> `number (float)`
> [!NOTE]
> Returns the base health of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_bonus_health_modifier
`get_bonus_health_modifier()` -> `number (float)`
> [!NOTE]
> Provides the bonus health modifier of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_current_health
`get_current_health()` -> `number (float)`
> [!NOTE]
> Retrieves the current health value of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_max_health
`get_max_health()` -> `number (float)`
> [!NOTE]
> Returns the maximum health value of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

> [!TIP]
> Use get_local_player() to get local player from [Global Functions](https://github.com/qqtnn/diablo_lua_documentation/wiki/Global-Functions#get-local-player)

```lua
local local_player = get_local_player(); 
local max_health = local_player:get_max_health();
local current_health = local_player:get_current_health();
local current_health_percentage = current_health  / current_health;

if current_health_percentage  < 0.50 then
    -- run code to use potion under 50% health
end
```

### get_base_attack_speed
`get_base_attack_speed()` -> `number (float)`
> [!NOTE]
> Returns the base attack speed of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_bonus_attack_speed
`get_bonus_attack_speed()` -> `number (float)`
> [!NOTE]
> Provides the bonus attack speed added to the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_weapon_damage
`get_weapon_damage()` -> `number (float)`
> [!NOTE]
> Retrieves the weapon damage of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_level
`get_level()` -> `number (int)`
> [!NOTE]
> Provides the current level of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_current_experience
`get_current_experience()` -> `number (int)`
> [!NOTE]
> Retrieves the current experience points of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_experience_total_next_level
`get_experience_total_next_level()` -> `number (int)`
> [!NOTE]
> Returns the total experience needed for the next level for the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_experience_remaining_next_level
`get_experience_remaining_next_level()` -> `number (int)`
> [!NOTE]
> Indicates the remaining experience needed for the next level for the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_character_class_id
`get_character_class_id()` -> `number (int)`
> [!NOTE]
> Provides the character class ID of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

Class Name | ID
-- | --
Sorcerer | 0
Barbarian | 1
Unknown | 2
Rogue | 3
Unknown | 4
Druid | 5
Necromancer | 6

> [!TIP]
> Use get_local_player() to get local player from [Global Functions](https://github.com/qqtnn/diablo_lua_documentation/wiki/Global-Functions#get-local-player)

```lua
local local_player = get_local_player(); 
if not local_player then
     return; -- prevent accesing nil object
end;

local character_id = local_player:get_character_class_id();
local is_druid = character_id == 5;
if not is_druid then
     return; -- prevent loading plugin from another class
end;

-- this could be used at the beginning of a druid plugin so it doesnt get load unless local player is druid class
```

### get_health_potion_max_count
`get_health_potion_max_count()` -> `number (int)`
> [!NOTE]
> Returns the maximum count of health potions the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) can hold.

### get_health_potion_count
`get_health_potion_count()` -> `number (int)`
> [!NOTE]
> Indicates the current count of health potions held by the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_health_potion_tier
`get_health_potion_tier()` -> `number (int)`
> [!NOTE]
> Returns the tier of health potions held by the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

> [!TIP]
> Use get_local_player() to get local player from [Global Functions](https://github.com/qqtnn/diablo_lua_documentation/wiki/Global-Functions#get-local-player)

```lua
local local_player = get_local_player();

-- warning: local_player could be nil
local max_potions = local_player:get_health_potion_max_count();
local current_potions_amount = local_player:get_health_potion_count();
local is_potion_stash_full = current_potions_amount >= max_potions;

if not is_potion_stash_full then
    -- run code to draw some highlight on potions position around local_player:get_position()
end
```

### get_primary_resource_current
`get_primary_resource_current()` -> `number (int)`
> [!NOTE]
> Retrieves the current primary resource value of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_primary_resource_max
`get_primary_resource_max()` -> `number (int)`
> [!NOTE]
> Provides the maximum value of the primary resource of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_class_specialization_id
`get_class_specialization_id()` -> `number (int)`
> [!NOTE]
> Provides the specialization id of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_rogue_combo_points
`get_rogue_combo_points()` -> `number (int)`
> [!NOTE]
> Returns the amount of combo points of the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### is_dead
`is_dead()` -> `bool`
> [!NOTE]
> Checks if the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) is currently dead.

### is_enemy
`is_enemy()` -> `bool`
> [!NOTE]
> Determines if the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) is an enemy.

### is_enemy_with
`is_enemy_with(other)` -> `bool`
- `other`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - Another game object to compare with.
> [!NOTE]
> Checks if the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) is an enemy of another specified game object.

### get_debug_int
`get_debug_int()` -> `number (int)`
> [!NOTE]
> Retrieves a debug integer value from the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_debug_int_2
`get_debug_int_2()` -> `number (int)`
> [!NOTE]
> Retrieves a second debug integer value from the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_debug_float
`get_debug_float()` -> `number (float)`
> [!NOTE]
> Retrieves a debug float value from the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_buffs
`get_buffs()` -> `table of [buff]`
> [!NOTE]
> Retrieves a table containing all the buffs currently applied to the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object). Each entry in the table is a `buff` object.

### Buff
The `buff` structure represents a buff applied to a game object. It contains the following fields and methods:
- `instance`: Number (Int) - The instance identifier of the buff.
- `type`: Number (Int) - The type identifier of the buff.
- `name_hash`: Number (Int) - The hash value of the buff's name.
- `name`: `get_name()` -> `string` - Returns the name of the buff.
- `get_end_time`: `get_end_time()` -> `Number (float)` - Retrieves the end time of the buff.

```lua
local local_player = get_local_player();
local buffs = local_player:get_buffs();

for _, buff in ipairs(buffs) do
    local buff_name = buff:name();
    console.print("Buff Name: " .. buff_name);
end

-- This example demonstrates how to retrieve and print the names of all buffs currently applied to the local player.
```

### get_inventory_items
`get_inventory_items()` -> `table of [item_data]`
> [!NOTE]
> Retrieves a table of item data for all items in the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)'s inventory.
### get_item_count
`get_item_count()` -> `number (int)`
> [!NOTE]
> Returns the count of items in the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)'s inventory.

### get_consumable_count
`get_consumable_count()` -> `number (int)`
> [!NOTE]
> Retrieves the count of consumable items in the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)'s inventory.

### get_quest_item_count
`get_quest_item_count()` -> `number (int)`
> [!NOTE]
> Returns the count of quest-related items in the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)'s inventory.

### get_aspect_count
`get_aspect_count()` -> `number (int)`
> [!NOTE]
> Provides the count of aspects (special items or effects) associated with the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_item_ids_for_bag
`get_item_ids_for_bag(bag_id)` -> `table of number (int)`
- `bag_id`: Number (Int) - The identifier of the bag.
> [!NOTE]
> Returns a table of item IDs for a specified bag in the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)'s inventory.

### get_inventory_item_secondary_ids
`get_inventory_item_secondary_ids()` -> `table of number (int)`
> [!NOTE]
> Retrieves a table of secondary IDs for items in the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)'s inventory.

### get_consumables_ids
`get_consumables_ids()` -> `table of number (int)`
> [!NOTE]
> Returns a table of IDs for consumable items in the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)'s inventory.

### get_consumables_names
`get_consumables_names()` -> `table of string`
> [!NOTE]
> Retrieves a table of names for consumable items in the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)'s inventory.

### is_spell_ready
`is_spell_ready(spell_id)` -> `bool`
- `spell_id`: Number (Int) - The identifier of the spell to check.
> [!NOTE]
> Checks if a specified spell is ready to be cast by the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### has_enough_resources_for_spell
`has_enough_resources_for_spell(spell_id)` -> `bool`
- `spell_id`: Number (Int) - The identifier of the spell to check.
> [!NOTE]
> Determines if the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) has enough resources to cast a specified spell.

### get_equipped_items
`get_equipped_items()` -> `table of [item_data]`
> [!NOTE]
> Returns a table of `item_data` for items equipped by the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object).

### get_inventory_items
`get_inventory_items()` -> `table of [item_data]`
> [!NOTE]
> Retrieves a table of `item_data` for items in the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)'s inventory.

### get_consumable_items
`get_consumable_items()` -> `table of [item_data]`
> [!NOTE]
> Returns a table of `item_data` for consumable items in the [game object](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object)'s inventory.

### get_item_info
`get_item_info(item_id)` -> `item_data`
- `item_id`: Number (Int) - The identifier of the item.
> [!NOTE]
> Provides `item_data` for a specific item identified by `item_id`.

---

# **Item Data and Affixes Documentation**

## Item Rarity Enumeration
An enumeration representing different item rarity levels:
- `normal`
- `magic`
- `magic_2`
- `rare`
- `rare_2`
- `legendary`
- `unique`
- `set`

## Item Data Affix Structure
The `item_data_affix` structure provides detailed information about an item's affix:
- `affix_name_hash`: Number (Int) - The hash value of the affix's name also known as the sno id.
- `balance_offset`: Number (Int) - The balance offset of the affix.
- `get_roll`: `get_roll()` -> `number (float)` - Returns the roll value of the affix.
- `get_roll_min`: `get_roll_min()` -> `number (float)` - Returns the minimum roll value.
- `get_roll_max`: `get_roll_max()` -> `number (float)` - Returns the maximum roll value.
- `get_name`: `get_name()` -> `string` - Retrieves the name of the affix.
- `get_rarity_type`: `get_rarity_type()` -> `number (int)` - Provides the rarity type of the affix.
- `get_affix_data`: `get_affix_data()` -> `userdata` - Accesses internal affix data (for advanced use).
- `get_affix_seed`: `get_affix_seed()` -> `number (int64)` - Returns the seed value used for the affix.

## Item Data Structure
The `item_data` structure represents detailed information about an item:
- `get_skin_name`: `get_skin_name()` -> `string` - Retrieves the skin name of the item.
- `get_name`: `get_name()` -> `string` - Provides the name of the item.
- `get_display_name`: `get_name()` -> `string` - Provides the display name of the item.
- `is_sacred`: `is_sacred()` -> `bool` - Indicates if the item is sacred.
- `is_ancestral`: `is_ancestral()` -> `bool` - Checks if the item is ancestral.
- `get_rarity`: `get_rarity()` -> `item_rarity` - Returns the rarity level of the item.
- `is_junk`: `is_junk()` -> `bool` - Determines if the item is classified as junk.
- `is_locked`: `is_locked()` -> `bool` - Indicates if the item is locked.
- `get_affixes`: `get_affixes()` -> `table of [item_data_affix]` - Retrieves a table of affixes associated with the item.
- `get_durability`: `get_durability()` -> `number (float)` - Provides the item's durability value.
- `get_acd`: `get_acd()` -> `userdata` - Accesses internal ACD data (for advanced use).
- `get_sno_id`: `get_sno_id()` -> `number (int)` - Returns the SNO ID of the item.
- `get_balance_offset`: `get_balance_offset()` -> `number (int)` - Provides the balance offset of the item.
- `get_inventory_row`: `get_inventory_row()` -> `number (int)` - Returns the row number in the inventory where the item is located.
- `get_inventory_column`: `get_inventory_column()` -> `number (int)` - Returns the column number in the inventory where the item is located.


> [!TIP]
> Some code examples for items

```lua
    local floor_item_list = actors_manager.get_all_items()
    for i, value in ipairs(floor_item_list) do
        if value then -- prevent accesing invalid ptr
            local object_3d_position = value:get_position()
            graphics.text_3d(value:get_skin_name(), object_3d_position, 16.0, color_yellow(255))

            local object_2d_position = graphics.w2s(object_3d_position)
            if object_2d_position then
                local item_data = value:get_item_info()
                if item_data and item_data:is_valid() then -- prevent accesing invalid ptr

                    object_2d_position.y = object_2d_position.y + 16.0
                    graphics.text_2d(item_data:get_display_name(), object_2d_position, 16.0, color_green(255))

                    object_2d_position.y = object_2d_position.y + 16.0
                    graphics.text_2d(item_data:get_name(), object_2d_position, 16.0, color_white(255))

                    -- note: if you never pick up the item, this table will be empty, it gets filled by server once you pick up once
                    for v, affix in ipairs(item_data:get_affixes()) do
                        if affix then -- prevent accesing invalid ptr
                            
                            object_2d_position.y = object_2d_position.y + 16.0
                            graphics.text_2d(affix:get_name(), object_2d_position, 16.0, color_red(255))
                        end
                    end
                end
            end
        end
    end
```

[![Diablo-IV-lwe-N3ubgc-O.png](https://i.postimg.cc/ZYWLDYwv/Diablo-IV-lwe-N3ubgc-O.png)](https://i.postimg.cc/ZYWLDYwv/Diablo-IV-lwe-N3ubgc-O.png)

> [!TIP]
> This example also can be used for inventory items as they are also gameobjects and contains item_data, once they are in your inventory the existance of affix table is guaranteed as long as they have affixes. 

```lua
    local local_player = get_local_player()
    if local_player then 
        local equipped_items_list = local_player:get_equipped_items() -- items you are using at the moment, useful to check durability of them for example
        local inventory_items = local_player:get_inventory_items() -- all the items on the first tab of your inventory
        local consumable_items = local_player:get_consumable_items() -- all the items on the second tab of your inventory
        
    end
```