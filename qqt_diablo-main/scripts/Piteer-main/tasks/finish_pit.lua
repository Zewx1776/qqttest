local utils = require "core.utils"
local enums = require "data.enums"

local task  = {
    name = "Finish Pit",
    shouldExecute = function()
        return utils.player_on_quest(enums.quests.pit_started) and not utils.player_on_quest(enums.quests.pit_ongoing) and
            utils.loot_on_floor()
    end,
    Execute = function()
        local items = loot_manager.get_all_items_chest_sort_by_distance()
        if #items > 0 then
            for _, item in pairs(items) do
                if loot_manager.is_lootable_item(item, true, false) then
                    interact_object(item)
                    return
                end
            end
        end
    end
}

return task
