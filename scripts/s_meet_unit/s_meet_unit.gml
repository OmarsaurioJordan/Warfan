function s_meet_unit(pos_x, pos_y, radio,
		objeto, excepcion, mi_grupo) {
	// retorna el objeto mas cercano encontrado o noone
	
	var aux = noone;
	var aux_dd = radio;
	var dd;
	with objeto {
		if id == excepcion {
			continue;
		}
		if grupo != mi_grupo {
			continue;
		}
		dd = s_vec_distancia(pos_x, pos_y, x, y);
		if dd < aux_dd {
			aux = id;
			aux_dd = dd;
		}
	}
	return aux;
}
