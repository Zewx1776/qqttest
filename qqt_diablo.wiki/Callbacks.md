# **Callbacks Documentation**

## On Render Callback
`on_render()`
> [!NOTE]
> All graphics-related elements (images, circles, rectangles, text) must be placed inside this callback.
## On Update Callback
`on_update()`
> [!NOTE]
> Ideal for most game logics and spell casts.
## On Pre-Tick Callback
`on_pre_tick()`
> [!NOTE]
> Designed for logics requiring anticipation of the next game tick.
## On Render Menu Callback
`on_render_menu()`
> [!NOTE]
> All menu elements must be rendered in this callback.
> [!WARNING]
> All menu elements id must be unique otherwise they will overlap with other menu elements at saving.
```lua
local developer_id = "rename_me";
local check_test = checkbox:new(true, get_hash("developer_id .. "check_test"))

local function my_render_menu()
    check_test:render("Test Checkbox", "");
end

-- register your local function into the callback
on_render_menu(my_render_menu;
```

## On Keys Callbacks
`on_key_press()`
`on_key_release()`
> [!NOTE]
> Triggers when any key is either press or released.
#### Lua Code Examples:

> Register callback into anonimous function
```lua
on_key_release(function(key)
    print("Key Released:", key);
end);
```

> Register callback into a local function
```lua
local function my_on_key_press(key)
    if key == 0x01 then
        console.print("Key Pressed is LMB");
    end;
end

on_key_press(my_on_key_press);
```