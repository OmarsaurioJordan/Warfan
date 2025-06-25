function s_mat_vecinos(pos_x, pos_y, con_centro) {
	// retorna las 8 o 9 casillas vecinas [[x,y],[x,y],[x,y]]
	
	var res;
	var i = 0;
	for (var w = -1; w <= 1; w++) {
		for (var h = -1; h <= 1; h++) {
			if !con_centro and w == 0 and h == 0 {
				continue;
			}
			if pos_x + w >= g_width_c {
				res[i, 0] = 0;
			}
			else if pos_x + w < 0 {
				res[i, 0] = g_width_c - 1;
			}
			else {
				res[i, 0] = pos_x + w;
			}
			if pos_y + h >= g_height_c {
				res[i, 1] = 0;
			}
			else if pos_y + h < 0 {
				res[i, 1] = g_height_c - 1;
			}
			else {
				res[i, 1] = pos_y + h;
			}
			i++;
		}
	}
	return res;
}
