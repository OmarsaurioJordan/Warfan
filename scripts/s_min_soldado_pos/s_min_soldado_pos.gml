function s_min_soldado_pos(pos_x, pos_y, el_grupo) {
	
	var min_dis = 1000000;
	with o_soldado {
		if grupo == el_grupo {
			min_dis = min(min_dis,
				s_vec_distancia(x, y, pos_x, pos_y));
		}
	}
	return min_dis;
}
