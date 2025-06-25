// estructura de datos para el viento
reloj_viento = m_viento_reloj_max;
for (var i = 0; i < m_viento_historial; i++) {
	histo_viento_ang[i] = irandom(35) * 10;
	histo_viento_vel[i] = irandom(3);
}

// particulas de viento cantidad fija
repeat m_viento_particulas {
	instance_create_depth(
		random(g_width),
		random(g_height),
		0, o_viento);
}

// crear un mundo aleatorio
biomas = s_new_biomas();
tierras = 0;
for (var w = 0; w < g_width_c; w++) {
	for (var h = 0; h < g_height_c; h++) {
		if ds_grid_get(biomas, w, h) != m_bio_agua {
			tierras++;
		}
	}
}
s_new_recursos();

// Quitar crear cosas para test
instance_create_depth(300, 300, -300, o_fuerte);
instance_create_depth(400, 300, -300, o_torre);
instance_create_depth(500, 300, -300, o_silo_nuclear);
instance_create_depth(600, 300, -300, o_fabrica);
instance_create_depth(300, 400, -400, o_edificio);
instance_create_depth(400, 400, -400, o_cuartel);
instance_create_depth(500, 400, -400, o_antena);
