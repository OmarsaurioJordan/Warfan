function s_count_circle(pos_x, pos_y, radio, objeto, excepcion) {
	// retorna numero de objetos agregados a la lista
	
	var dd;
	var tot = 0;
	with objeto {
		if id == excepcion {
			continue;
		}
		dd = s_vec_distancia(pos_x, pos_y, x, y);
		if dd < radio {
			tot++;
		}
	}
	return tot;
}
