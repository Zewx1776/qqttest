# **Menu Elements Module Documentation**

## Overview
Menu Elements are essential for creating interactive and user-friendly interfaces in the game's menu. Each type of menu element has unique functionalities, enhancing the user experience.

## Button
### Constructor
- `button:new(id)`: Creates a new button instance.

### Description
Adds an interactive button to the menu interface.

### Methods
- `render(button_name, tooltip, activation_delay, click_type)`: Displays the button.
  - `button_name`: String - The text displayed on the button.
  - `tooltip`: String - A helpful hint displayed when hovering over the button.
  - `activation_delay`: Number - Delay before the button becomes active after rendering.
  - `click_type`: `button_click` - The type of click interaction (left, right, none).
- `get()`: Returns the button's current state (clicked/not clicked).
- `set_id(number)`: Sets a unique identifier for the button.
  - `number`: Integer - The unique ID for the button.
- `get_full()`: Retrieves detailed information about the button's state and properties.

> [!NOTE]
> Buttons are fundamental for triggering actions and navigating menus. The unique ID (`id`) is crucial for distinguishing different buttons.

## Checkbox
### Constructor
- `checkbox:new(default_state, id)`: Initializes a new checkbox.

### Description
Introduces a checkbox element for toggling options on and off.

### Methods
- `render(label, tooltip)`: Renders the checkbox.
  - `label`: String - The text label next to the checkbox.
  - `tooltip`: String - Additional information displayed on hover.
- `get()`: Retrieves the current state (checked/unchecked) of the checkbox.
- `set(value)`: Sets the checkbox to a specific state.
  - `value`: Boolean - The desired state of the checkbox (true for checked).

> [!NOTE]
> Checkboxes are ideal for enabling or disabling features and settings within the menu. 

## Combo Box
### Constructor
- `combo_box:new(default_state, id)`: Establishes a new combo box.

### Description
Creates a dropdown menu with multiple selectable options.

### Methods
- `render(label, items, tooltip)`: Shows the combo box.
  - `label`: String - The title of the combo box.
  - `items`: Table - A list of options available in the dropdown.
  - `tooltip`: String - A brief description or guide.
- `get()`: Returns the index of the currently selected item.
- `set(value)`: Selects an item based on its index.
  - `value`: Integer - The index of the item to select.

> [!WARNING]
> Ensure each combo box has a unique ID to prevent conflicts with other menu elements.

## Input Text
### Constructor
- `input_text:new(id)`: Generates a new input text field.

### Description
Adds a field for entering text.

### Methods
- `render(label, tooltip, require_button, button_label, button_tooltip)`: Displays the input text field.
  - `label`: String - The title of the input field.
  - `tooltip`: String - Extra information for users.
  - `require_button`: Boolean - Determines if a button is needed to submit text.
  - `button_label`: String - Text for the submission button.
  - `button_tooltip`: String - Tooltip for the submission button.
- `get()`: Retrieves the text entered in the field.
- `get_in_vec3()`: Converts and returns the input text as a `vec3` object, if possible.
- `is_open()`: Checks if the input field is currently active.

> [!NOTE]
> Input Text fields are versatile for user inputs, from simple text entries to coordinates and numerical values.

## Slider (Int and Float)
### Constructors
- `slider_int:new(min_value, max_value, default_value, id)`: Sets up an integer slider.
- `slider_float:new(min_value, max_value, default_value, id, rounding)`: Initializes a floating-point slider.

### Description
These sliders allow users to select a value within a specified range.

### Methods
- `render(label, tooltip, rounding)`: Displays the slider.
  - `label`: String - The title of the slider.
  - `tooltip`: String - Additional details about the slider's purpose.
  - `rounding`: Integer (only for `slider_float`) - Rounding precision for floating-point values.
- `get()`: Returns the current value selected on the slider.

> [!TIP]
> Sliders are useful for settings that require precision, like adjusting volumes or scaling factors.

## Tree Node
### Constructor
- `tree_node:new(node_depth)`: Creates a new section in the menu.

### Description
Facilitates the creation of structured, hierarchical menu sections.

### Example:
- Main section: `local main_section = tree_node:new(0)`
- Sub-section: `local sub_section = tree_node:new(1)`

## Keybind
### Constructor
- `keybind(int, bool, uint32_t)`: Establishes a keybind element.

### Description
Allows users to set custom keybindings for various actions.

### Methods
- `render(label, tooltip)`: Renders the keybind setting.
  - `label`: String - The description of the keybind.
  - `tooltip`: String - Guidance on setting the keybind.
- `get_state()`: Returns the current state of the keybind (active/inactive).
- `get_key()`: Retrieves the key currently bound.
- `set(key, toggle, mode)`: Configures the keybind.
  - `key`: Integer - The keycode to bind.
  - `toggle`: Boolean - If true, the keybind acts as a toggle.
  - `mode`: Integer - The mode of the keybind.

> [!TIP]
> Keybinds allow for customizable control schemes and shortcuts.

```lua
local developer_id = "rename_me"
local feature_keybind= keybind:new(0x01, false, get_hash(developer_id  .. "mode_selector_placeholder_id"));

-- somewhere else
if feature_keybind:get_state() then
    -- Logic for activated feature
end
```

> [!TIP]
> Keybinds second parameter boolean is to indicate is_toggle

## Color Picker
### Constructor
- `colorpicker:new(id, default_color)`: Creates a new color picker.

```lua
local menu_elements = {
    color_example = colorpicker:new(get_hash("dev_label_" .. "color_example_unique_id"), ImVec4:new(255,255,0,255))
}

-- to access the color menu element
local color = menu_elements.color_example:get();

-- to render color in menu
menu_elements.color_example:render("Color Picker", "Tooltip");
```

### Description
Provides a tool for selecting and customizing colors.

### Methods
- `render(label, tooltip, show_on_button_press, button_label, button_tooltip)`: Displays the color picker.
  - `label`: String - The title of the color picker.
  - `tooltip`: String - Extra information about the color picker.
  - `show_on_button_press`: Boolean - Determines if the picker is shown on button press.
  - `button_label`: String - The label for the button.
  - `button_tooltip`: String - Tooltip for the button.
- `get()`: Retrieves the currently selected color.
- `set(color)`: Sets the color picker to a specific color.
  - `color`: `ImColor` - The color to set.
