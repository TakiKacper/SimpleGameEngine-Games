local module = {}

local camera_transition = require("mod/game_objects/camera_transition/entity")
local checkpoint = require("mod/game_objects/checkpoint/entity")
local void = require("mod/game_objects/void/entity")

--this function builds objects in _en_create_entities_from_tilemap func
function module.creator(args)
    if args.class == "camera_transition" then
        camera_transition.create(args)
    elseif args.class == "checkpoint" then
        checkpoint.create(args)
    elseif args.class == "void" then
        void.create(args)
    else
        print("Failed to create entity of class: "..args.class)
    end
end

return module