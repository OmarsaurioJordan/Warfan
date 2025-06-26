// animacion
s_anima_aire(id);
reloj_anima -= dlts;
if reloj_anima <= 0 {
	reloj_anima += random_range(0.1, 0.15);
	reloj_paso++;
	if reloj_paso > 3 {
		reloj_paso = 0;
	}
}

// alejarse de otros drones
if random(1) < 0.2 {
	var lis = ds_priority_create();
	if s_meet_circle_list(x, y, m_vision_dron,
			o_dron, id, lis) != 0 {
		var tot = ds_priority_size(lis);
		var vv = 200 * dlt / tot;
		var dd, aux;
		for (var i = 0; i < ceil(tot / 2); i++) {
			aux = ds_priority_find_min(lis);
			dd = ds_priority_find_priority(lis, aux);
			ds_priority_delete_min(lis);
			x += lengthdir_x(vv * 1.5, dd);
			y += lengthdir_y(vv * 1.5, dd);
		}
		for (var i = ceil(tot / 2); i < tot; i++) {
			aux = ds_priority_find_min(lis);
			dd = ds_priority_find_priority(lis, aux);
			ds_priority_delete_min(lis);
			x += lengthdir_x(vv * 0.5, dd);
			y += lengthdir_y(vv * 0.5, dd);
		}
		vv = 200 * dlt
		dd = random(360);
		x += lengthdir_x(vv, dd);
		y += lengthdir_y(vv, dd);
	}
	ds_priority_destroy(lis);
}
// moverse con el viento
if !s_colision_aire(id, 0.2) {
	x += g_viento_x * m_vel_dron * dlt;
	y += g_viento_y * m_vel_dron * dlt;
}
s_limites(id);
