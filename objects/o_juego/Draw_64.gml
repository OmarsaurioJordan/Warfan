// adecuar las cosas para dibujado de pantalla
var e = 0.8;
var mou_x = ((mouse_x - camera_get_view_x(view_camera[0])) /
	camera_get_view_width(view_camera[0])) * room_width;
var mou_y = ((mouse_y - camera_get_view_y(view_camera[0])) /
	camera_get_view_height(view_camera[0])) * room_height;
mouse_foco = m_foc_nada;

// indicadores de viento
var esc, xx, yy;
var ava = lerp(-1, m_viento_historial,
	reloj_viento / m_viento_reloj_max);
for (var i = 0; i < m_viento_historial; i++) {
	xx = (50 + 100 * i) * e;
	yy = 50 * e;
	draw_sprite_ext(d_gui, 1, xx, yy,
		e, e, 0, c_white, 0.666);
	if ava < i {
		draw_sprite_ext(d_gui, 22, xx, yy,
			e, e, 0, c_lime, 0.333);
	}
	if histo_viento_vel[i] == 0 {
		draw_sprite_ext(d_gui, 2, xx, yy,
			e, e, 0, c_white, 1);
	}
	else {
		esc = lerp(0.25, 1, histo_viento_vel[i] / 3);
		draw_sprite_ext(d_gui, 0, xx, yy,
			esc * e, esc * e, histo_viento_ang[i], c_white, 1);
	}
}

// temporizador de finalizacion


// recursos propios
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
for (var i = 0; i < 3; i++) {
	xx = 40 * e;
	yy = room_height * 0.3 + (i - 1.5) * 60 * e;
	draw_sprite_ext(d_gui, 6, xx, yy,
		e, e, 0, c_white, 0.666);
	draw_sprite_ext(d_gui, 8 + i, xx, yy,
		e, e, 0, c_white, 1);
	draw_text_transformed_color(xx + 85 * e, yy,
		string(floor(recurso[g_migrupo, i])), e, e,
		0, c_black, c_black, c_black, c_black, 1);
}

