if reloj_vuelo == 0 {
	altura = max(0, altura - m_gravedad * dlt);
	if altura == 0 {
		if s_is_agua(x, y) {
			var aux = instance_create_depth(x, y, -y, o_muerto);
			aux.grupo = grupo;
			aux.subimg = 14;
			aux.reloj_fin = 3;
		}
		else {
			var aux = instance_create_depth(x, y, -y, o_soldado);
			aux.grupo = grupo;
		}
		instance_destroy();
	}
}
else {
	reloj_vuelo = max(0, reloj_vuelo - dlt);
	if !s_colision_aire(id, 0.2) {
		var plus = lerp(0.3, 0.9, nivel / 2);
		x += g_viento_x * plus * dlt;
		y += g_viento_y * plus * dlt;
	}
}
s_limites(id);
