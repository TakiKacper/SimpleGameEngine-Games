function on_init()
   _i_set_mouse_visible(false)

   --creates a camera and make it active so the scene gets rendered
   local camera = _e_create()
   _e_add_camera(camera, "camera", 16)
   _c_c_set_active(camera, "camera")

   --creates a entity that moves on a circle path
   local on_circle = _e_create()
   _e_teleport(on_circle, 0, 3)
   _e_add_sprite(on_circle, "sprite", "mod/some_sprite_sheet", 1, "body")
   _e_add_behavior(on_circle, "behavior", "mod/circling_behavior")

   --creates a entity that can be controlled
   --move with wasd, pause physics with space
   local moveable = _e_create()
   _e_add_sprite(moveable, "sprite", "mod/some_sprite_sheet", 3, "body")
   _e_add_behavior(moveable, "behavior", "mod/movable_behavior")
end