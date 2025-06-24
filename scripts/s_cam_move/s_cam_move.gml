function s_cam_move(argument0) {
	
	// s_cam_move(key_mouse);
	// key_mouse usualmente es mb_right

	with o_control {
		var xview = camera_get_view_x(view_camera[0]);
		var yview = camera_get_view_y(view_camera[0]);
	    if cam_data[4] != 0 and cam_data[5] != 0 {
			camera_set_view_pos(view_camera[0],
		        xview + cam_data[4] - mouse_x,
		        yview + cam_data[5] - mouse_y);
	        s_cam_limit();
	    }
	    if mouse_check_button_pressed(argument0) {
	        cam_data[4] = mouse_x;
	        cam_data[5] = mouse_y;
	    }
	    else if mouse_check_button_released(argument0) {
	        cam_data[4] = 0;
	        cam_data[5] = 0;
	    }
	}
}
