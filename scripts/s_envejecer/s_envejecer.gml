function s_envejecer(quien) {
	
	with quien {
		var aux = instance_create_depth(x, y, -y, o_muerto);
		aux.grupo = grupo;
		aux.viejo = true;
		instance_destroy();
	}
}
