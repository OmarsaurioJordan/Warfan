// primero hacer el fondo, los suelos
for (var w = 0; w < g_width; w++) {
	for (var h = 0; h < g_height; h++) {
		draw_sprite(d_suelos, ds_grid_get(biomas, w, h),
			w * g_wbaldoza, h * g_hbaldoza);
	}
}
