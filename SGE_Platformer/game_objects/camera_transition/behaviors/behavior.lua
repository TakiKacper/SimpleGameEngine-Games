local global = require("mod/global")
local camera_modes = require("mod/game_objects/camera/camera_modes")

function event_config(e, args)
    local config = {}
    config.length = args.length
    config.posx = args.posx
    config.posy = args.posy
    config.lower_bound = args.l_bound
    config.bigger_bound = args.b_bound
    config.sec_axis = args.sec_axis

    if args.mode == "follow_x" then 
        config.mode = camera_modes.follow_x
    elseif args.mode == "follow_y" then
        config.mode = camera_modes.follow_y
    else
        config.mode = camera_modes.static
    end

    self.config = config
end

function on_overlap(e, d)
    _e_call(global.camera, "set_mode", self.config)
end