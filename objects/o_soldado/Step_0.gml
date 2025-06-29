// animacion
edad += dlt;
reloj_activo = max(0, reloj_activo - dlt);
if paso_disparo != -1 {
	reloj_disparo -= dlt;
	if reloj_disparo <= 0 {
		reloj_disparo += 0.15;
		paso_disparo++;
		if paso_disparo >= 5 {
			paso_disparo = -1;
		}
	}
}

// movimiento
s_ataque(id, m_vision_suelo);
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
