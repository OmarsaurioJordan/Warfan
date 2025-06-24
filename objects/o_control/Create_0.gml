randomize();
globalvar dlt, dlts, g_viento_x, g_viento_y, g_color,
	g_width, g_height, g_wbaldoza, g_hbaldoza;
dlt = 0; // delta de tiempo pausable
dlts = 0; // delta de tiempo no pausable
g_viento_x = 0; // direccion y fuerza del viento
g_viento_y = 0;
g_width = 64; // talla del mundo cotada en zonas
g_height = 48;
g_wbaldoza = 134; // talla de cada una de las baldozas, d_suelo
g_hbaldoza = 84;
// para dibujar en diferentes colores
g_color[m_gru_azul] = make_color_rgb(0, 0, 100);
g_color[m_gru_rojo] = make_color_rgb(100, 0, 0);
g_color[m_gru_amarillo] = make_color_rgb(100, 100, 0);
g_color[m_gru_verde] = make_color_rgb(0, 100, 0);
// cosas de la camara
view_camera[0] = camera_create_view(0, 0, room_width, room_height);
cam_data[5] = 0; // para mover la camara con mouse x,y
cam_data[4] = 0;
cam_data[3] = 200; // margenes mas alla del room
cam_data[2] = room_width / room_height; // relacion width / height
cam_data[1] = room_height * 2; // max altura de ventana
cam_data[0] = room_height * 0.5; // min altura de ventana
