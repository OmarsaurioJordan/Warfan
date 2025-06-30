function s_normalizar_admin(la_ia) {
	
	with la_ia {
		var tot_madera = 0;
		var tot_mineral = 0;
		for (var i = 0; i < array_length(admin); i++) {
			if s_is_foc_madera(admin[i][0]) {
				tot_madera += admin[i][1];
			}
			else {
				tot_mineral += admin[i][1];
			}
		}
		for (var i = 0; i < array_length(admin); i++) {
			if s_is_foc_madera(admin[i][0]) {
				admin[i][1] /= tot_madera;
			}
			else {
				admin[i][1] /= tot_mineral;
			}
		}
	}
}
