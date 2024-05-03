local module = {}

module.points_amount = 0

function module.make_point(e)
    _e_add_sprite(e, "sprite", "mod/point/point_sprite", 0, "pickable")
    _c_cl_set_extend(e, "sprite", 1.9, 1.9)

    _e_add_behavior(e, "behavior", "mod/point/point_behavior")

    local x, y = _e_get_location(e)
    _e_teleport(e, x + 0.5, y - 0.5)
    _e_set_layer(e, 0)
    
    module.points_amount = module.points_amount + 1
end

return module