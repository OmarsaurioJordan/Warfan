function s_informe_damage(pos_x, pos_y, retardo, foc_lanza, el_grupo) {
	// pos desde donde se lanza el ataque
	// retardo es cuando se lanzara
	// foc_lanza es el tipo de bomba que se lanzara
	// retorna 0:damage_enemigo, 1:damage_aliado, 2,3:x,y
	
	if foc_lanza == m_foc_bomb_linea {
		return s_informe_linea(pos_x, pos_y, retardo, el_grupo);
	}
	var damage = [0, 0, 0, 0];
	var res = s_prediccion(pos_x, pos_y, retardo, foc_lanza);
	damage[2] = res[0];
	damage[3] = res[1];
	var dmg;
	if foc_lanza == m_foc_bomb_dispersion {
		var t = m_altu_vuelo / m_gravedad;
		var d1 = m_bomba_dispersion_vel_min * t - m_radio_explosion;
		var d2 = m_bomba_dispersion_vel_max * t + m_radio_explosion;
		dmg = s_afectados_explo(res[0], res[1], d1, d2, el_grupo);
		damage[0] += dmg[0];
		damage[1] += dmg[1];
		return damage;
	}
	var d = m_bomba_radio_normal + m_radio_explosion;
	if foc_lanza == m_foc_bomb_nuclear {
		d = m_bomba_radio_nuclear + m_radio_explosion;
	}
	dmg = s_afectados_explo(res[0], res[1], 0, d, el_grupo);
	damage[0] += dmg[0];
	damage[1] += dmg[1];
	return damage;
}
