function s_auto_construir(pos_x, pos_y, el_grupo, foc_edificio) {
	// retorna true si construyo
	
	var obrero = s_ok_construir(pos_x, pos_y, el_grupo, foc_edificio);
	if obrero != noone {
		s_construir(pos_x, pos_y, el_grupo, foc_edificio, obrero);
		return true;
	}
	return false;
}
