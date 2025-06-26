function s_get_bioma(pos_x, pos_y) {
	
	return ds_grid_get(o_juego.biomas,
		s_get_xy_wrap(pos_x, true),
		s_get_xy_wrap(pos_y, false));
}
