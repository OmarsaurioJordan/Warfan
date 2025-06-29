function s_viviendas() {
	
	var tot;
	for (var i = 0; i < m_players; i++) {
		tot = m_viviendas_ini;
		with o_edificio {
			if grupo == i {
				switch nivel {
					case 0: tot += m_viviendas_edi1; break;
					case 1: tot += m_viviendas_edi2; break;
					case 2: tot += m_viviendas_edi3; break;
				}
			}
		}
		o_juego.recurso[i, m_rec_viviendas] = tot;
	}
}
