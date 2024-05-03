function on_init()
   _i_set_mouse_visible(false)

   local camera = _e_create()
   _e_add_camera(camera, "cam", 56)
   _c_c_set_active(camera, "cam")
   _e_teleport(camera, 0, -0.75)

   _a_play_sound_at_channel("mod/music/main_theme", "main-theme", true)
   _a_set_volume_at_channel("main-theme", 0.1)

   _en_load_scene("scene", "mod/scene/scene", 0, 0)
end