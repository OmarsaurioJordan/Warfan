function s_display_init() {
	global.camera = camera_create()

	var _r = room_width / room_height;
	var _h = display_get_height();
	var _w = display_get_height() * _r;

	camera_set_view_size(global.camera, _w, _h);
	surface_resize(application_surface, _w, _h);
	display_set_gui_size(_w, _h);

	view_enabled = true;
	view_set_camera(0, global.camera);
	view_set_visible(0, global.camera);
}
