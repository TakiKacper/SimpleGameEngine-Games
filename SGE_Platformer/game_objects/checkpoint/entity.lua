local module = {}

function module.create(args)
    local ch = args.entity

    _e_add_collider(ch, "col", "player_trigger", args.width * 2, args.height * 2)
    _e_add_behavior(ch, "bhv", "mod/game_objects/checkpoint/behaviors/behavior")
    _e_set_layer(ch, 1)

    return ct
end

return module