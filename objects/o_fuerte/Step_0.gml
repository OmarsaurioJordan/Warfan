// animacion
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

// ataque
reloj_ataque -= dlt;
if reloj_ataque <= 0 {
	reloj_ataque = (m_reloj_ataque + random(0.5)) * 0.5;
	var otro = s_objetivo(id, o_movil, m_vision_torre);
	if otro != noone {
		reloj_disparo = 0.15;
		paso_disparo = 0;
		otro.vida--;
		if otro.vida <= 0 {
			s_morir(otro);
		}
	}
}
