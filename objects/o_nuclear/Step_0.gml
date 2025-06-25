// animacion
s_anima_aire(id);

// moverse con el viento
if !s_colision_aire(id, 0.2) {
	x += g_viento_x * m_vel_bombardero * dlt;
	y += g_viento_y * m_vel_bombardero * dlt;
}
s_limites(id);

// destruirse automaticamente
reloj_vuelo -= dlt;
if reloj_vuelo <= 0 {
	instance_destroy();
}
