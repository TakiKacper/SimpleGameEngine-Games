local creator = require("mod/tiled_templates/creator")

function on_init()
    local tilemap = _e_create()
    _e_add_tilemap(tilemap, "tilemap", "mod/scenes/first_sequence/tilemap", "mod/tilesets/tileset", "wall")
    _en_create_entities_from_tilemap("mod/scenes/first_sequence/tilemap", creator.creator)
end