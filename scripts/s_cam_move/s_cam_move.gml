function s_cam_move(key_mouse) {
	// key_mouse usualmente es mb_right

	with o_control {
		var xview = camera_get_view_x(view_camera[0]);
		var yview = camera_get_view_y(view_camera[0]);
	    if cam_data[4] != 0 and cam_data[5] != 0 {
			camera_set_view_pos(view_camera[0],
		        xview + cam_data[4] - mouse_x,
		        yview + cam_data[5] - mouse_y);
	        s_cam_limit();
			// cosas del tutorial
			with o_juego {
				if tutorial == 0 {
					if tuto_camara != -1 and abs(tuto_camara - xview) > 400 {
						tuto_camara = -1;
					}
					if tuto_camara == -1 and tuto_zoom == -1 {
						tutorial++;
					}
				}
			}
	    }
	    if mouse_check_button_pressed(key_mouse) {
	        cam_data[4] = mouse_x;
	        cam_data[5] = mouse_y;
	    }
	    else if mouse_check_button_released(key_mouse) {
	        cam_data[4] = 0;
	        cam_data[5] = 0;
	    }
	}
}
