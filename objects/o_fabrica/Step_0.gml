// animacion helice
var vv = g_viento_vel / m_viento_vel_max;
helice_ang += lerp(20, 150, vv) * dlts;
if helice_ang > 360 {
	helice_ang -= 360;
}

// produccion
reloj_produccion -= dlt;
if reloj_produccion <= 0 {
	reloj_produccion += m_reloj_produccion + random(0.2);
	o_juego.recurso[grupo, m_rec_mineral] +=
		ext_mineral * 0.1 * vv;
	o_juego.recurso[grupo, m_rec_madera] +=
		ext_madera * 0.1 * vv;
}
