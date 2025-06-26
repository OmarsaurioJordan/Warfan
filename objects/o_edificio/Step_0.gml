// animacion
for (var i = 0; i < 3; i++) {
	if anima_up[i] {
		reloj_anima[i] = min(1, reloj_anima[i] + dlts * random(1));
		if reloj_anima[i] == 1 {
			anima_up[i] = false;
		}
	}
	else {
		reloj_anima[i] = max(0, reloj_anima[i] - dlts * random(1));
		if reloj_anima[i] == 0 {
			anima_up[i] = true;
		}
	}
}

// produccion
reloj_produccion -= dlt;
if reloj_produccion <= 0 {
	reloj_produccion += m_reloj_produccion + random(0.2);
	var lvl = lerp(0.3, 0.9, nivel / 2) * 0.5;
	o_juego.recurso[grupo, m_rec_gente] = min(9999,
		o_juego.recurso[grupo, m_rec_gente] + ext_gente * lvl);
}
