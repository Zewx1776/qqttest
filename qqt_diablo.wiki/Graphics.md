# **Graphics Module Documentation**

## Overview
The Graphics module provides a versatile set of functions for drawing shapes, text, and images on the screen, enhancing the visual aspects of scripts.

## Functions

### Draw Filled Circle (2D)
`graphics.circle_2d_filled(pos, radius, color)`
- `pos`: [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2) - Center position of the circle.
- `radius`: Number - Radius of the circle.
- `color`: [`color`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Color) - Color of the circle.

> [!NOTE]
> This function draws a solid, filled circle in 2D space. Useful for highlighting areas or points on the screen.

### Draw Circle Outline (2D)
`graphics.circle_2d(pos, radius, color, thickness)`
- `pos`: [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2) - Center position.
- `radius`: Number - Circle's radius.
- `color`: [`color`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Color) - Outline color.
- `thickness`: Number - Thickness of the outline.

> [!NOTE]
> Creates a 2D circle outline. Ideal for marking areas without obscuring underlying details.

### Draw Circle Outline at 3D Position
`graphics.circle_2d(pos, radius, color)`
- `pos`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - 3D center position.

> [!NOTE]
> Renders a 2D circle outline based on a 3D position. Useful for visualizing areas around objects or locations in the game world.

### Render 3D Text
`graphics.text_3d(text, pos, size, color)`
- `text`: String - The text to display.
- `pos`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - Position for the text.
- `size`: Number - Font size.
- `color`: [`color`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Color) - Text color.

> [!NOTE]
> This function allows displaying text in a 3D space, which can float above game objects or specific locations.
> **Example**: `graphics.text_3d("Hello World", get_player_position(), 15, color_white(255))`

```lua
on_render(function()
    local player_position = get_player_position();
    local enemies_list = actors_manager.get_enemy_npcs();

    -- sorting actors by distance to the local player
    table.sort( enemies_list, function(a, b)
        return a:get_position():squared_dist_to_ignore_z(player_position) <
         b:get_position():squared_dist_to_ignore_z(player_position)
    end);

    for i, obj in ipairs(enemies_list) do
        local obj_position = obj:get_position();
        local distance_sqr = obj_position:squared_dist_to_ignore_z(player_position);

        if distance_sqr < (14.0 * 14.0) then
            graphics.text_3d(tostring(i) .. ": " .. obj:get_skin_name(), 
            obj_position, 20, color_white(255));
        end
    end
end);
```

![](https://aimsharp.net/wp-content/uploads/2023/12/d1.jpg)

### Draw Line
`graphics.line(from, to, color, thickness)`
- `from`, `to`: [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2) - Start and end points.
- `color`: [`color`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Color) - Line color.
- `thickness`: Number - Line thickness.

> Alternative from and to can be vec3

> [!NOTE]
> Useful for connecting two points with a visible line, aiding in mapping paths or connections between elements.

### Draw Rectangle Outline
`graphics.rect(from, to, color, rounding, thickness)`
- `from`, `to`: [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2) - Corner points of the rectangle.
- `color`: [`color`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Color) - Outline color.
- `rounding`: number (float)
- `thickness`: number (float)

> [!NOTE]
> Outlines a rectangular area on the screen, perfect for framing sections or creating boundaries.

### Draw Filled Rectangle
`graphics.rect_filled(from, to, color)`
- `from`, `to`: [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2) - Corner points.
- `color`: [`color`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Color) - Fill color.

> [!NOTE]
> Fills a specified rectangular area with color. Great for background elements or highlighting zones.

```lua
on_render(function()
    local local_player = get_local_player();
    if not local_player then
        return;
    end

    local maxt_health = local_player:get_max_health();
    local current_health = local_player:get_current_health();
    local health_percentage = current_health / maxt_health;

    local player_position = local_player:get_position();
    local player_position_2d = graphics.w2s(player_position);
    if player_position_2d:is_zero() then
        return;
    end
   
    -- copy player_position_2d vec2 to avoid reference
    local health_bar_position =  vec2.new(player_position_2d.x, player_position_2d.y);
    health_bar_position.y = health_bar_position.y - 125;

    local start_point = vec2.new(health_bar_position.x, health_bar_position.y);
    start_point.x = start_point.x - 75;
   
    local end_point = vec2.new(health_bar_position.x, health_bar_position.y);
    end_point.x = end_point.x + 75;
    end_point.y = end_point.y - 13;

    local end_height = end_point.y;

    -- background
    graphics.rect_filled(start_point, end_point, color_black(200))

    -- healthbar %
    local distance = start_point:distance(end_point);
    local health_bar_end = start_point:get_extended(end_point, distance * health_percentage);
    health_bar_end.y = end_height;
    graphics.rect_filled(start_point, health_bar_end, color_green(150));    
end);
```

![](https://aimsharp.net/wp-content/uploads/2023/12/d2.jpg)

### Load Image
`graphics.load_image(path_to_asset)`
- `path_to_asset`: String - Path to the image file.

> [!NOTE]
> Loads an image from the specified file path, preparing it for rendering in the game environment.

### Draw Image
`graphics.draw_image(image, pos)`
- `image`: Loaded image object.
- `pos`: [`vec2`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-2) - Position to place the image.

> [!NOTE]
> Renders a previously loaded image at a specified position. Ideal for adding custom visuals or icons.

### World to Screen
`graphics.w2s(start_position)`
- `start_position`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - 3D world position.

> [!NOTE]
> Converts a 3D world position to a 2D screen position, bridging the gap between game world and screen space.

### Draw 3D Circle
`graphics.circle_3d(pos, radius, color)`
- `pos`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - Center position in 3D space.
- `radius`: Number - Circle's radius.
- `color`: [`color`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Color) - Circle color.

> [!NOTE]
> Draws a circle that appears in 3D space, useful for encircling objects or points of interest.

### Render Text
`graphics.l_text(text, pos, size, color)`
- `text`: String - Text content.
- `pos`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - Text position in 3D.
- `size`: Number - Font size.
- `color`: [`color`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Color) - Text color.

> Alternative graphics.l_text_2d(text, pos, size, color)

> [!NOTE]
> This function is designed for displaying large, noticeable text in a 3D environment.

### Draw 3D Rectangle
`graphics.rect_3d(from, to, width, color, thickness)`
- `from`, `to`: [`vec3`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Vector-3) - 3D start and end points.
- `width`: Number - Rectangle width.
- `color`: [`color`](https://github.com/qqtnn/diablo_lua_documentation/wiki/Color) - Rectangle color.
- `thickness`: Number - Outline thickness.

> [!NOTE]
> Creates a 3D rectangular shape, extending between two points in space. Effective for visualizing areas or paths in the game world.
