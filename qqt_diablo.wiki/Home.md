# Lua Scripting Documentation for Diablo

## Getting Started
- Install your Lua scripts in `loader_folder_name\scripts`.
- Name your script files as `main.lua` (e.g., `scripts\test\main.lua`).
- Reload Lua files in-game with the default key: `F5`.
- Console Toggle Keybind: `F1`

## Documentation Pages
Explore various components of Lua scripting:

- [**Actors Manager**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Actors-Manager): Get quick pre-filtered gameobjects lists.
- [**Callbacks**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Callbacks): Register your code on game events callbacks.
- [**Color**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Color): Utilize color in your scripts for enhanced visual representation.
- [**Console**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Console): Learn about printing and debugging in the console.
- [**Enums**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Enums): Enumerators to improve your code readability.
- [**Orbwalker**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Orbwalker): Interact with the orbwalker core module.
- [**Evade**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Evade): Interact with the evade core module.
- [**Game Object**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object): Interacting with gameobjects and their properties.
- [**Global Functions**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Global-Functions): Access global handy functions.
- [**Graphics**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Graphics): Implementing graphical elements in your scripts.
- [**Loot Manager**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Loot-Manager): Interact with the loot manager core module.
- [**Menu Elements**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Menu-Elements): Creating and handling menu elements in scripts.
- [**Pathfinder**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Pathfinder): Interact with the Pathfinder core module.
- [**Prediction**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Prediction): Interact with the Prediction core module.
- [**Target Selector**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Target-Selector): Interact with the Target Selector core module.
- [**Utility**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Utility): Essential utility functions for scripting.
- [**Cast Spell**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Cast-Spell): Spell casting functions.
- [**Vector2**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2): 2D Geometry.
- [**Vector3**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3): 3D Geometry.
- [**World**](https://github.com/qqtnn/diablo_lua_documentation/wiki/World): Interacting with the game's world and environment.
- [**Auto Play**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Auto‐Play): Interact with the auto play core module.

## Where to Begin
Start with the [**Global Functions**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Global-Functions) to understand basic Lua functionality in Diablo. Then, explore [**Game Object**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) to interact with in-game elements. [**Target Selector**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Graphics) to refine target acquisition and [**Graphics**](https://github.com/qqtnn/diablo_lua_documentation/wiki/Graphics) for custom UI elements. As you advance, integrate various components for complex scripting.

## Code Examples:
```lua
-- register on_update callback to call the code each frame
on_update(function()

    -- filter the code to work only with orbwalker runing some mode
    if orbwalker.get_orb_mode() == orb_mode.none then
        return
    end
    
     -- get player position
     local player_position = get_player_position()

     -- get the closest target to player position
     local target = target_selector.get_target_closer(player_position , 10)
     if target then
         -- Execute actions
     end
end)
```

```lua
local developer_id = "rename_me"

-- local variable holding the combo_box options
local combo_options = {"Disabled", "Orbwalker", "Always"}

-- create combo_box menu element, default value 0 which is diabled 
-- unique menu_element id hashing a concatenated sctring developer_id + literal string
local mode_selector = combo_box:new(0, get_hash(developer_id  .. "mode_selector_placeholder_id"))

-- register on_render_menu callback to render the menu elements
on_render_menu(function()

    -- render combo_box menu element
    mode_selector:render("Mode", combo_options, "Select Mode")
end)
```
