local task_manager = {}
local tasks = {}
local current_task = nil
local finished_time = 0

function task_manager.set_finished_time(time)
    finished_time = time
end

function task_manager.get_finished_time()
    return finished_time
end

function task_manager.register_task(task)
    table.insert(tasks, task)
end

function task_manager.execute_tasks()
    for _, task in ipairs(tasks) do
        if task.shouldExecute() then
            current_task = task
            task.Execute()
            break -- Execute only one task per pulse
        end
    end
    if not current_task then
        current_task = { name = "Idle" } -- Default state when no task is active
    end
end

function task_manager.get_current_task()
    return current_task or { name = "Idle" }
end

local task_files = { "kill_monsters", "enter_portal", "explore_pit", "town_salvage", "open_pit", "finish_pit", "exit_pit" }
for _, file in ipairs(task_files) do
    local task = require("tasks." .. file)
    task_manager.register_task(task)
end

return task_manager
