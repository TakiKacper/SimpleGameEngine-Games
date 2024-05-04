local module = {}

function module.create(args)
    local player = _e_create()
    
    _e_add_flipbook(player, "flip", "mod/game_objects/player/textures/player_sprite_sheet", "idle", "ignore")
    _c_m_set_offset(player, "flip", 0, 0.2)

    _e_add_dynamics(player, "dynamics")
    _e_add_collider(player, "col", "player", 1, 1)
    _c_cl_set_layer_offset(player, "col", 0)

    _e_add_behavior(player, "controller_b", "mod/game_objects/player/behaviors/controller")
    _e_add_behavior(player, "die_b", "mod/game_objects/player/behaviors/die")

    _e_set_layer(player, 1)

    return player
end

return module