--this behavior makes entity moveable with wasd keys
--also allow to pause physics by making time dilation modyficator = 0

local movement_speed = 6

function on_init(e)
    _e_add_dynamics(e, "dynamics")
    _c_d_set_drag(e, "dynamics", 0.99)
    _c_d_set_use_max_vel(e, "dynamics", true)
    _c_d_set_max_vel(e, "dynamics", 3)
end

function on_update(e, dt)
    local ax = _i_axis("move_right")
    local ay = _i_axis("move_up")

    _c_d_add_movement_input(e, "dynamics", ax, ay, movement_speed)

    if _i_action("pause") then
        _en_set_physics_time_dilation(0)
    else
        _en_set_physics_time_dilation(1)
    end
end