function s_demoler(origen) {
	
	with origen {
		var aux = instance_create_depth(x, y, -y, o_escombro);
		aux.grupo = grupo;
		switch object_index {
			case o_edificio:
				aux.tipo = 30;
				break;
			case o_torre:
				aux.tipo = 8;
				break;
			case o_cuartel:
				aux.tipo = 1;
				break;
			case o_fabrica:
				aux.tipo = 11;
				break;
			case o_fuerte:
				aux.tipo = 6;
				break;
			case o_antena:
				aux.tipo = 17;
				break;
			case o_silo_nuclear:
				aux.tipo = 15;
				break;
		}
		if g_edifi_foco == id {
			g_edifi_foco = noone;
		}
		if g_seleccion == id {
			g_seleccion = noone;
		}
		s_audio(a_demoler, x, y);
		instance_destroy();
	}
}
