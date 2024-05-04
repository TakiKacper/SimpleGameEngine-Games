function on_init(e, d)
    self.triggered = false
end

function on_overlap(e, player)
    if not self.triggered then
        _e_call(player, "damage", {})
        self.triggered = true
    end
end

function event_restart(e, args)
    self.triggered = false
end