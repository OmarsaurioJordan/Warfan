helice_ang += lerp(20, 150, g_viento_vel / m_viento_vel_max) * dlts;
if helice_ang > 360 {
	helice_ang -= 360;
}
