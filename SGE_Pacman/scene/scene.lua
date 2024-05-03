local pacman = require("mod/pacman/entity")
local cherry = require("mod/cherry/entity")
local ghost = require("mod/ghosts/entity")
local point = require("mod/point/entity")

local function creator(args)
    if args.class == "cherry" then
        cherry.make_cherry(args.entity)
    elseif args.class == "point" then
        point.make_point(args.entity)
    end
end

function on_init()
    local tilemap = _e_create()
    _e_add_tilemap(tilemap, "tilemap", "mod/scene/tilemap", "mod/tileset/tileset", "wall")
    _e_set_layer(tilemap, 1)  

    local pacman = pacman.create()

    _en_create_entities_from_tilemap("mod/scene/tilemap", creator)

    local ghost1 = ghost.create("red")
    local ghost2 = ghost.create("green")
    local ghost3 = ghost.create("yellow")
    local ghost4 = ghost.create("purple")
end