function s_costo_acciones(la_ia) {
	
	var res = [0, 0, 0]; // madera, mineral, gente
	with la_ia {
		var tip, tot;
		for (var i = 0; i < ds_list_size(aprobado_accion); i++) {
			tip = ds_list_find_value(aprobado_accion, i);
			tot = ds_list_find_value(aprobado_cantidad, i);
			switch tip {
				case m_foc_bomb_normal:
				case m_foc_bomb_dispersion:
				case m_foc_bomb_linea:
				case m_foc_bomb_nuclear:
				case m_foc_antibombas:
				case m_foc_dron:
					res[1] += o_juego.costo[tip] * tot;
					break;
				case m_foc_paracaidas1:
				case m_foc_paracaidas2:
				case m_foc_paracaidas3:
					res[2] += o_juego.costo[tip] * tot;
					break;
				default:
					res[0] += o_juego.costo[tip] * tot;
					break;
			}
		}
	}
	return res;
}
