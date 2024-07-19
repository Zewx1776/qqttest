# **Enums Class Documentation**

## Overview
Enums are a handy way to make your code cleaner and more understandable. They're like a set of signposts, guiding you through various options and settings with clear, meaningful names instead of just numbers or arbitrary values.

### Button Click
`button_click`
Enum representing different types of button clicks, often used in conjunction with [button callbacks](https://github.com/qqtnn/diablo_lua_documentation/wiki/Callbacks).
- `lmb`: Left mouse button click.
- `rmb`: Right mouse button click.
- `none`: No button click.

> [!NOTE]
> Useful for handling different mouse interactions, particularly in key press and release scenarios.
> **Example**: `local click_type = button_click.lmb`

### Spell Geometry
`spell_geometry`
Defines the shape of a spell's area, aligning with [`spell_data`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Spell-Data).
- `rectangular`
- `circular`

> [!NOTE]
> Helps specify the geometric area of a spell's effect, whether it's a wide rectangle or a spreading circle.

### Targeting Type
`targeting_type`
Details the targeting mechanism of spells, also found in [`spell_data`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Spell-Data).
- `skillshot`
- `targeted`

> [!NOTE]
> Differentiates between direct targeting spells and skillshots that require precise aiming or prediction.

### Orbwalker Mode
`orb_mode`
Enumerates the various modes of an orbwalker, as utilized in the [Orbwalker module](https://github.com/qqtnn/diablo_lua_documentation/wiki/Orbwalker).
- `none`: No specific mode.
- `pvp`: Player versus player combat mode.
- `clear`: Clearing waves or camps.
- `flee`: Escaping or avoiding combat.

> [!NOTE]
> Essential for defining the behavior of the orbwalker, guiding how your character moves and attacks in different scenarios.
