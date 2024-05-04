local module = {}

function module.create(args)
    local camera = _e_create()
    
    _e_add_camera(camera, "cam", 26)
    _c_c_set_active(camera, "cam")

    _c_c_set_lowest_layer(camera, "cam", 0)
    _c_c_set_highest_layer(camera, "cam", 2)

    _e_add_behavior(camera, "bhv", "mod/game_objects/camera/behaviors/controller")
    
    return camera
end

return module