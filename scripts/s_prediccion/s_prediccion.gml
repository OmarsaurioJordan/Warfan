function s_prediccion(pos_x, pos_y, retardo, foc_lanza) {
	// devuelve x,y del destino alcanzado
	
	var his = 0;
	var t = -retardo;
	var vv_x = g_viento_x;
	var vv_y = g_viento_y;
	var vv_r = o_juego.reloj_viento;
	var xx = pos_x;
	var yy = pos_y;
	var dura_vuelo = 0;
	var plus = 1;
	var vv, vx, vy, vec;
	switch foc_lanza {
		case m_foc_paracaidas1:
			dura_vuelo = m_paracaidas_reloj_vuelo;
			plus = m_vel_paracaidas_min;
			break;
		case m_foc_paracaidas2:
			dura_vuelo = m_paracaidas_reloj_vuelo;
			plus = mean(m_vel_paracaidas_min,
				m_vel_paracaidas_max);
			break;
		case m_foc_paracaidas3:
			dura_vuelo = m_paracaidas_reloj_vuelo;
			plus = m_vel_paracaidas_max;
			break;
		case m_foc_bomb_normal:
		case m_foc_bomb_dispersion:
		case m_foc_bomb_linea:
			dura_vuelo = m_bombardero_reloj_vuelo;
			break;
		case m_foc_bomb_nuclear:
			t -= 3;
			dura_vuelo = m_bombardero_reloj_vuelo;
			break;
	}
	while t <= dura_vuelo {
		t += m_dlt;
		// calcular viento
		with o_juego {
			vv_r -= m_dlt;
			if vv_r <= 0 {
				vv_r += m_viento_reloj_max;
				his++;
			}
			if his < array_length(histo_viento_vel) {
				vv = histo_viento_vel[his] * m_viento_vel_max / 3;
				vx = lengthdir_x(vv, histo_viento_ang[his]);
				vy = lengthdir_y(vv, histo_viento_ang[his]);
				vec = s_vec_norm_esc(vv_x, vv_y, vx, vy,
					m_viento_vel_max * m_dlt);
				vv_x += vec[0];
				vv_y += vec[1];
			}
		}
		// calcular movimiento
		if t > 0 {
			xx += vv_x * plus * m_dlt;
			yy += vv_y * plus * m_dlt;
			if xx < 0 { xx += g_width; }
			else if xx > g_width { xx -= g_width; }
			if yy < 0 { yy += g_height; }
			else if yy > g_height { yy -= g_height; }
		}
	}
	return [xx, yy];
}
