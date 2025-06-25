function s_new_biomas() {
	
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
	var cnt, chnc;
	var ok = true;
	while ok {
		ok = false;
		for (var w = 1; w < g_width_c - 1; w++) {
			for (var h = 1; h < g_height_c - 1; h++) {
				if ds_grid_get(biomas, w, h) == 0 {
					continue;
				}
				cnt = ds_grid_get(rep, w, h);
				if cnt == 0 {
					continue;
				}
				ok = true;
				chnc = ds_grid_get(esp, w, h);
				for (var ww = -1; ww <= 1; ww++) {
					for (var hh = -1; hh <= 1; hh++) {
						if ww == 0 and hh == 0 {
							continue;
						}
						if random(1) < chnc {
							xx = w + ww;
							yy = h + hh;
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
				}
				ds_grid_set(rep, w, h, cnt - 1);
			}
		}
		// verificar que halla suficiente tierra
		if !ok {
			var dens = 0;
			for (var w = 0; w < g_width_c; w++) {
				for (var h = 0; h < g_height_c; h++) {
					if ds_grid_get(biomas, w, h) != 0 {
						dens++;
					}
				}
			}
			if dens / (g_width_c * g_height_c) < 0.4 {
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
	// poner semillas de temperatura
	var temp_x = ds_list_create();
	var temp_y = ds_list_create();
	var temp_c = ds_list_create();
	repeat irandom(5) {
		ds_list_add(temp_x, irandom(g_width_c - 1));
		ds_list_add(temp_y, irandom(g_height_c - 1));
		ds_list_add(temp_c, 1);
	}
	repeat irandom(5) {
		ds_list_add(temp_x, irandom(g_width_c - 1));
		ds_list_add(temp_y, irandom(g_height_c - 1));
		ds_list_add(temp_c, -1);
	}
	// exparcir la temperatura con gradientes
	var dd, tt;
	for (var w = 0; w < g_width_c; w++) {
		for (var h = 0; h < g_height_c; h++) {
			if ds_grid_get(biomas, w, h) != m_bio_agua {
				
				for (var i = 0; i < ds_list_size(temp_c); i++) {
					dd = point_distance(w, h,
						ds_list_find_value(temp_x, i),
						ds_list_find_value(temp_y, i));
					tt = 
				}
				if t > 0.3 {
					ds_grid_set(biomas, w, h, m_bio_arena);
				}
				else if t < -0.3 {
					ds_grid_set(biomas, w, h, m_bio_nieve);
				}
			}
		}
	}
	// finalizar
	ds_list_destroy(temp_x);
	ds_list_destroy(temp_y);
	ds_list_destroy(temp_c);
	ds_grid_destroy(rep);
	ds_grid_destroy(esp);
	return biomas;
}
