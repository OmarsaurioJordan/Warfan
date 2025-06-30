// crear fondo
g_width_c = 32;
g_height_c = 24;
tierras = 0; // evita error
biomas = ds_grid_create(g_width_c, g_height_c);
s_new_mundo(id);

// poner musica de fondo
if !m_mutar {
	audio_play_sound(a_music_menu, 100, true);
	audio_stop_sound(a_music_juego1);
	audio_stop_sound(a_music_juego2);
	audio_stop_sound(a_viento);
}
