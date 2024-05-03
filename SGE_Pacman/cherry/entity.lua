local module = {}

function module.make_cherry(e)
    _e_add_sprite(e, "sprite", "mod/cherry/cherry_sprite", 0, "pickable")

    _e_add_behavior(e, "behavior", "mod/cherry/cherry_behavior")

    local x, y = _e_get_location(e)
    _e_teleport(e, x + 0.5, y - 0.5)
    _e_set_layer(e, 0)
end

return module