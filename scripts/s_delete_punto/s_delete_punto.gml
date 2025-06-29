function s_delete_punto(la_ia, pos) {
	
	with la_ia {
		ds_list_delete(punto_ia_x, pos);
		ds_list_delete(punto_ia_y, pos);
		ds_list_delete(punto_ia_madera, pos);
		ds_list_delete(punto_ia_mineral, pos);
		ds_list_delete(punto_ia_gente, pos);
		ds_list_delete(punto_ia_tipo, pos);
	}
}
