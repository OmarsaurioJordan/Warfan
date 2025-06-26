// talla general del mundo, por si cambia width_c
g_width = m_wcelda * g_width_c;
g_height = m_hcelda * g_height_c;

// estructura de datos para el viento
reloj_viento = m_viento_reloj_max;
for (var i = 0; i < m_viento_historial; i++) {
	histo_viento_ang[i] = irandom(35) * 10;
	histo_viento_vel[i] = irandom(3);
}

// particulas de viento cantidad fija
var dens = m_viento_particulas / (64 * 48);
repeat round(dens * (g_width_c * g_height_c)) {
	instance_create_depth(
		random(g_width),
		random(g_height),
		0, o_viento);
}

// crear un mundo aleatorio
tierras = 0;
biomas = s_new_mundo();
s_new_biomas();
s_new_recursos();

// lista para guardar marcas de quemonazos
lis_quemones_x = ds_list_create();
lis_quemones_y = ds_list_create();

// recursos por grupo
reloj_porcentajes = 0;
ver_porcentajes = true;
for (var i = 0; i < 4; i++) {
	for (var k = 0; k < m_rec_tot; k++) {
		recurso[i, k] = 0;
	}
}

// Quitar crear cosas para test
instance_create_depth(300, 300, -300, o_fuerte);
instance_create_depth(400, 300, -300, o_torre);
instance_create_depth(500, 300, -300, o_silo_nuclear);
instance_create_depth(600, 300, -300, o_fabrica);
instance_create_depth(300, 400, -400, o_edificio);
instance_create_depth(400, 400, -400, o_cuartel);
instance_create_depth(500, 400, -400, o_antena);
