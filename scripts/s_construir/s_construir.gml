function s_construir(pos_x, pos_y, el_grupo, foc_edificio, obrero) {

	o_juego.recurso[el_grupo, m_rec_madera] -= o_juego.costo[foc_edificio];
	var aux = noone;
	switch foc_edificio {
		case m_foc_antena:
			aux = instance_create_depth(pos_x, pos_y, -pos_y, o_antena);
			break;
		case m_foc_torre:
			aux = instance_create_depth(pos_x, pos_y, -pos_y, o_torre);
			break;
		case m_foc_cuartel:
			aux = instance_create_depth(pos_x, pos_y, -pos_y, o_cuartel);
			break;
		case m_foc_fuerte:
			aux = instance_create_depth(pos_x, pos_y, -pos_y, o_fuerte);
			break;
		case m_foc_silo_nuclear:
			aux = instance_create_depth(pos_x, pos_y, -pos_y, o_silo_nuclear);
			break;
		case m_foc_edificio:
			aux = instance_create_depth(pos_x, pos_y, -pos_y, o_edificio);
			break;
		case m_foc_fabrica:
			aux = instance_create_depth(pos_x, pos_y, -pos_y, o_fabrica);
			break;
	}
	aux.grupo = el_grupo;
	instance_destroy(obrero);
	s_revisar_puntos_zona(aux.x, aux.y);
}
