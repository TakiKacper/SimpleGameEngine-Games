local module = {}

function module.create(args)
    local ct = args.entity
    
    _e_add_collider(ct, "col", "player_trigger", args.width * 2, args.height * 2)

    _e_add_behavior(ct, "bhv", "mod/game_objects/camera_transition/behaviors/behavior")
    _e_set_layer(ct, 1)

    _c_b_call(ct, "bhv", "config", args)

    return ct
end

return module