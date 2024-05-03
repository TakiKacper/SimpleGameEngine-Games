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

function on_init(e)
    self.dir = 3
end

local movement_speed = 7

function on_update(e, dt)
    dt = _en_time_period_to_physics(dt)

    local x, y = _e_get_location(e)
    local hit = _e_sweep(e, mod_by_dir(x, y, self.dir, movement_speed * dt))
    
    if hit then self.dir = math.random(4) end

    if self.dir == 1 then _c_m_set_scale(e, "flip", -1, 1)
    elseif self.dir == 2 then _c_m_set_scale(e, "flip", 1, 1) end
end

local game_state = require("mod/game_state")

function on_overlap(ent, other)
    _e_call(other, "die", {})
end

function event_restart(e, args)
    _e_teleport(e, 0, 0)
end