function on_overlap(e, other)
    if self.used then do return end end
    self.used = true
    _c_m_set_visible(e, "sprite", false)
end

function event_restart(e, args)
    self.used = false
    _c_m_set_visible(e, "sprite", true)
end