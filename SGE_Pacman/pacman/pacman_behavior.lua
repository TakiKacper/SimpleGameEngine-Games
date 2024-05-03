local movement_speed = 5

local dirs = {
    left = 1,
    right = 2,
    up = 3,
    down = 4
}

local function mod_by_dir(x, y, dir, value)
    if dir == 1 then
        return x - value, y
    elseif dir == 2 then
        return x + value, y
    elseif dir == 3 then
        return x, y + value
    elseif dir == 4 then
        return x, y - value
    end
    return x, y
end

function on_init(e, dt)
    self.dir = dirs.up
    self.dying = false
end

local game_state = require("mod/game_state")

function on_update(e, dt)
    if self.dying then 
        self.dying_time = self.dying_time - dt
        if self.dying_time < 0 then
            game_state.restart()
        end
        do return end
    end

    if self.restart then
        self.restart = false
        _e_teleport(e, -0.5, -13.5)
        do return end
    end

    dt = _en_time_period_to_physics(dt)

    local next_dir = nil

    if _i_action("left") then next_dir = dirs.left
    elseif _i_action("right") then next_dir = dirs.right
    elseif _i_action("up") then next_dir = dirs.up
    elseif _i_action("down") then next_dir = dirs.down end

    local x, y = _e_get_location(e)
    local in_tile_center = (x - math.floor(x) + y - math.floor(y)) > 0.8

    if self.dir ~= next_dir and next_dir ~= nil and in_tile_center then
        x, y = _e_get_location(e)
        self.dir = next_dir
    end

    local hit = false
    if self.dir == dirs.left then
        _c_f_set_animation(e, "flip", "eat_h")
        _c_m_set_scale(e, "flip", -1, 1)
        hit = _e_sweep(e, x - movement_speed * dt, y)
    elseif self.dir == dirs.right then
        _c_f_set_animation(e, "flip", "eat_h")
        _c_m_set_scale(e, "flip", 1, 1)
        hit = _e_sweep(e, x + movement_speed * dt, y)
    elseif self.dir == dirs.up then
        _c_f_set_animation(e, "flip", "eat_v")
        _c_m_set_scale(e, "flip", 1, 1)
        hit = _e_sweep(e, x, y + movement_speed * dt)
    elseif self.dir == dirs.down then
        _c_f_set_animation(e, "flip", "eat_v")
        _c_m_set_scale(e, "flip", 1, -1)
        hit = _e_sweep(e, x, y - movement_speed * dt)
    end

    if hit then
        x, y = _e_get_location(e)
        _e_sweep(e, math.floor(x + 1) - 0.5, math.floor(y + 1) - 0.5)
    end
end

function event_die(e, dt)
    if self.dying then do return end end

    self.dying = true
    _c_f_set_animation(e, "flip", "die")
    self.dying_time = 1
end

function event_restart(e, dt)
    self.dying = false
    self.restart = true
end