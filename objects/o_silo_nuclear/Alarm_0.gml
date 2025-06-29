// identificar punto estrategico
var xx = x;
var yy = y;
var grp = grupo;
with o_ia {
	if grp == grupo {
		s_set_punto(id, xx, yy, 0, 0, 0, m_ia_punto_nuclear);
	}
	else {
		s_set_punto(id, xx, yy, 0, 0, 0, m_ia_punto_peligro);
	}
}
