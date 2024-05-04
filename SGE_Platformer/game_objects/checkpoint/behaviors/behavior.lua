local global = require("mod/global")

function on_overlap(e, d)
    local save_data = {}

    local px, py = _e_get_location(global.player)
    save_data.player_position = {x = px, y = py}

    local cconfig = _e_call(global.camera, "get_mode", {})
    save_data.camera_mode = cconfig[1]

    _en_save_data("savedata", save_data)
end