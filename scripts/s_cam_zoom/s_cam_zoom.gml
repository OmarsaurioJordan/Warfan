function s_cam_zoom(char_down, char_up, extra_prop) {
	// poner char_down en vacio "" para no usar teclas
	// usualmente extra_prop es 0

	var rezi = 0;
	if char_down != "" {
	    if mouse_wheel_down() {
	        rezi = 1.1 + extra_prop;
	    }
	    else if keyboard_check_pressed(ord(char_down)) {
	        rezi = 1.2 + extra_prop;
	    }
	    else if mouse_wheel_up() {
	        rezi = 0.9 - extra_prop;
	    }
	    else if keyboard_check_pressed(ord(char_up)) {
	        rezi = 0.8 - extra_prop;
	    }
	}
	else {
	    if mouse_wheel_down() {
	        rezi = 1.1 + extra_prop;
	    }
	    else if mouse_wheel_up() {
	        rezi = 0.9 - extra_prop;
	    }
	}
	if rezi != 0 {
	    var mx = mouse_x;
	    var my = mouse_y;
		var wview = camera_get_view_width(view_camera[0]);
		var hview = camera_get_view_height(view_camera[0]);
		var xview = camera_get_view_x(view_camera[0]);
		var yview = camera_get_view_y(view_camera[0]);
	    if rezi == 1.2 + extra_prop or rezi == 0.8 - extra_prop {
	        mx = xview + wview / 2;
	        my = yview + hview / 2;
	    }
	    var cx = (mx - xview) / wview;
	    var cy = (my - yview) / hview;
		var hh, ww;
	    with o_control {
			hh = round(clamp(hview * rezi, cam_data[0], cam_data[1]));
			ww = round(hh * cam_data[2]);
			camera_set_view_size(view_camera[0], ww, hh);
	    }
	    camera_set_view_pos(view_camera[0], mx - cx * ww, my - cy * hh);
	    s_cam_limit();
	}
}
