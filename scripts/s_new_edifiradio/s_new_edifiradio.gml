function s_new_edifiradio(pos_x, pos_y, radio_city, objeto, el_grupo) {
	
	var xx, yy, dd, rr;
	var aux = noone;
	var f = 300;
	do {
		f--;
		dd = random(360);
		rr = random(radio_city);
		xx = pos_x + lengthdir_x(rr, dd);
		yy = pos_y + lengthdir_y(rr, dd);
		if collision_circle(xx, yy, 64, o_bloque, true, false) != noone {
			if f < 0 {
				break;
			}
			continue;
		}
		aux = s_new_edificio(xx, yy, objeto, el_grupo);
	}
	until (aux != noone or f < 0);
	return aux;
}