// botones contextuales
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if g_seleccion == noone {
	// botones de construccion
	for (var i = 0; i < 7; i++) {
		xx = (50 + i * 80) * e;
		yy = room_height - 80 * e;
		s_draw_foc_boton(mou_x, mou_y, xx, yy, e,
			string(costo[m_foc_silo_nuclear + i]),
			m_foc_silo_nuclear, i, 24, true,
			construir != noone and constru_foc == i);
	}
	xx += 110 * e;
	yy = room_height - 40 * e;
	draw_sprite_ext(d_gui, 23, xx, yy,
		e, e, 0, c_white, 0.666);
	draw_sprite_ext(d_gui, 10, xx, yy,
		e, e, 0, c_white, 1);
}
else {
	switch g_seleccion.object_index {
		case o_cuartel: // paracaidistas
			for (var i = 0; i < 3; i++) {
				xx = (40 + i * 80) * e;
				yy = room_height - 80 * e;
				s_draw_foc_boton(mou_x, mou_y, xx, yy, e,
					string(costo[m_foc_paracaidas1 + i]),
					m_foc_paracaidas1, i, 19, false, false);
			}
			xx += 110 * e;
			yy = room_height - 40 * e;
			draw_sprite_ext(d_gui, 23, xx, yy,
				e, e, 0, c_white, 0.666);
			draw_sprite_ext(d_gui, 8, xx, yy,
				e, e, 0, c_white, 1);
			break;
		case o_torre: // bombas
			for (var i = 0; i < 3; i++) {
				xx = (40 + i * 80) * e;
				yy = room_height - 80 * e;
				s_draw_foc_boton(mou_x, mou_y, xx, yy, e,
					string(costo[m_foc_bomb_normal + i]),
					m_foc_bomb_normal, i, 15, false, false);
			}
			xx += 110 * e;
			yy = room_height - 40 * e;
			draw_sprite_ext(d_gui, 23, xx, yy,
				e, e, 0, c_white, 0.666);
			draw_sprite_ext(d_gui, 9, xx, yy,
				e, e, 0, c_white, 1);
			break;
		case o_edificio: // informacion produccion y mejoras de nivel
			draw_set_halign(fa_right);
			xx = 40 * e;
			yy = room_height - 40 * e;
			draw_sprite_ext(d_gui, 6, xx, yy,
				e, e, 0, c_white, 0.666);
			draw_sprite_ext(d_gui, 8, xx, yy,
				e, e, 0, c_white, 1);
			draw_text_transformed_color(xx + 85 * e, yy,
				"+ " + string(round(g_seleccion.ext_gente * 10 *
					lerp(0.3, 0.9, g_seleccion.nivel / 2))),
				e, e, 0, c_black, c_black, c_black, c_black, 1);
			// mejoras de nivel
			if g_seleccion.nivel < 2 {
				draw_set_halign(fa_center);
				xx += 150 * e;
				yy = room_height - 80 * e;
				s_draw_foc_boton(mou_x, mou_y, xx, yy, e,
					string(costo[m_foc_mejora]),
					m_foc_mejora, 0, 13, false, false);
				xx += 110 * e;
				yy = room_height - 40 * e;
				draw_sprite_ext(d_gui, 23, xx, yy,
					e, e, 0, c_white, 0.666);
				draw_sprite_ext(d_gui, 10, xx, yy,
					e, e, 0, c_white, 1);
			}
			break;
		case o_fabrica: // informacion produccion
			draw_set_halign(fa_right);
			draw_set_valign(fa_middle);
			xx = 40 * e;
			yy = room_height - 40 * e;
			draw_sprite_ext(d_gui, 6, xx, yy,
				e, e, 0, c_white, 0.666);
			draw_sprite_ext(d_gui, 10, xx, yy,
				e, e, 0, c_white, 1);
			draw_text_transformed_color(xx + 85 * e, yy,
				"+ " + string(round(g_seleccion.ext_madera)),
				e, e, 0, c_black, c_black, c_black, c_black, 1);
			yy -= 60 * e;
			draw_sprite_ext(d_gui, 6, xx, yy,
				e, e, 0, c_white, 0.666);
			draw_sprite_ext(d_gui, 9, xx, yy,
				e, e, 0, c_white, 1);
			draw_text_transformed_color(xx + 85 * e, yy,
				"+ " + string(round(g_seleccion.ext_mineral)),
				e, e, 0, c_black, c_black, c_black, c_black, 1);
			break;
		case o_fuerte: // veleros
			xx = 40 * e;
			yy = room_height - 80 * e;
			s_draw_foc_boton(mou_x, mou_y, xx, yy, e,
				string(costo[m_foc_velero]),
				m_foc_velero, 0, 14, false, false);
			xx += 110 * e;
			yy = room_height - 40 * e;
			draw_sprite_ext(d_gui, 23, xx, yy,
				e, e, 0, c_white, 0.666);
			draw_sprite_ext(d_gui, 10, xx, yy,
				e, e, 0, c_white, 1);
			break;
		case o_antena: // dron y antibombas
			draw_set_halign(fa_right);
			xx = 40 * e;
			yy = room_height - 40 * e;
			s_draw_espera(xx, yy, e, string(ceil(g_seleccion.reloj_recarga)));
			// botones
			draw_set_halign(fa_center);
			xx += 150 * e;
			yy = room_height - 80 * e;
			s_draw_foc_boton(mou_x, mou_y, xx, yy, e,
				string(costo[m_foc_dron]),
				m_foc_dron, 0, 25, false, false);
			xx += 80 * e;
			s_draw_foc_boton(mou_x, mou_y, xx, yy, e,
				string(costo[m_foc_antibombas]),
				m_foc_antibombas, 0, 12, false, false);
			xx += 110 * e;
			yy = room_height - 40 * e;
			draw_sprite_ext(d_gui, 23, xx, yy,
				e, e, 0, c_white, 0.666);
			draw_sprite_ext(d_gui, 9, xx, yy,
				e, e, 0, c_white, 1);
			break;
		case o_silo_nuclear: // nuclear
			if g_seleccion.reloj_nuclear == 0 {
				xx = 50 * e;
				yy = room_height - 80 * e;
				s_draw_foc_boton(mou_x, mou_y, xx, yy, e,
					string(costo[m_foc_bomb_nuclear]),
					m_foc_bomb_nuclear, 0, 24, false, false);
				xx += 110 * e;
				yy = room_height - 40 * e;
				draw_sprite_ext(d_gui, 23, xx, yy,
					e, e, 0, c_white, 0.666);
				draw_sprite_ext(d_gui, 9, xx, yy,
					e, e, 0, c_white, 1);
			}
			else {
				draw_set_halign(fa_right);
				xx = 40 * e;
				yy = room_height - 40 * e;
				s_draw_espera(xx, yy, e, string(ceil(g_seleccion.reloj_nuclear)));
			}
			break;
	}
}

// estado general de grupos
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
var k = 0;
for (var i = 0; i < 4; i++) {
	if recurso[i, m_rec_vivo] == 0 {
		continue;
	}
	xx = room_width - 40 * e;
	yy = (35 + k * 60) * e;
	k++;
	draw_sprite_ext(d_gui, 7, xx, yy,
		-e, e, 0, c_white, 0.666);
	draw_sprite_ext(d_gui, 11, xx, yy,
		0.75 * e, 0.75 * e, 0, c_white, 1);
	draw_sprite_ext(d_gui_color, 11, xx, yy,
		0.75 * e, 0.75 * e, 0, g_color[i], 1);
	if ver_porcentajes {
		draw_text_transformed_color(xx - 45 * e, yy,
			string(recurso[i, m_rec_porcent]) + " %",
			e, e, 0, c_black, c_black, c_black, c_black, 1);
	}
	else {
		draw_text_transformed_color(xx - 45 * e, yy,
			string(recurso[i, m_rec_poblacion]) + " | " +
			string(recurso[i, m_rec_edificios]),
			e, e, 0, c_black, c_black, c_black, c_black, 1);
	}
}

