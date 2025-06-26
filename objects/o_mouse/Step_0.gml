if o_juego.construir != noone {
	x = mouse_x;
	y = mouse_y;
	depth = -y;
	// ver si se puede construir
	var obrero = s_ok_construir(x, y, g_migrupo, o_juego.constru_foc);
	okey_construir = obrero != noone;
	// construir el edificio
	if mouse_check_button_pressed(mb_left) and okey_construir {
		s_construir(x, y, g_migrupo, o_juego.constru_foc, obrero);
	}
}
