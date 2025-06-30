if keyboard_check_pressed(vk_enter) {
	g_width_c = round(m_mundo_w * 0.75);
	g_height_c = round(m_mundo_h * 0.75);
	o_control.grupote[m_gru_verde] = m_ctrl_vacio;
	room_goto(w_juego);
}
else if keyboard_check_pressed(vk_space) {
	g_width_c = m_mundo_w;
	g_height_c = m_mundo_h;
	o_control.grupote[m_gru_verde] = m_ctrl_auto;
	room_goto(w_juego);
}
