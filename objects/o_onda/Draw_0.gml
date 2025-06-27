if reloj_paso == -1 {
	esc_onda = lerp(2, 0.1, reloj_fin / m_reloj_onda);
	opac_onda = lerp(0.1, 1, reloj_fin / m_reloj_onda);
	draw_sprite_ext(d_viento, 1, x, y - m_altu_vuelo,
		esc_onda, esc_onda, 0, c_white, opac_onda);
}
else {
	draw_sprite(d_explosion, reloj_paso, x, y - (m_altu_vuelo + 28));
}
