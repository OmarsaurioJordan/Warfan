if s_colision_suelo(id, 0.1) {
	s_limites(id);
	if s_is_agua(x, y) {
		var aux = instance_create_depth(x, y, -y, o_muerto);
		aux.grupo = grupo;
		aux.subimg = 14;
		aux.reloj_fin = 3;
		instance_destroy();
	}
}
