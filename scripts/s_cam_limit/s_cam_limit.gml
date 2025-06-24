function s_cam_limit() {
	
	// s_cam_limit();
	// esta funcion debe ser llamada siempre que movemos camara

	with o_control {
		var wview = camera_get_view_width(view_camera[0]);
		var hview = camera_get_view_height(view_camera[0]);
		var xview = camera_get_view_x(view_camera[0]);
		var yview = camera_get_view_y(view_camera[0]);
		camera_set_view_pos(view_camera[0],
			clamp(round(xview), -cam_data[3],
				(g_width * g_wbaldoza - wview) + cam_data[3]),
			clamp(round(yview), -cam_data[3],
				(g_height * g_hbaldoza - hview) + cam_data[3]));
	}
}
