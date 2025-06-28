function s_populization(pos_x, pos_y) {
	
	var ext_gente = 0;
	var xx = s_get_xy_wrap(pos_x, true);
	var yy = s_get_xy_wrap(pos_y, false);
	var veci = s_mat_vecinos(xx, yy, true);
	var aux;
	for (var v = 0; v < 9; v++) {
		aux = ds_grid_get(o_juego.biomas, veci[v, 0], veci[v, 1]);
		if aux == m_bio_pasto or aux == m_bio_tierra {
			ext_gente++;
		}
		else {
			ext_gente += 0.1;
		}
	}
	return ext_gente / 9;
}
