randomize();
draw_set_font(d_letras);

globalvar dlt, dlts, g_viento_x, g_viento_y, g_color,
	g_width_c, g_height_c, g_width, g_height, g_viento_vel,
	g_migrupo;
dlt = 0; // delta de tiempo pausable
dlts = 0; // delta de tiempo no pausable
g_viento_x = 0; // direccion y fuerza del viento
g_viento_y = 0;
g_viento_vel = 0; // velocidad viento interpolada
g_width_c = 64; // talla del mundo cotada en zonas
g_height_c = 48;
g_width = room_width; // talla general del mundo, recalculada en o_juego
g_height = room_height;
g_migrupo = m_gru_azul; // con que grupo juego
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
