function s_afectados_explo(pos_x, pos_y, dis_min, dis_max, el_grupo) {
	// retorna 0:damage_enemigo, 1:damage_aliado
	
	var damage = [0, 0];
	var dd;
	with o_bloque {
		dd = s_vec_distancia(x, y, pos_x, pos_y);
		if dd < dis_max + 16 and dd > dis_min - 16 {
			if grupo == el_grupo {
				damage[1] += ds_map_find_value(o_control.damage_objeto,
					object_index);
			}
			else {
				damage[0] += ds_map_find_value(o_control.damage_objeto,
					object_index);
			}
		}
	}
	with o_soldado {
		dd = s_vec_distancia(x, y, pos_x, pos_y);
		if dd < dis_max + 32 and dd > dis_min - 32 {
			if grupo == el_grupo {
				damage[1] += ds_map_find_value(o_control.damage_objeto,
					object_index);
			}
			else {
				damage[0] += ds_map_find_value(o_control.damage_objeto,
					object_index);
			}
		}
	}
	return damage;
}
