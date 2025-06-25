function s_radio_mi_bioma(pos_x, pos_y, radio, is_agua) {
	// is_agua sera true si se trata de un acuatico verificando agua
	// false si es terrestre verificando este solo en tierra
	
	if s_is_agua(pos_x, pos_y) != is_agua {
		return false;
	}
	for (var xx = -1; xx <= 1; xx += 2) {
		for (var yy = -1; yy <= 1; yy += 2) {
			if s_is_agua(pos_x + xx * radio,
					pos_y + yy * radio) != is_agua {
				return false;
			}
		}
	}
	return true;
}
