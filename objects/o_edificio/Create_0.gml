s_invisi_recursos();
grupo = m_gru_azul;
nivel = 0;
vida_max = s_get_vida(object_index) * 0.5;
vida = vida_max;
fuego = irandom(m_fuegos_ani - 1);
reloj_produccion = 0;
for (var i = 0; i < 3; i++) {
	anima_up[i] = choose(true, false);
	reloj_anima[i] = random(1);
}

// verificar biomas para respawn poblacion
ext_gente = s_populization(x, y);
