local module = {}

function module.restart()
    local e = _en_get_entities_in_scene("scene")
    for k, v in pairs(e) do
        _e_call(v, "restart", {})
    end
end

return module