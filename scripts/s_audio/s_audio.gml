function s_audio(sonido, pos_x, pos_y) {
	
	if m_mutar {
		return noone;
	}
	var p = 1;
	var r = 0.5;
	switch sonido {
		case a_disparo:
			p = 1;
			break;
		case a_muerte:
			sonido = choose(a_muerte, a_muere2);
			p = 2;
			break;
		case a_naufraga:
			p = 3;
			break;
		case a_paracaidas:
			p = 4;
			break;
		case a_soldado:
			p = 5;
			break;
		case a_bombardero:
			p = 6;
			break;
		case a_caebomba:
			p = 7;
			break;
		case a_explosion:
			p = 8;
			r = 1.5;
			break;
		case a_demoler:
			p = 9;
			break;
		case a_construir:
			p = 10;
			break;
		case a_nuclear:
			p = 50;
			r = 5;
			break;
	}
	return audio_play_sound_at(sonido, pos_x, pos_y, 0,
		g_width * 0.1 * r, g_width * r, 1, false, p);
}
