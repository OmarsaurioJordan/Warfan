// indicadores de viento
var e;
var ava = lerp(-1, m_viento_historial,
	reloj_viento / m_viento_reloj_max);
for (var i = 0; i < m_viento_historial; i++) {
	draw_sprite_ext(d_gui, 1, 50 + 100 * i, 50,
		1, 1, 0, c_white, 0.666);
	if ava < i {
		draw_sprite_ext(d_gui, 22, 50 + 100 * i, 50,
			1, 1, 0, c_lime, 0.333);
	}
	if histo_viento_vel[i] == 0 {
		draw_sprite(d_gui, 2, 50 + 100 * i, 50);
	}
	else {
		e = lerp(0.25, 1, histo_viento_vel[i] / 3);
		draw_sprite_ext(d_gui, 0, 50 + 100 * i, 50,
			e, e, histo_viento_ang[i], c_white, 1);
	}
}
