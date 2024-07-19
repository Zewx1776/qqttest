# **Cast Spell Module Documentation**

## Functions

### Cast Spell on Self
`cast_spell.self(spell_id, animation_time)`
- `spell_id`: Number (Int) - The identifier of the spell to cast.
- `animation_time`: Number (Float) - The animation time of the spell.

> [!NOTE]
> Casts a spell on the caster (self-cast) with specified animation time.
> - Returns: `bool`

### Cast Spell on Target
`cast_spell.target(target, spell_id, animation_time, is_debug_mode)`
- `target`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The target object for the spell.
- `spell_id`: Number (Int) - The identifier of the spell to cast.
- `animation_time`: Number (Float) - The animation time of the spell.
- `is_debug_mode`: Bool - Option to enable debug mode.

> [!NOTE]
> Casts a spell towards a specific target with animation time and an optional debug mode.
> - Returns: `bool`

#### Alternative with Spell Data
`cast_spell.target(target, spell_data, is_debug_mode)`
- `target`: [`gameobject`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Game-Object) - The target object for the spell.
- `spell_data`: `spell_data` - Detailed data of the spell.
- `is_debug_mode`: Bool - Option to enable debug mode.

> [!NOTE]
> Casts a spell towards a target using detailed spell data, with optional debug mode.
> - Returns: `bool`

### Cast Spell on Position
`cast_spell.position(spell_id, position, animation_time)`
- `spell_id`: Number (Int) - The identifier of the spell to cast.
- `position`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - The position to cast the spell.
- `animation_time`: Number (Float) - The animation time of the spell.

> [!NOTE]
> Casts a spell on a specified [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) position with given animation time.
> - Returns: `bool`
