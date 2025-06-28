function s_objetivo(observador, objetivo, alcance) {
	
	var xx = observador.x;
	var yy = observador.y;
	var grp = observador.grupo;
	var dd_min = alcance;
	var res = noone;
	var dd;
	with objetivo {
		if grupo == grp {
			continue;
		}
		dd = s_vec_distancia(x, y, xx, yy);
		if dd < dd_min {
			dd_min = dd;
			res = id;
		}
	}
	return res;
}
