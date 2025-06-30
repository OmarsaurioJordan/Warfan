randomize();
draw_set_font(d_letras);
instance_create_depth(0, 0, 0, o_base);
if !m_mutar {
	audio_channel_num(100);
	audio_falloff_set_model(audio_falloff_inverse_distance_clamped);
}
//s_display_init(); // Quitar ensayo de html5

globalvar dlt, dlts, g_viento_x, g_viento_y, g_color,
	g_width_c, g_height_c, g_width, g_height, g_viento_vel,
	g_migrupo, g_edifi_foco, g_seleccion, g_paso_fuego;
dlt = 0; // delta de tiempo pausable
dlts = 0; // delta de tiempo no pausable
g_viento_x = 0; // direccion y fuerza del viento
g_viento_y = 0;
g_viento_vel = 0; // velocidad viento interpolada
g_width_c = m_mundo_w; // talla del mundo cotada en zonas
g_height_c = m_mundo_h;
g_width = room_width; // talla general del mundo, recalculada en o_juego
g_height = room_height;
g_migrupo = m_gru_azul; // con que grupo juego
g_edifi_foco = noone; // edificacion sombreada por mouse
g_seleccion = noone; // que edificio ha seleccionado
mas_vientos = 1; // multiplo para aparecer mas particulas
volumen = 1; // sonidos generales

// para dibujar en diferentes colores
g_color[m_gru_azul] = make_color_rgb(124, 107, 219);
g_color[m_gru_rojo] = make_color_rgb(219, 78, 58);
g_color[m_gru_amarillo] = make_color_rgb(219, 203, 92);
g_color[m_gru_verde] = make_color_rgb(80, 219, 154);

// cosas de la camara
view_camera[0] = camera_create_view(0, 0, room_width, room_height);
cam_data[5] = 0; // para mover la camara con mouse x,y
cam_data[4] = 0;
cam_data[3] = 200; // margenes mas alla del room
cam_data[2] = room_width / room_height; // relacion width / height
cam_data[1] = room_height * 2; // max altura de ventana
cam_data[0] = room_height * 0.5; // min altura de ventana

// grupos manejo global
grupote[m_gru_azul] = m_ctrl_player;
grupote[m_gru_rojo] = m_ctrl_auto;
grupote[m_gru_amarillo] = m_ctrl_auto;
grupote[m_gru_verde] = m_ctrl_auto;

// animaciones para el fuego
for (var i = m_fuegos_ani - 1; i >= 0; i--) {
	reloj_fuego[i] = i / m_fuegos_ani;
	g_paso_fuego[i] = 0;
}

// le da una importancia a los puntos de la IA
peso_puntos = ds_list_create();
ds_list_add(peso_puntos, m_ia_punto_infierno);
ds_list_add(peso_puntos, m_ia_punto_metropolis);
ds_list_add(peso_puntos, m_ia_punto_imperio);
ds_list_add(peso_puntos, m_ia_punto_ciudad);
ds_list_add(peso_puntos, m_ia_punto_alimento);
ds_list_add(peso_puntos, m_ia_punto_extraccion);
ds_list_add(peso_puntos, m_ia_punto_conflicto);
ds_list_add(peso_puntos, m_ia_punto_riesgoso);
ds_list_add(peso_puntos, m_ia_punto_pendiente);
ds_list_add(peso_puntos, m_ia_punto_tenso);
ds_list_add(peso_puntos, m_ia_punto_menor);
ds_list_add(peso_puntos, m_ia_punto_pueblo);
ds_list_add(peso_puntos, m_ia_punto_paraiso);
ds_list_add(peso_puntos, m_ia_punto_recursos);
ds_list_add(peso_puntos, m_ia_punto_mineral);
ds_list_add(peso_puntos, m_ia_punto_madera);
ds_list_add(peso_puntos, m_ia_punto_terreno);
ds_list_add(peso_puntos, m_ia_punto_peligro);
ds_list_add(peso_puntos, m_ia_punto_nuclear);
ds_list_add(peso_puntos, m_ia_punto_altamar);

// costos de ser bombardeados
damage_min = 5; // >= minimo que le hara a enemigo
damage_max = 12; // < maximo que le hara al aliado
damage_objeto = ds_map_create();
ds_map_add(damage_objeto, o_soldado, 1);
ds_map_add(damage_objeto, o_antena, 10);
ds_map_add(damage_objeto, o_fuerte, 16);
ds_map_add(damage_objeto, o_fabrica, 25);
ds_map_add(damage_objeto, o_edificio, 12);
ds_map_add(damage_objeto, o_silo_nuclear, 100);
ds_map_add(damage_objeto, o_cuartel, 5);
ds_map_add(damage_objeto, o_torre, 8);
