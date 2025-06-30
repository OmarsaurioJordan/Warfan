// dibujar edificacion que se desea construir
if o_juego.construir != noone {
	if !surface_exists(surf_edi) {
		surf_edi = surface_create(116, 215);
		surface_set_target(surf_edi);
		draw_clear_alpha(c_white, 0);
		switch o_juego.construir {
			case o_antena:
				draw_sprite(d_edificios, 16, 57, 181);
				draw_sprite_ext(d_edificios_color, 16, 57, 181,
					1, 1, 0, g_color[g_migrupo], 1);
				break;
			case o_cuartel:
				draw_sprite(d_edificios, 0, 57, 181);
				draw_sprite_ext(d_edificios_color, 0, 57, 181,
					1, 1, 0, g_color[g_migrupo], 1);
				break;
			case o_edificio:
				draw_sprite(d_edificios, 28, 57, 181);
				draw_sprite(d_edificios, 27, 57, 181);
				draw_sprite_ext(d_edificios_color, 27, 57, 181,
					1, 1, 0, g_color[g_migrupo], 1);
				break;
			case o_fabrica:
				draw_sprite(d_edificios, 9, 57, 181);
				draw_sprite_ext(d_edificios_color, 9, 57, 181,
					1, 1, 0, g_color[g_migrupo], 1);
				break;
			case o_fuerte:
				draw_sprite(d_edificios, 4, 57, 181);
				draw_sprite(d_edificios, 5, 57, 181);
				draw_sprite_ext(d_edificios_color, 5, 57, 181,
					1, 1, 0, g_color[g_migrupo], 1);
				draw_sprite(d_edificios, 2, 57, 181);
				draw_sprite_ext(d_edificios_color, 2, 57, 181,
					1, 1, 0, g_color[g_migrupo], 1);
				break;
			case o_silo_nuclear:
				draw_sprite(d_edificios, 13, 57, 181);
				draw_sprite_ext(d_edificios_color, 13, 57, 181,
					1, 1, 0, g_color[g_migrupo], 1);
				draw_sprite(d_edificios, 14, 57, 181);
				draw_sprite_ext(d_edificios_color, 14, 57, 181,
					1, 1, 0, g_color[g_migrupo], 1);
				draw_sprite(d_edificios, 12, 57, 181);
				draw_sprite_ext(d_edificios_color, 12, 57, 181,
					1, 1, 0, g_color[g_migrupo], 1);
				break;
			case o_torre:
				draw_sprite(d_edificios, 7, 57, 181);
				draw_sprite_ext(d_edificios_color, 7, 57, 181,
					1, 1, 0, g_color[g_migrupo], 1);
				break;
		}
		surface_reset_target();
	}
	if okey_construir {
		draw_surface_ext(surf_edi, x - 57, y - 181,
			1, 1, 0, c_white, 0.75);
	}
	else {
		draw_surface_ext(surf_edi, x - 57, y - 181,
			1, 1, 0, c_dkgray, 0.75);
	}
}

// dibujar cosas de ensayo
/*
draw_circle_color(x, y, d1 - m_radio_explosion, c_black, c_black, true);
draw_circle_color(x, y, d2 + m_radio_explosion, c_black, c_black, true);
draw_circle_color(x, y, , c_red, c_red, true);
*/
