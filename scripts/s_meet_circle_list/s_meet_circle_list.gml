function s_meet_circle_list(pos_x, pos_y, radio,
		objeto, excepcion, lista_prioridad) {
	// retorna numero de objetos agregados a la lista
	
	var dd;
	var tot = 0;
	with objeto {
		if id == excepcion {
			continue;
		}
		dd = s_vec_distancia(pos_x, pos_y, x, y);
		if dd < radio {
			ds_priority_add(lista_prioridad, id, dd);
			tot++;
		}
	}
	return tot;
}
