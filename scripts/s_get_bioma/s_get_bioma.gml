function s_get_bioma(pos_x, pos_y) {
	
	with o_juego {
		var xx = clamp(floor(pos_x / m_wcelda), 0, g_width_c - 1);
		var yy = clamp(floor(pos_y / m_hcelda), 0, g_height_c - 1);
		return ds_grid_get(biomas, xx, yy);
	}
	return false;
}
