// movimientos de camara
s_cam_zoom("Q", "E", 0);
s_cam_move(mb_right);

// movimiento del viento
reloj_viento -= dlt;
if reloj_viento <= 0 {
	reloj_viento += m_viento_reloj_max;
	for (var i = 1; i < m_viento_historial; i++) {
		histo_viento_ang[i - 1] = histo_viento_ang[i];
		histo_viento_vel[i - 1] = histo_viento_vel[i];
	}
	histo_viento_ang[m_viento_historial - 1] = irandom(35) * 10;
	histo_viento_vel[m_viento_historial - 1] = irandom(3);
}
var vv = histo_viento_vel[0] * m_viento_vel_max / 3;
var vx = lengthdir_x(vv, histo_viento_ang[0]);
var vy = lengthdir_y(vv, histo_viento_ang[0]);
var vec = s_vec_norm_esc(g_viento_x, g_viento_y, vx, vy,
	m_viento_vel_max * dlt);
g_viento_x += vec[0];
g_viento_y += vec[1];
g_viento_vel = point_distance(0, 0, g_viento_x, g_viento_y);

// movimiento de las particulas
var desf = m_viento_vel_max * 0.1;
with o_viento {
	if random(1) < 0.05 {
		desf_x = random_range(-desf, desf);
		desf_y = random_range(-desf, desf);
	}
	x += (g_viento_x + desf_x) * dlts;
	y += (g_viento_y + desf_y) * dlts;
	s_limites(id);
}

// cada tanto tratar de limpiar quemonazos acumulados
if random(1) < 0.005 {
	var lx, ly;
	var ok = false;
	for (var i = 0; i < ds_list_size(lis_quemones_x); i++) {
		lx = ds_list_find_value(lis_quemones_x, i);
		ly = ds_list_find_value(lis_quemones_y, i);
		for (var k = ds_list_size(lis_quemones_x) - 1; k > i; k--) {
			if point_distance(lx, ly,
					ds_list_find_value(lis_quemones_x, k),
					ds_list_find_value(lis_quemones_y, k)) < 32 {
				ds_list_delete(lis_quemones_x, k);
				ds_list_delete(lis_quemones_y, k);
				ok = true;
			}
		}
		if ok {
			break;
		}
	}
}

// cada tanto calcular porcentajes
reloj_porcentajes -= dlts;
if reloj_porcentajes <= 0 {
	reloj_porcentajes = m_reloj_porcentajes;
	ver_porcentajes = !ver_porcentajes;
	if ver_porcentajes {
		var tot = 0;
		for (var i = 0; i < 4; i++) {
			tot += recurso[i, m_rec_explosiones];
		}
		for (var i = 0; i < 4; i++) {
			recurso[i, m_rec_porcent] = round(
				(recurso[i, m_rec_explosiones] /
				max(1, tot)) * 100);
		}
	}
	else {
		for (var i = 0; i < 4; i++) {
			recurso[i, m_rec_edificios] = 0;
			recurso[i, m_rec_poblacion] = 0;
			with o_bloque {
				if grupo == i {
					o_juego.recurso[i, m_rec_edificios]++;
				}
			}
			with o_soldado {
				if grupo == i {
					o_juego.recurso[i, m_rec_poblacion]++;
				}
			}
			with o_paracaidas {
				if grupo == i {
					o_juego.recurso[i, m_rec_poblacion]++;
				}
			}
			with o_velero {
				if grupo == i {
					o_juego.recurso[i, m_rec_poblacion]++;
				}
			}
		}
	}
}

// Quitar trampas
if mouse_check_button_pressed(mb_left) {
	instance_create_depth(mouse_x, mouse_y, -mouse_y, 
		choose(o_dron, o_paracaidas, o_bombardero));
}
if mouse_check_button_pressed(mb_middle) {
	instance_create_depth(mouse_x, mouse_y, -mouse_y, o_velero);
}
