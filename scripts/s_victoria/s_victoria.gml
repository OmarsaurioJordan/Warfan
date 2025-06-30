function s_victoria() {
	
	with o_juego {
		if victoria < 0 {
			// verificar que tengan edificios
			var tot = 0;
			for (var i = 0; i < m_players; i++) {
				if recurso[i, m_rec_vivo] == 1 {
					if recurso[i, m_rec_edificios] == 0 {
						recurso[i, m_rec_vivo] = 0;
						with o_velero {
							if grupo == i {
								s_morir(id);
							}
						}
						with o_paracaidas {
							viejito = true;
						}
						with o_soldado {
							s_envejecer(id);
						}
						var aux;
						with o_bombardero {
							aux = instance_create_depth(x, y, -y, o_onda);
							aux.grupo = grupo;
							aux.reloj_paso = 0;
							aux.reloj_fin = random_range(0.1, 0.15);
							s_audio(a_explosion, x, y); // Tarea sonido implosion
							instance_destroy();
						}
					}
					else {
						tot++;
					}
				}
			}
			// hallar al ganador
			if tot == 1 {
				for (var i = 0; i < m_players; i++) {
					if recurso[i, m_rec_vivo] == 1 {
						victoria = i;
						break;
					}
				}
			}
			else if tot == 0 {
				victoria = -2;
			}
		}
	}
}
