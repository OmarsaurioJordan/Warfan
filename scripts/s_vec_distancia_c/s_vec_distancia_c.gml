function s_vec_distancia_c(x1, y1, x2, y2) {
	
	var res = 1000000;
	var d;
	for (var w = -1; w <= 1; w++) {
		for (var h = -1; h <= 1; h++) {
			d = point_distance(x1, y1,
				x2 + g_width_c * w,
				y2 + g_height_c * h);
			res = min(res, d);
		}
	}
	return res;
}
