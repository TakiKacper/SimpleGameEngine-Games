local module = {}

function module.create()
    local pacman = _e_create()

    _e_add_flipbook(pacman, "flip", "mod/pacman/pacman_sprites", "eat_v", "pacman")
    _e_teleport(pacman, -0.5, -13.5)

    _e_add_collider(pacman, "collider", "pacman", 1, 1)
    _c_cl_set_layer_offset(pacman, "collider", 1)
    _c_cl_set_extend(pacman, "collider", 1.9, 1.9)

    _e_add_behavior(pacman, "behavior", "mod/pacman/pacman_behavior")
    _c_s_set_shader(pacman, "flip", "mod/shaders/sprite_shader")

    _e_add_listener(pacman, "listener")
    _c_l_set_active(pacman, "listener")

    return pacman
end

return module