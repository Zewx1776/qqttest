local utils      = require "core.utils"
local enums      = require "data.enums"
local tracker    = require "core.tracker"

local last_reset = 0
local task       = {
    name = "Exit Pit",
    shouldExecute = function()
        return utils.player_on_quest(enums.quests.pit_started) and not utils.player_on_quest(enums.quests.pit_ongoing) and
            not utils.loot_on_floor() and utils.player_in_zone("EGD_MSWK_World_01")
        -- We need to implement a check for the reward chest in the future, when QQT has Interactable check.
    end,
    Execute = function()
        if tracker.finished_time == 0 then
            tracker.finished_time = get_time_since_inject()
        end

        if get_time_since_inject() > tracker.finished_time + 5 then
            if get_time_since_inject() - last_reset > 2 then
                last_reset = get_time_since_inject()
                reset_all_dungeons()
                console.print("Reset")
            end
        end
    end
}

return task
