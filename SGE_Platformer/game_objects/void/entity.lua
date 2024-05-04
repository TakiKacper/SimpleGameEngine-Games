local module = {}

function module.create(args)
    local v = args.entity

    _e_add_collider(v, "col", "player_trigger", args.width * 2, args.height * 2)
    _e_add_behavior(v, "bhv", "mod/game_objects/void/behaviors/behavior")
    _e_set_layer(v, 1)

    return v
end

return module