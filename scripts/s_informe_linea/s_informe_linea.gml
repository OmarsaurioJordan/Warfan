function s_informe_linea(pos_x, pos_y, retardo, el_grupo) {
	// retorna 0:damage_enemigo, 1:damage_aliado, 2,3:x,y
	
	var damage = [0, 0, 0, 0];
	var his = 0;
	var t = -retardo;
	var vv_x = g_viento_x;
	var vv_y = g_viento_y;
	var vv_r = o_juego.reloj_viento;
	var xx = pos_x;
	var yy = pos_y;
	var dura_vuelo = m_bombardero_reloj_vuelo;
	var t_v = dura_vuelo;
	var re_lin = dura_vuelo * (1 - m_bomba_linea_por_ini);
	var vv, vx, vy, vec, dmg;
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
			t_v -= m_dlt;
			xx += vv_x * m_dlt;
			yy += vv_y * m_dlt;
			if xx < 0 { xx += g_width; }
			else if xx > g_width { xx -= g_width; }
			if yy < 0 { yy += g_height; }
			else if yy > g_height { yy -= g_height; }
			// calcular bombazos
			if t_v < re_lin {
				// lanzar bomba
				dmg = s_afectados_explo(xx, yy, 0, m_radio_explosion, el_grupo);
				damage[0] += dmg[0];
				damage[1] += dmg[1];
				// ubicar cuando caera la proxima
				var paso = m_bombardero_reloj_vuelo *
					(1 - m_bomba_linea_por_ini) / (m_bomba_linea_total - 1);
				for (var i = 0; i <= paso * (m_bomba_linea_total - 1); i += paso) {
					if t_v < i {
						re_lin = i - paso;
						break;
					}
				}
			}
		}
	}
	// lanzar el bombazo final
	dmg = s_afectados_explo(xx, yy, 0, m_radio_explosion, el_grupo);
	damage[0] += dmg[0];
	damage[1] += dmg[1];
	damage[2] = xx;
	damage[3] = yy;
	return damage;
}
