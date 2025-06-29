function s_delete_pos_punto(la_ia, pos_x, pos_y) {
	
	with la_ia {
		for (var i = ds_list_size(punto_ia_x) - 1; i >= 0; i--) {
			if pos_x == ds_list_find_value(punto_ia_x, i) and
					pos_y == ds_list_find_value(punto_ia_y, i) {
				s_delete_punto(id, i);
			}
		}
	}
}
