// particulas de viento cantidad fija
repeat m_vientos {
	instance_create_depth(
		random(g_width * g_wbaldoza),
		random(g_height * g_hbaldoza),
		0, o_viento);
}

// crear un mundo aleatorio
biomas = s_new_biomas();

// Quitar crear cosas para test
instance_create_depth(300, 300, -300, o_fuerte);
instance_create_depth(400, 300, -300, o_torre);
instance_create_depth(500, 300, -300, o_silo_nuclear);
instance_create_depth(600, 300, -300, o_fabrica);
instance_create_depth(300, 400, -400, o_edificio);
instance_create_depth(400, 400, -400, o_cuartel);
instance_create_depth(500, 400, -400, o_antena);
