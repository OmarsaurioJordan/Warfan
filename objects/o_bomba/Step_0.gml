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
			
			break;
		case m_bomb_linea:
		case m_bomb_dispersion:
			instance_create_depth(x, y, -y, o_explosion);
			break;
		case m_bomb_nuclear:
			
			break;
	}
	instance_destroy();
}
