reloj_humo -= dlts;
if reloj_humo <= 0 {
	reloj_humo = random_range(0.4, 0.8);
	reloj_paso_humo++;
	if reloj_paso_humo >= 16 {
		reloj_paso_humo = 0;
	}
}

reloj_fin -= dlt;
if reloj_fin <= 0 {
	reloj_fin = random_range(0.1, 0.15);
	reloj_paso++;
	if sonar {
		sonar = false;
		s_audio(a_explosion, x, y);
	}
	if reloj_paso >= m_paso_fin_explosion * 2 {
		if !is_agua {
			ds_list_add(o_juego.lis_quemones_x, x);
			ds_list_add(o_juego.lis_quemones_y, y);
		}
		instance_destroy();
	}
	else if reloj_paso == 3 {
		o_juego.recurso[grupo, m_rec_explosiones]++;
		// hacer damage a las cosas cercanas
		var xx = x;
		var yy = y;
		with o_bloque {
			if s_vec_distancia(x, y, xx, yy) < m_radio_explosion + 32 {
				s_demoler(id);
			}
		}
		with o_movil {
			if s_vec_distancia(x, y, xx, yy) < m_radio_explosion +
					random_range(24, 64) {
				s_morir(id);
			}
		}
		with o_planta {
			if random(1) < 0.5 {
				continue;
			}
			if s_vec_distancia(x, y, xx, yy) < m_radio_explosion {
				o_juego.reloj_recalcula_plantas = 5;
				instance_destroy();
			}
		}
	}
}
