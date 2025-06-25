if reloj_paso >= 0 {
	if !is_agua and reloj_paso < m_paso_fin_explosion {
		var e = min(2, reloj_paso / 9);
		var a = lerp(0.75, 0.25, reloj_paso / m_paso_fin_explosion);
		draw_sprite_ext(d_vapor, reloj_paso_humo, x, y,
			e, e, 0, c_white, a);
	}
	if reloj_paso < 9 {
		draw_sprite(d_explosion, reloj_paso, x, y - 80);
	}
}
