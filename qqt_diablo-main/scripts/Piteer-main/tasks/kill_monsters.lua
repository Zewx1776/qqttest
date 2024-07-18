local utils      = require "core.utils"
local enums      = require "data.enums"
local settings   = require "core.settings"
local navigation = require "core.navigation"
local explorer   = require "core.explorer"

local task       = {
    name = "Kill Monsters",
    shouldExecute = function()
        if not utils.player_on_quest(enums.quests.pit_ongoing) then
            return false
        end

        local close_enemy = utils.get_closest_enemy()
        return close_enemy ~= nil
    end,
    Execute = function()
        local distance_check = settings.melee_logic and 2 or 10
        local enemy = utils.get_closest_enemy()
        if not enemy then return false end

        local within_distance = utils.distance_to(enemy) < distance_check

        if not within_distance then
            explorer:set_custom_target(enemy:get_position())
        else
            interact_object(enemy)
        end
    end
}

return task