// minimapa tactico


// sombrear edificaciones para ser seleccionadas
g_edifi_foco = noone;
if mouse_foco == m_foc_nada and construir == noone {
	var midepth = -1000000;
	with o_bloque {
		if grupo != g_migrupo {
			continue;
		}
		if depth < midepth {
			continue;
		}
		if point_in_rectangle(mouse_x, mouse_y,
				x - 48, y - 130, x + 48, y + 10) {
			g_edifi_foco = id;
			midepth = depth;
		}
	}
	if g_edifi_foco != noone {
		mouse_foco = m_foc_edi_foco;
	}
}

// mensaje de victoria o derrota
var txttt = "";
if victoria != -1 {
	if victoria == -2 {
		txttt = "EMPATE!!!";
	}
	else if victoria == g_migrupo {
		txttt = "VICTORIA!!!";
	}
	else {
		txttt = "DERROTA!!!";
	}
}
else if recurso[g_migrupo, m_rec_vivo] == 0 {
	txttt = "DERROTA!!!";
}
if txttt != "" {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed_color(room_width / 2, room_height * 0.5,
		txttt, 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 1);
	draw_text_transformed_color(room_width / 2, room_height * 0.75,
		"pulsa Escape para volver al menú",
		1, 1, 0, c_white, c_white, c_white, c_white, 1);
}

// mensajes tutorial
if tutorial < 4 {
	var txt = "";
	switch tutorial {
		case 0: // camara
			txt = "Mueve la cámara con clic derecho\nHaz zoom con la rueda del mouse";
			break;
		case 1: // evocacion
			if g_seleccion == noone {
				txt = "Selecciona la torre con\nel techo en forma de paracaídas";
			}
			else if g_seleccion.object_index != o_cuartel {
				txt = "Ese no es el edificio\nPuedes pulsar Espacio para deseleccionar";
			}
			else {
				txt = "Pulsa en alguno de los paracaídistas\nTe costará población";
			}
			break;
		case 2: // construccion
			if g_seleccion == noone {
				if construir == noone {
					txt = "Selecciona un edificio\nde la lista inferior, costará madera";
				}
				else {
					txt = "Ponlo con clic Izquierdo cerca a\nun paracaídista ¿Hay madera suficiente?";
				}
			}
			else {
				txt = "Deselecciona todo pulsando Espacio\nO dando clic en el suelo";
			}
			break;
		case 3: // informacion
			txt = "Selecciona cosas para ver su información (Enter ocultar)\n";
			if g_seleccion == noone {
				switch construir {
					case o_antena:
						txt += "Antena: con dron espía y onda PEM anti bombarderos";
						break;
					case o_cuartel:
						txt += "Cuartel: crea soldados paracaídistas usando población";
						break;
					case o_edificio:
						txt += "Edificio: genera población e impone su límite máximo";
						break;
					case o_fabrica:
						txt += "Extractor: obtiene madera y minerales que hay en su cercanía";
						break;
					case o_fuerte:
						txt += "Fuerte: crea barcos en la costa y dispara a los enemigos";
						break;
					case o_silo_nuclear:
						txt += "Reactor: tarda un tiempo en armar una costosa bomba nuclear";
						break;
					case o_torre:
						txt += "Torre: crea bombardeos a cambio de mineral";
						break;
					default:
						txt += "Destruye las edificaciónes enemigas para vencer!!!";
						break;
				}
			}
			else {
				switch g_seleccion.object_index {
					case o_antena:
						txt += "Antena: la onda PEM solo derriba a un bombardero a la vez";
						break;
					case o_cuartel:
						txt += "Cuartel: entre más grande el paracaídas más lejos llegará";
						break;
					case o_edificio:
						txt += "Edificio: mejor entre más juntos estén, lejos de la nieve y la arena";
						break;
					case o_fabrica:
						txt += "Extractor: si hay varios cerca compiten por los recursos";
						break;
					case o_fuerte:
						txt += "Fuerte: muy resistente, sus barcos se mueven libres con el viento";
						break;
					case o_silo_nuclear:
						txt += "Reactor: una vez la bomba nuclear vuela nada la puede detener";
						break;
					case o_torre:
						txt += "Torre: crea bombarderos de área: puntual, en aro, lineal";
						break;
				}
			}
			break;
	}
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed_color(room_width / 2, room_height * 0.2,
		txt, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
}

// mouse
draw_sprite(d_mouse, 0, mou_x, mou_y);
