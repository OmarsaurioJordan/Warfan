function s_limites(quien) {
	
	with quien {
		if x < 0 { x += g_width; }
		else if x > g_width { x -= g_width; }
		if y < 0 { y += g_height; }
		else if y > g_height { y -= g_height; }
		depth = -y;
	}
}
