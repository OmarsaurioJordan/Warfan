function s_new_biomas() {
	
	with o_juego {
		// poner semillas de temperatura
		var prob = 0.1;
		var tot = irandom(ceil(0.01 * tierras));
		var rad = random_range(0.2, 0.3) * g_height;
		s_cluster(o_temp_pico, tot, prob, rad);
		with o_temp_pico {
			visible = true;
			depth = 1;
		}
		tot = irandom(ceil(0.01 * tierras));
		rad = random_range(0.2, 0.3) * g_height;
		s_cluster(o_temp_pico, tot, prob, rad);
		with o_temp_pico {
			if visible {
				visible = false;
			}
			else {
				depth = -1;
			}
		}
		// convertir o_temp_pico a dominio discreto del grid
		with o_temp_pico {
			x = s_get_xy_wrap(x, true);
			y = s_get_xy_wrap(y, false);
		}
		// crear rejilla de temperatura
		var temp = ds_grid_create(g_width_c, g_height_c);
		ds_grid_clear(temp, 0);
		// exparcir la temperatura con probabilidades
		var grad, tmp_max, tmp_min, r;
		rad = 60 / (g_height_c * 0.15);
		for (var w = 0; w < g_width_c; w++) {
			for (var h = 0; h < g_height_c; h++) {
				tmp_max = 0;
				tmp_min = 0;
				with o_temp_pico {
					grad = depth / (1 + rad * s_vec_distancia_c(x, y, w, h));
					tmp_max = max(tmp_max, grad);
					tmp_min = min(tmp_min, grad);
				}
				r = random_range(tmp_min, tmp_max);
				if r > 0.015 {
					ds_grid_set(temp, w, h, 1);
				}
				else if r < -0.015 {
					ds_grid_set(temp, w, h, -1);
				}
			}
		}
		// hacer filtro para suavizar
		var tmp = ds_grid_create(g_width_c, g_height_c);
		var prom, veci;
		repeat 10 {
			for (var w = 0; w < g_width_c; w++) {
				for (var h = 0; h < g_height_c; h++) {
					prom = 0;
					veci = s_mat_vecinos(w, h, true);
					for (var v = 0; v < 9; v++) {
						prom += ds_grid_get(temp, veci[v, 0], veci[v, 1]);
					}
					ds_grid_set(tmp, w, h, prom / 9);
				}
			}
			ds_grid_copy(temp, tmp);
		}
		// colocar las temperaturas en biomas
		for (var w = 0; w < g_width_c; w++) {
			for (var h = 0; h < g_height_c; h++) {
				if ds_grid_get(biomas, w, h) == m_bio_agua or random(1) < 0.05 {
					continue;
				}
				if ds_grid_get(temp, w, h) > random_range(0.05, 0.3) {
					ds_grid_set(biomas, w, h, m_bio_arena);
				}
				else if ds_grid_get(temp, w, h) < -random_range(0.05, 0.3) {
					ds_grid_set(biomas, w, h, m_bio_nieve);
				}
			}
		}
		// finalizar
		ds_grid_destroy(temp);
		ds_grid_destroy(tmp);
		with o_temp_pico {
			instance_destroy();
		}
	}
}
