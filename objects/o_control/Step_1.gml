// calculo global del delta de tiempo
dlts = min(0.1, delta_time * 0.000001);
dlt = dlts; // Tarea agregar pausa

// verificar talla de pantalla para fullscreen de HTML5 en itchio
if random(1) < 0.01 {
	if display_get_width() != window_get_width() and os_type != os_windows {
		window_set_size(display_get_width(), display_get_height());
	}
}
