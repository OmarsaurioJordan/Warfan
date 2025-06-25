function s_vec_dis_dir(x1, y1, x2, y2) {
	// retorna [distancia, direccion]
	
	var res = [1000000, 0];
	var ant = res[0];
	var d, xx, yy;
	for (var w = -1; w <= 1; w++) {
		for (var h = -1; h <= 1; h++) {
			d = point_distance(x1, y1,
				x2 + g_width * w,
				y2 + g_height * h);
			res[0] = min(res[0], d);
			if ant != res[0] {
				ant = res[0];
				xx = x2 + g_width * w;
				yy = y2 + g_height * h;
			}
		}
	}
	res[1] = point_direction(x1, y1, xx, yy);
	return res;
}
