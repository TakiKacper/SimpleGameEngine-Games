local player_c = require("mod/game_objects/player/entity")
local camera_c = require("mod/game_objects/camera/entity")

local global = require("mod/global")
local loader = require("mod/game_state_loader")
local level_loader = require("mod/level_loader")

function on_init()
   _i_set_mouse_visible(false)

   local player = player_c.create({})
   local camera = camera_c.create({})

   global.player = player
   global.camera = camera

   loader.load_state()
   level_loader.update()
end

function on_update()
   level_loader.update()
end