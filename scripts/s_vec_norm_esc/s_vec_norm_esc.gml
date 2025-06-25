function s_vec_norm_esc(x1, y1, x2, y2, magfin) {
	// vector que va de P1 hacia P2 con magnitud dada
	// usado esto para vientoXY movimiento, resta vecotiral y seguimiento
	
	var ang = point_direction(x1, y1, x2, y2);
	var dis = min(point_distance(x1, y1, x2, y2), magfin);
	return [lengthdir_x(dis, ang), lengthdir_y(dis, ang)];
}
