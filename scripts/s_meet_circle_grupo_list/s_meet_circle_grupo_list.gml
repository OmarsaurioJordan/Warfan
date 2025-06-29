function s_meet_circle_grupo_list(pos_x, pos_y, radio,
		objeto, el_grupo, lista_prioridad, is_elgrupo) {
	// retorna numero de objetos agregados a la lista
	// is_elgrupo true tienen que ser de ese grupo, false diferentes a
	
	var dd;
	var tot = 0;
	if is_elgrupo {
		with objeto {
			if grupo != el_grupo {
				continue;
			}
			dd = s_vec_distancia(pos_x, pos_y, x, y);
			if dd < radio {
				ds_priority_add(lista_prioridad, id, dd);
				tot++;
			}
		}
	}
	else {
		with objeto {
			if grupo == el_grupo {
				continue;
			}
			dd = s_vec_distancia(pos_x, pos_y, x, y);
			if dd < radio {
				ds_priority_add(lista_prioridad, id, dd);
				tot++;
			}
		}
	}
	return tot;
}
