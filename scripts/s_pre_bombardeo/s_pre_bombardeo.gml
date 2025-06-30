function s_pre_bombardeo(la_ia) {
	
	with la_ia {
		var lanza = s_objeto_azar(grupo, o_torre);
		if lanza != noone {
			var retardo = random_range(0.5, m_viento_historial - 1) * m_viento_reloj_max;
			var tip = choose(m_foc_bomb_normal, m_foc_bomb_dispersion, m_foc_bomb_linea);
			var res = s_informe_damage(lanza.x, lanza.y, retardo, tip, grupo);
			// res 0:damage_enemigo, 1:damage_aliado, 2,3:x,y
			var rat = res[1] / max(1, res[0] + res[1]);
			if res[0] >= o_control.damage_min and res[1] < o_control.damage_max and rat < 0.25 {
					s_add_posible(id, retardo, tip,
				res[0], lanza, res[2], res[3]);
			}
		}
	}
}
