function s_posible_aprobado(la_ia, ind, cantidad, instantaneo) {
	
	with la_ia {
		if instantaneo {
			ds_list_add(aprobado_retardo, 0);
		}
		else {
			ds_list_add(aprobado_retardo,
				ds_list_find_value(posible_retardo, ind));
		}
		ds_list_add(aprobado_accion,
			ds_list_find_value(posible_accion, ind));
		ds_list_add(aprobado_edificio,
			ds_list_find_value(posible_edificio, ind));
		ds_list_add(aprobado_cantidad, cantidad);
		ds_list_add(aprobado_x,
			ds_list_find_value(posible_x, ind));
		ds_list_add(aprobado_y,
			ds_list_find_value(posible_y, ind));
		// limpiar
		ds_list_delete(posible_retardo, ind);
		ds_list_delete(posible_accion, ind);
		ds_list_delete(posible_criterio, ind);
		ds_list_delete(posible_edificio, ind);
		ds_list_delete(posible_x, ind);
		ds_list_delete(posible_y, ind);
	}
}
