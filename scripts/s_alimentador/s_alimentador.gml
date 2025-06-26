function s_alimentador(objeto) {
	
	with o_fabrica {
		if objeto == o_mineral {
			ext_mineral = 0;
		}
		else {
			ext_madera = 0;
		}
	}
	var lis = ds_priority_create();
	var xx, yy, dd, tot, aux;
	with objeto {
		xx = x;
		yy = y;
		tot = 0;
		with o_fabrica {
			dd = s_vec_distancia(xx, yy, x, y);
			if dd < m_vision_extractor {
				dd = 1 - dd / m_vision_extractor;
				ds_priority_add(lis, id, dd);
				tot += dd;
			}
		}
		while !ds_priority_empty(lis) {
			aux = ds_priority_find_min(lis);
			if objeto == o_mineral {
				aux.ext_mineral +=
					ds_priority_find_priority(lis, aux) / tot;
			}
			else {
				aux.ext_madera +=
					ds_priority_find_priority(lis, aux) / tot;
			}
			ds_priority_delete_min(lis);
		}
	}
	ds_priority_destroy(lis);
}
