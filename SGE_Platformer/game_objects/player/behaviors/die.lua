function on_init() 
    self.dead = false
    self.time = 0
end

function event_damage()
    self.dead = true
    self.time = 1
end

local loader = require("mod/game_state_loader")

function on_update(e, dt)
    if self.dead == false then do return end end
    
    self.time = self.time - dt

    if self.time > 0 then do return end end

    self.dead = false
    loader.load_state()
    self.dead = false
    self.time = 1
end