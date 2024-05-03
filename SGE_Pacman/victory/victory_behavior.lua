local game_state = require("mod/game_state")

function on_init(e)
    self.restart = false
    _en_set_physics_time_dilation(0)
end

function on_update(e, dt)
    local x, y = _e_get_location(e)
    _e_teleport(e, x, y - dt * 10)

    if y < -20 then
        game_state.restart()
        _en_set_physics_time_dilation(1)
        _e_kill(e)
    end
end