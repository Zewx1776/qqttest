local utils = require "core.utils"
local enums = require "data.enums"

local task  = {
    name = "Enter Portal",
    shouldExecute = function()
        return utils.get_pit_portal()
    end,
    Execute = function()
        local portal = utils.get_pit_portal()
        if portal then
            interact_object(portal)
        end
    end
}

return task
