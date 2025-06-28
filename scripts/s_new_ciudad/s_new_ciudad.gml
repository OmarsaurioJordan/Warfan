function s_new_ciudad(pos_x, pos_y, el_grupo, radio_city) {
	
	// posicionar la camara
	if el_grupo == g_migrupo {
		camera_set_view_pos(view_camera[0],
		    pos_x - camera_get_view_width(view_camera[0]) / 2,
		    pos_y - camera_get_view_height(view_camera[0]) / 2 -
				m_altu_vuelo / 2);
		s_cam_limit();
	}
	// creae edificios
	s_new_edificio(pos_x, pos_y, o_fabrica, el_grupo);
	s_new_edifiradio(pos_x, pos_y, radio_city, o_cuartel, el_grupo);
	s_new_edifiradio(pos_x, pos_y, radio_city, o_fuerte, el_grupo);
	var aux;
	repeat 5 {
		aux = s_new_edifiradio(pos_x, pos_y, radio_city, o_edificio, el_grupo);
		if aux != noone {
			aux.nivel = 2;
		}
	}
}
