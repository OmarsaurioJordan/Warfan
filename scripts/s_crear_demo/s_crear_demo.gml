function s_crear_demo(iteraciones) {
	
	var xx, yy, grp, aux;
	repeat iteraciones {
		xx = random_range(m_vision_torre * 2, g_width - m_vision_torre * 2);
		yy = random_range(m_vision_torre * 2, g_height - m_vision_torre * 2);
		grp = irandom(3);
		switch choose(0, 0, 0, 0, 1, 1, 2) {
			case 0: // edificios
				s_new_edificio(xx, yy, choose(
					o_edificio, o_torre, o_cuartel, o_antena,
					o_silo_nuclear, o_fuerte, o_fabrica), grp);
				break;
			case 1: // paracaidas
				aux = instance_create_depth(xx, yy, -yy, o_paracaidas);
				aux.grupo = grp;
				break;
			case 2: // veleros
				if s_radio_mi_bioma(xx, yy, m_radio_velero, true) {
					aux = instance_create_depth(xx, yy, -yy, o_velero);
					aux.grupo = grp;
				}
				break;
		}
	}
}
