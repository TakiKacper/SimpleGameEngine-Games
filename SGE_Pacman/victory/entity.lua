local module = {}

function module.create()
    local text = _e_create()
    _e_teleport(text, 0, 30)
    _e_add_sprite(text, "sprite", "mod/victory/victory_texture", 0, "ignore")
    _e_set_layer(text, 2)
    _e_add_behavior(text, "behavior", "mod/victory/victory_behavior")
    return text
end

return module