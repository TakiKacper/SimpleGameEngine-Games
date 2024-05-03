local module = {}

function module.create(color)
    local ghost = _e_create()

    _e_add_flipbook(ghost, "flip", "mod/ghosts/ghosts_sprites", color, "ghost")
    _c_cl_set_extend(ghost, "flip", 1.6, 1.6)

    _e_teleport(ghost, 0, 0)
    _c_s_set_shader(ghost, "flip", "mod/shaders/sprite_shader")

    _e_add_behavior(ghost, "behavior", "mod/ghosts/ghost_behavior")
    _e_set_layer(ghost, 1)

    return ghost
end

return module