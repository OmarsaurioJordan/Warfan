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
		
	}
}
