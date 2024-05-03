local point = require("mod/point/entity")
local victory = require("mod/victory/entity")

function on_overlap(e, other)
    if self.used then do return end end
    self.used = true
    _c_m_set_visible(e, "sprite", false)
    point.points_amount = point.points_amount - 1
    if point.points_amount <= 0 then
        victory.create()
    end
end

function event_restart(e, args)
    if self.used then point.points_amount = point.points_amount + 1 end
    self.used = false
    _c_m_set_visible(e, "sprite", true)
end