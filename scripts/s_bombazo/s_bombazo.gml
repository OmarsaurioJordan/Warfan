function s_bombazo(pos_x, pos_y, numero, radio, grupo) {
	
	var xx, yy, dd, aux;
	aux = instance_create_depth(pos_x, pos_y, -pos_y, o_explosion);
	aux.grupo = grupo
	repeat numero - 1 {
		do {
			xx = pos_x + random_range(-radio, radio);
			yy = pos_y + random_range(-radio, radio);
			dd = point_distance(pos_x, pos_y, xx, yy);
		}
		until (dd < radio);
		aux = instance_create_depth(xx, yy, -yy, o_explosion);
		aux.reloj_fin = random_range(dd / 2, dd) / 100;
		aux.grupo = grupo;
	}
}
