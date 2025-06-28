function s_num_players(is_al_inicio) {
	// num jugadores, true los iniciales, false los vivos
	
	var tot = 0;
	if is_al_inicio {
		for (var i = 0; i < m_players; i++) {
			if o_control.grupote[i] != m_ctrl_vacio {
				tot++;
			}
		}
	}
	else {
		for (var i = 0; i < m_players; i++) {
			if o_juego.recurso[i, m_rec_vivo] == 1 {
				tot++;
			}
		}
	}
	return tot;
}
