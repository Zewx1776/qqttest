local utils      = require "core.utils"
local enums      = require "data.enums"
local navigation = require "core.navigation"
local settings   = require "core.settings"
local tracker    = require "core.tracker"

local last_open  = 0

local task       = {
    name = "Open Pit",
    shouldExecute = function()
        return utils.player_in_zone("Scos_Cerrigar") and not utils.get_pit_portal()
    end,
    Execute = function()
        if tracker.finished_time ~= 0 then
            tracker.finished_time = 0
        end

        local obelisk = utils.get_obelisk()
        if obelisk then
            interact_object(obelisk)

            if utils.distance_to(obelisk) < 2 and get_time_since_inject() - last_open > 2 then
                local pit_level = settings.pit_level
                --utility.open_pit_portal(pit_level) -- NYI!
                utility.open_pit_portal(0x1C34EB)
                last_open = get_time_since_inject()
            end
        else
            navigation:pathfind_to(enums.positions.obelisk_position)
        end
    end
}

return task
