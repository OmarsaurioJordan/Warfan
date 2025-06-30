// ver si debe moverse en horizontal
if dir_impulso != -1 {
	x += lengthdir_x(vel_impulso * dlt, dir_impulso);
	y += lengthdir_y(vel_impulso * dlt, dir_impulso);
	s_limites(id);
}

// caer en vertical
altura = max(0, altura - m_gravedad * dlt);
if altura == 0 {
	switch bomba {
		case m_bomb_normal:
			s_bombazo(x, y, m_bomba_normal_total,
				m_bomba_radio_normal, grupo, true);
			break;
		case m_bomb_linea:
		case m_bomb_dispersion:
			var aux = instance_create_depth(x, y, -y, o_explosion);
			aux.grupo = grupo;
			break;
		case m_bomb_nuclear:
			s_audio(a_nuclear, x, y);
			var tot = ceil(power(m_bomba_radio_nuclear, 2) /
				power(m_radio_bombita_nuclear, 2));
			s_bombazo(x, y, tot, m_bomba_radio_nuclear,
				grupo, false);
			break;
	}
	instance_destroy();
}
