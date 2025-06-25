function s_new_mundo() {
	
	// elegir parametros al azar
	var semillas = irandom_range(3, 6);
	var radio = ceil(sqrt((g_width_c * g_height_c) / semillas) / 3);
	// crear la cuadricula y llenarla de agua
	var biomas = ds_grid_create(g_width_c, g_height_c);
	ds_grid_clear(biomas, m_bio_agua);
	// alistar unos grid para repeticion de generar tierra
	var rep = ds_grid_create(g_width_c, g_height_c);
	ds_grid_clear(rep, 0);
	var esp = ds_grid_create(g_width_c, g_height_c);
	ds_grid_clear(esp, 0);
	// poner semillas de tierra aleatoria
	var xx, yy;
	repeat semillas {
		xx = irandom(g_width_c - 1);
		yy = irandom(g_height_c - 1);
		ds_grid_set(biomas, xx, yy,
			choose(m_bio_pasto, m_bio_tierra));
		ds_grid_set(rep, xx, yy,
			irandom_range(1, 3) * radio);
		ds_grid_set(esp, xx, yy,
			random_range(0.333, 0.666));
	}
	// expandir las semillas, continentes
	var cnt, chnc, veci;
	var ok = true;
	while ok {
		ok = false;
		for (var w = 0; w < g_width_c; w++) {
			for (var h = 0; h < g_height_c; h++) {
				if ds_grid_get(biomas, w, h) == m_bio_agua {
					continue;
				}
				cnt = ds_grid_get(rep, w, h);
				if cnt == 0 {
					continue;
				}
				ok = true;
				chnc = ds_grid_get(esp, w, h);
				veci = s_mat_vecinos(w, h, false);
				for (var v = 0; v < 8; v++) {
					if random(1) < chnc {
						xx = veci[v, 0];
						yy = veci[v, 1];
						ds_grid_set(biomas, xx, yy,
							choose(ds_grid_get(biomas, w, h),
								m_bio_pasto, m_bio_tierra));
						if ds_grid_get(rep, xx, yy) == 0 {
							ds_grid_set(rep, xx, yy, cnt - 1);
						}
						else {
							ds_grid_set(rep, xx, yy, min(cnt - 1,
								ds_grid_get(rep, xx, yy)));
						}
						ds_grid_set(esp, xx, yy, chnc);
					}
				}
				ds_grid_set(rep, w, h, cnt - 1);
			}
		}
		// verificar que halla suficiente tierra
		if !ok {
			o_juego.tierras = 0;
			for (var w = 0; w < g_width_c; w++) {
				for (var h = 0; h < g_height_c; h++) {
					if ds_grid_get(biomas, w, h) != m_bio_agua {
						o_juego.tierras++;
					}
				}
			}
			if o_juego.tierras / (g_width_c * g_height_c) < 0.333 {
				// hacer otro ciclo de semillas aleatorias
				ok = true;
				xx = irandom(g_width_c - 1);
				yy = irandom(g_height_c - 1);
				ds_grid_set(biomas, xx, yy,
					choose(m_bio_pasto, m_bio_tierra));
				ds_grid_set(rep, xx, yy,
					irandom_range(1, 3) * radio);
				ds_grid_set(esp, xx, yy,
					random_range(0.333, 0.666));
			}
		}
	}
	// finalizar
	ds_grid_destroy(rep);
	ds_grid_destroy(esp);
	return biomas;
}
