s_invisi_recursos();
grupo = m_gru_azul;
nivel = choose(0, 1, 2);
reloj_produccion = 0;
for (var i = 0; i < 3; i++) {
	anima_up[i] = choose(true, false);
	reloj_anima[i] = random(1);
}

// verificar biomas para respawn poblacion
ext_gente = 0;
var xx = clamp(floor(x / m_wcelda), 0, g_width_c - 1);
var yy = clamp(floor(y / m_hcelda), 0, g_height_c - 1);
var veci = s_mat_vecinos(xx, yy, true);
var aux;
for (var v = 0; v < 9; v++) {
	aux = ds_grid_get(o_juego.biomas, veci[v, 0], veci[v, 1]);
	if aux == m_bio_pasto or aux == m_bio_tierra {
		ext_gente++;
	}
	else {
		ext_gente += 0.1;
	}
}
ext_gente /= 9;
