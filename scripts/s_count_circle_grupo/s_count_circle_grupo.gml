function s_count_circle_grupo(pos_x, pos_y, radio,
		objeto, el_grupo, is_elgrupo) {
	// retorna numero de objetos
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
				tot++;
			}
		}
	}
	return tot;
}
