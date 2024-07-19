# **Color Class Documentation**

## Introduction
The `color` class in Lua scripting provides a way to define and utilize colors in your scripts. This class allows for the creation of color objects with varying degrees of red, green, blue, and alpha (transparency) values.

## Constructors

### Color with RGB
`color(r: number (int), g: number (int), b: number (int))`
> Creates a new `color` object using RGB values.
> - `r`: Red component (0-255).
> - `g`: Green component (0-255).
> - `b`: Blue component (0-255).

### Color with RGBA
`color(r: number (int), g: number (int), b: number (int), a: number (int))`
> Creates a new `color` object using RGBA values.
> - `r`: Red component (0-255).
> - `g`: Green component (0-255).
> - `b`: Blue component (0-255).
> - `a`: Alpha component (0-255) for transparency.

## Examples

```lua
-- Creating a solid red color
local color_red = color.new(255, 0, 0)

-- Creating a white color with full opacity
local color_white = color.new(255, 255, 255, 255)
```

### Predefined Colors
> In addition to custom colors, the Lua scripting environment for Diablo also provides a variety of predefined colors as global functions. These global color functions are readily accessible and can be customized with an alpha value to control their transparency.

```lua
color_white(alpha);
color_black(alpha);
color_yellow(alpha);
color_red(alpha);
color_green(alpha);
color_blue(alpha);
color_pink(alpha);
color_purple(alpha);
color_grey(alpha);
color_brown(alpha);
color_gold(alpha);
color_silver(alpha);
color_orange(alpha);
color_cyan(alpha);
color_green_pastel(alpha);
color_red_pale(alpha);
color_green_pale(alpha);
color_blue_pale(alpha);
color_cyan_pale(alpha);
color_gray_pale(alpha);
color_gray_clear(alpha);
color_orange_red(alpha);
```

> Each predefined color function accepts an alpha parameter (0-255), allowing you to control the transparency level of the color.