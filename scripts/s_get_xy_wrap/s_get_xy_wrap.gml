function s_get_xy_wrap(valor, is_horiz) {
	
	if is_horiz {
		var xx = floor(valor / m_wcelda);
		if xx < 0 {
			return xx + g_width_c;
		}
		else if xx >= g_width_c {
			return xx - g_width_c;
		}
		return xx;
	}
	else {
		var yy = floor(valor / m_hcelda);
		if yy < 0 {
			return yy + g_height_c;
		}
		else if yy >= g_height_c {
			return yy - g_height_c;
		}
		return yy;
	}
}
