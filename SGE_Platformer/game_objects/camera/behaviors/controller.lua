local modes = require("mod/game_objects/camera/camera_modes")
local global = require("mod/global")

local snap_threshold = 0.05
local transition_speed = 5

local function lerp(a, b, x, dt) return a + (b - a) * (1.0 - math.exp(-x * dt)) end
local function clamp(v, min, max)
    if min > v then return min
    elseif max < v then return max
    else return v end
end

local function snap(value, target, threshold)
    if math.abs(value - target) < threshold then return target end
    return value
end

function on_init(e)
    self.mode = modes.static
    self.posx = 0
    self.posy = 0
end

function on_update(e, dt)
    local new_x = nil
    local new_y = nil

    local x, y = _e_get_location(e)
    local px, py = _e_get_location(global.player)  

    if self.mode == modes.static then 
        new_x = lerp(x, self.posx, 1, dt * transition_speed)
        new_y = lerp(y, self.posy, 1, dt * transition_speed)
        new_x = snap(new_x, self.posx, snap_threshold)
        new_y = snap(new_y, self.posy, snap_threshold)
    elseif self.mode == modes.follow_x then    
        new_x = lerp(x, px, 1, dt * transition_speed)
        new_x = clamp(new_x, self.lower_bound, self.bigger_bound)
        new_y = lerp(y, self.sec_axis, 1, dt * transition_speed)
        new_y = snap(new_y, self.sec_axis, snap_threshold)
    elseif self.mode == modes.follow_y then
        new_x = lerp(x, self.sec_axis, 1, dt * transition_speed)
        new_x = snap(new_x, self.sec_axis, snap_threshold)
        new_y = lerp(y, py, 1, dt * transition_speed)
        new_y = clamp(new_y, self.lower_bound, self.bigger_bound)
    end
    _e_teleport(e, new_x, new_y)
end

function event_set_mode(e, config)
    self.mode = config.mode
    self.posx = config.posx
    self.posy = config.posy
    self.lower_bound = config.lower_bound
    self.bigger_bound = config.bigger_bound
    self.sec_axis = config.sec_axis
end

function event_get_mode(e, args)
    local config = {
        mode = self.mode,
        posx = self.posx,
        posy = self.posy,
        lower_bound = self.lower_bound,
        bigger_bound = self.bigger_bound,
        sec_axis = self.sec_axis
    }

    return config
end