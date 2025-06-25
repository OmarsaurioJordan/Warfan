function s_vec_direccion(x1, y1, x2, y2) {
	
	var res = 1000000;
	var ant = res;
	var d, xx, yy;
	for (var w = -1; w <= 1; w++) {
		for (var h = -1; h <= 1; h++) {
			d = point_distance(x1, y1,
				x2 + g_width * w,
				y2 + g_height * h);
			res = min(res, d);
			if ant != res {
				ant = res;
				xx = x2 + g_width * w;
				yy = y2 + g_height * h;
			}
		}
	}
	return point_direction(x1, y1, xx, yy);
}
