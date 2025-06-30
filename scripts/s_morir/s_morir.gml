function s_morir(quien) {
	
	with quien {
		var aux;
		switch object_index {
			case o_soldado:
				s_audio(a_muerte, x, y);
				aux = instance_create_depth(x, y, -y, o_muerto);
				break;
			case o_velero:
				s_audio(a_naufraga, x, y);
				aux = instance_create_depth(x, y, -y, o_naufragio);
				break;
		}
		aux.grupo = grupo;
		instance_destroy();
	}
}
