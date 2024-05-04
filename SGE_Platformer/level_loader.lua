local module = {}

local global = require("mod/global")

local loaded_subscenes = {}

function module.update()
    local x, y = _e_get_location(global.player)
    
    if x > -26 and x < 50 and y > -30 then _en_load_scene("scene1", "mod/scenes/first_sequence/scene", 0, 0) 
    else _en_unload_scene("scene1")
    end
end

return module