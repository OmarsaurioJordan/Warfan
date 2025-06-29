function s_set_punto(la_ia, pos_x, pos_y, madera, mineral, gente, tipo) {
	
	with la_ia {
		ds_list_add(punto_ia_x, pos_x);
		ds_list_add(punto_ia_y, pos_y);
		ds_list_add(punto_ia_madera, madera);
		ds_list_add(punto_ia_mineral, mineral);
		ds_list_add(punto_ia_gente, gente);
		ds_list_add(punto_ia_tipo, tipo);
	}
}
