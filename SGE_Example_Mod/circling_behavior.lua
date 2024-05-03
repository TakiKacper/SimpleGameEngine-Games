--this behavior makes entity move in a circle

--import the multiply module
local mul = require("mod/multiply")
local radius = 3

function on_init(e)
    self.angle = 0
end

function on_update(e, dt)
    --applies time dilation modyficator on the delta time so the entity will stop when the dilation is equal to 0
    dt = _en_time_period_to_physics(dt)
    local hited = _e_sweep(
        e, 
        mul.multiply(math.sin(self.angle), radius), 
        mul.multiply(math.cos(self.angle), radius)
    )
    if not hited then
        self.angle = self.angle + dt
    end
end