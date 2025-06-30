// calculo global del delta de tiempo
dlts = min(0.1, delta_time * 0.000001);
dlt = dlts; // Tarea agregar pausa

// verificar talla de pantalla para fullscreen de HTML5 en itchio
if random(1) < 0.01 {
	if display_get_width() != window_get_width() and os_type != os_windows {
		window_set_size(display_get_width(), display_get_height());
	}
}

// animacion fuegos
for (var i = 0; i < m_fuegos_ani; i++) {
	reloj_fuego[i] += dlts * 7;
	if reloj_fuego[i] >= 1 {
		reloj_fuego[i] -= 1;
		g_paso_fuego[i] = irandom(7);
	}
}

// comandos de teclado generales
if keyboard_check_pressed(vk_anykey) {
	switch keyboard_key {
		
		case vk_escape:
			// abandonar partida
			break;
		
		case vk_f4:
			window_set_fullscreen(!window_get_fullscreen());
			break;
		
		case vk_add:
			volumen = min(1, volumen + 0.1);
			audio_master_gain(volumen);
			break;
		case vk_subtract:
			volumen = max(0, volumen - 0.1);
			audio_master_gain(volumen);
			break;
	}
}
