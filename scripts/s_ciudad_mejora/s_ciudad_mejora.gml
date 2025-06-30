function s_ciudad_mejora(la_ia, pos_x, pos_y, foc_edificio, obj_edificio, cant_ideal, obrero) {
	
	with la_ia {
		if ahorro[foc_edificio] < o_juego.costo[foc_edificio] - 10 {
			return false;
		}
		if s_count_circle_grupo(pos_x, pos_y, m_radio_ciudad,
				obj_edificio, grupo, true) < cant_ideal {
			var data = s_constructor(obrero, 5, foc_edificio, pos_x, pos_y);
			// data x,y, valor_calidad
			if data[0] != -1 {
				s_add_posible(id, 1000, foc_edificio, data[2],
					obrero, data[0], data[1]);
				return true;
			}
		}
	}
	return false;
}
