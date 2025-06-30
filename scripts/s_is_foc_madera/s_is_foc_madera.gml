function s_is_foc_madera(foc_accion) {
	// suponiendo que foc solo sea madera o mineral
	
	switch foc_accion {
		case m_foc_antibombas:
		case m_foc_bomb_nuclear:
		case m_foc_bomb_normal:
		case m_foc_bomb_dispersion:
		case m_foc_bomb_linea:
			return false;
	}
	return true;
}
