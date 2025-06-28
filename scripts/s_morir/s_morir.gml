function s_morir(quien) {
	
	with quien {
		var aux;
		switch object_index {
			case o_soldado:
				aux = instance_create_depth(x, y, -y, o_muerto);
				break;
			case o_velero:
				aux = instance_create_depth(x, y, -y, o_naufragio);
				break;
		}
		aux.grupo = grupo;
		instance_destroy();
	}
}
