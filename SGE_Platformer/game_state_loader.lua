local module = {}

local global = require("mod/global")
local camera_modes = require("mod/game_objects/camera/camera_modes")

function module.load_state()
    local save_exists = _en_data_exists("savedata")

    if not save_exists then
        local create_savedata = {
            player_position = {x = -20, y = -18},
            camera_mode = {bigger_bound = 0.0, lower_bound = 0.0, mode = camera_modes.static, posx = -26, posy = -15, sec_axis = 0.0}
        }
        _en_save_data("savedata", create_savedata)
    end

    local savedata = _en_load_data("savedata")
    _e_teleport(global.player, savedata.player_position.x, savedata.player_position.y)
    _e_call(global.camera, "set_mode", savedata.camera_mode)
    _e_teleport(global.camera, savedata.camera_mode.posx, savedata.camera_mode.posy)

    local entities = _en_get_entities_in_scene("scene1")
    for k, v in pairs(entities) do
        _e_call(v, "restart", {})
    end

    _e_call(global.player, "restart", {})
    _e_call(global.camera, "restart", {})
end

return module