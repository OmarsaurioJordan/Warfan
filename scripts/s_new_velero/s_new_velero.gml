function s_new_velero(origen) {
	
	if o_juego.recurso[origen.grupo, m_rec_madera] <
			o_juego.costo[m_foc_velero] {
		return false;
	}
	with origen {
		var aux, xx, yy, dd, rr;
		repeat 100 {
			dd = random(360);
			rr = random(m_vision_torre);
			xx = x + lengthdir_x(rr, dd);
			yy = y + lengthdir_y(rr, dd);
			if s_radio_mi_bioma(xx, yy, m_radio_velero, true) {
				aux = instance_create_depth(xx, yy, -yy, o_velero);
				aux.grupo = grupo;
				o_juego.recurso[grupo, m_rec_madera] -=
					o_juego.costo[m_foc_velero];
				return true;
			}
		}
	}
	return false;
}
