function s_costo_acciones(la_ia, foc_accion1, foc_accion2, foc_accion3) {
	// puede dejar los foc a -1
	// return valor acumulado de costo, contextual si es madera, minral, gente
	
	var res = 0;
	with la_ia {
		var tip, tot;
		for (var i = 0; i < ds_list_size(aprobado_accion); i++) {
			tip = ds_list_find_value(aprobado_accion, i);
			tot = ds_list_find_value(aprobado_cantidad, i);
			if tip == foc_accion1 or tip == foc_accion2 or tip == foc_accion3 {
				res += o_juego.costo[tip] * tot;
			}
		}
	}
	return res;
}
