function s_nearest_punto(la_ia, pos_x, pos_y) {
	
	var pnt = -1;
	var pnt_dist = 1000000;
	var dd;
	with la_ia {
		for (var i = 0; i < ds_list_size(punto_ia_x); i++) {
			dd = s_vec_distancia(pos_x, pos_y,
				ds_list_find_value(punto_ia_x, i),
				ds_list_find_value(punto_ia_y, i));
			if dd < pnt_dist {
				pnt_dist = dd;
				pnt = i;
			}
		}
	}
	return pnt;
}
