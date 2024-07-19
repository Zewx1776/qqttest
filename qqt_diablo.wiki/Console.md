# **Console Documentation**

## Basic and Advanced Console Printing
Our console comes with two handy functions for displaying text: `console.print` for your regular printing needs and `console.print_full` when you need something a bit more sophisticated, like timed and repeated messages.

### Console Print
`console.print(...)`
> [!NOTE]
> The `console.print` function is utilized for standard console output. It efficiently handles various data types such as integers, strings, and floating-point numbers. This function is ideal for simple debugging or displaying information.
> 
> **Example:**
> ```lua
> console.print(123, "hello", 3222, 322.0)
> ```
> Output: `123 hello 3222 322.0`

### Console Print Full
`console.print_full(delay, interval, ...)`
> [!NOTE]
> `console.print_full` offers controlled printing capabilities with specified delay and interval parameters. It is particularly useful for tracking values over time, without cluttering the console with rapid outputs.
>
> **Parameters:**
> - `delay`: Time in seconds before the initial print.
> - `interval`: Time in seconds between subsequent prints.
> - `...`: Various data elements to be printed.
>
> **Example:**
> ```lua
> console.print_full(2.0, 1.0, "hi", 323232, 55.0, "apple")
> ```
> Commences printing 2 seconds after invocation, following with repetitive prints of `hi 323232 55.0 apple` every 1 second.

> [!TIP]
> Console Toggle Keybind: `F1`

### Code Examples:

```lua
on_update(function()
    for _, actor in ipairs(actors_manager.get_all_actors()) do
        console.print("Actor ID: ", actor:get_id());
     end;
end);
```

