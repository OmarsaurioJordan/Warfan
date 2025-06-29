function s_ciudad_mejora(la_ia, pos_x, pos_y, foc_edificio, obj_edificio, cant_ideal, obrero) {
	// return 0:yaexisten, 1:fallointentando, 2:okey
	
	with la_ia {
		if s_count_circle_grupo(pos_x, pos_y, m_radio_ciudad,
				obj_edificio, noone, grupo) < cant_ideal {
			var data = s_constructor(obrero, 5, foc_edificio);
			if data[0] != -1 {
				s_add_posible(id, 1000, foc_edificio, data[2],
					obrero, data[0], data[1]);
				return 2;
			}
			else {
				return 1;
			}
		}
	}
	return 0;
}
