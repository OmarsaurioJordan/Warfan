function s_new_edificio(pos_x, pos_y, objeto, el_grupo) {
	
	with o_base {
		if point_in_rectangle(pos_x, pos_y, 36, 36, g_width - 36, g_height - 36) {
			if !place_meeting(pos_x, pos_y, o_bloque) {
				if s_radio_mi_bioma(pos_x, pos_y, 36, false) {
					var aux = instance_create_depth(pos_x, pos_y, -pos_y, objeto);
					aux.grupo = el_grupo;
					return aux;
				}
			}
		}
	}
	return noone;
}
