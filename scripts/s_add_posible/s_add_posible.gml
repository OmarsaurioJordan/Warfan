function s_add_posible(la_ia, retardo, foc_accion, criterio, origen, pos_x, pos_y) {
	
	with la_ia {
		ds_list_add(posible_retardo, retardo);
		ds_list_add(posible_accion, foc_accion);
		ds_list_add(posible_criterio, criterio);
		ds_list_add(posible_edificio, origen);
		ds_list_add(posible_x, pos_x);
		ds_list_add(posible_y, pos_y);
	}
}
