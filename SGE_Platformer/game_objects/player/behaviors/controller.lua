local walk_acceleration = 48
local max_walk_speed = 24
local climbing_speed = 3

local default_drag = 8
local launch_drag = 2

local jump_vel = 10

local launch_time = 0.3
local wall_off_jump_force = 330
local wall_jump_of_time_frame = 0.3

local wall_searching_trace_height_offset = 0

local states = {
    free = 1,
    climbing = 2,
    launch = 3
}

local function sign(n)
    if n > 0 then return 1
    elseif n < 0 then return -1
    else return 0 end
end

local function get_jump_off_dir(e)
    local x, y = _e_get_location(e)

    trace = _cl_trace("look_for_wall", x, y, x + 0.3, y + wall_searching_trace_height_offset)
    trace2 = _cl_trace("look_for_wall", x, y, x + - 0.3, y + wall_searching_trace_height_offset)

    if trace.distance == nil then return 1 end
    if trace2.distance == nil then return -1 end
    if trace.distance < trace2.distance then return -1 end
    return 1
end

function on_init(e)
    _c_d_set_drag(e, "dynamics", default_drag)
    _c_d_set_use_max_vel(e, "dynamics", true)
    _c_d_set_max_vel(e, "dynamics", max_walk_speed)
    self.jumped = false
    self.state = states.free
    self.state_duration = 0
    self.time_since_climbing = 0
    self.climb_normal = 0
    self.jump_used = false
    self.dead = false;
end

function on_update(e, dt)
    if self.dead then do return end end

    local ix = _i_axis("move_right")
    local iy = _i_axis("move_up")
    local jumping = _i_action("jump")
    local grounded = _c_d_get_grounded(e, "dynamics")
    local x, y = _e_get_location(e)

    --Rotate Flipbook
    local velx, vely = _c_d_get_vel(e, "dynamics")
    if velx > 0 then
        _c_m_set_scale(e, "flip", 1, 1)
    elseif velx < 0 then
        _c_m_set_scale(e, "flip", -1, 1)
    end

    if _i_action_just_relased("jump") then
        self.jump_used = false
    end

    --Check if should switch state
    if self.state ~= states.launch then
        self.state = states.free
        _c_d_set_drag(e, "dynamics", default_drag)
    end

    --Do states dependand logic
    if self.state == states.free then
        self.time_since_climbing = self.time_since_climbing + dt

        _c_d_set_gravity_enabled(e, "dynamics", true)
        _c_d_add_movement_input(e, "dynamics", ix, 0, walk_acceleration)

        if jumping and grounded then
            local vx, vy = _c_d_get_vel(e, "dynamics")
            _c_d_set_vel(e, "dynamics", vx, jump_vel)
        elseif jumping and not grounded and self.time_since_climbing < wall_jump_of_time_frame then
            _c_d_set_vel(e, "dynamics", 0, 0)
            _c_d_add_movement_input(e, "dynamics", get_jump_off_dir(e), 1, wall_off_jump_force)
            self.state = states.launch
            self.state_duration = launch_time
        end
    end
end

function on_collide(e, other)
    self.jumped = false
end

function event_damage(e, args)
    self.dead = true
    local velx, vely = _c_d_get_vel(e, "dynamics")
    velx = -5 * sign(velx)
    vely = -5 * sign(vely)
    _c_d_set_vel(e, "dynamics", velx, vely)
end

function event_restart(e, args)
    self.dead = false
end