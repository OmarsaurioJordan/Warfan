function s_ataque(quien, alcance) {
	
	with quien {
		reloj_ataque -= dlt;
		if reloj_ataque <= 0 {
			reloj_ataque = m_reloj_ataque + random(0.5);
			var otro = s_objetivo(id, o_movil, alcance);
			if otro == noone {
				otro = s_objetivo(id, o_fuerte, alcance);
				if otro == noone {
					otro = s_objetivo(id, o_silo_nuclear, alcance);
					if otro == noone {
						otro = s_objetivo(id, o_bloque, alcance);
					}
				}
			}
			if otro != noone {
				reloj_disparo = 0.15;
				paso_disparo = 0;
				reloj_activo = 4;
				otro.vida--;
				if otro.vida <= 0 {
					if object_get_parent(otro.object_index) == o_movil {
						s_morir(otro);
					}
					else {
						s_demoler(otro);
					}
				}
				else if otro.object_index == o_soldado {
					otro.reloj_activo = 4;
				}
			}
		}
	}
}
