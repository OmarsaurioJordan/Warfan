function s_revisar_puntos_zona(pos_x, pos_y) {
	
	with o_ia {
		for (var i = ds_list_size(punto_ia_x) - 1; i >= 0; i--) {
			s_acomodar_punto(id, i, pos_x, pos_y);
		}
	}
}
