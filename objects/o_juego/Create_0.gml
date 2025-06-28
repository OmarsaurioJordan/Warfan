// talla general del mundo, por si cambia width_c
g_width = m_wcelda * g_width_c;
g_height = m_hcelda * g_height_c;
instance_create_depth(0, 0, 0, o_mouse);

// para acciones de seleccion y menu contextual
// g_edifi_foco, edificacion sombreada por mouse
// g_seleccion, que edificio ha seleccionado
mouse_foco = m_foc_nada; // que boton sombrea el mouse
construir = noone; // objeto que se desea crear
constru_foc = m_foc_nada; // de que foco viene el construir
reloj_regenera = 0; // para curar unidades

// costos de todas las cosas
costo[m_foc_antena] = 0;
costo[m_foc_cuartel] = 0;
costo[m_foc_torre] = 0;
costo[m_foc_fabrica] = 0;
costo[m_foc_fuerte] = 0;
costo[m_foc_silo_nuclear] = 0;
costo[m_foc_edificio] = 0;
costo[m_foc_paracaidas1] = 0;
costo[m_foc_paracaidas2] = costo[m_foc_paracaidas1];
costo[m_foc_paracaidas3] = costo[m_foc_paracaidas1];
costo[m_foc_bomb_normal] = 0;
costo[m_foc_bomb_dispersion] = 0;
costo[m_foc_bomb_linea] = 0;
costo[m_foc_bomb_nuclear] = 0;
costo[m_foc_velero] = 0;
costo[m_foc_mejora] = 0;
costo[m_foc_dron] = 0;
costo[m_foc_antibombas] = 0;

// estructura de datos para el viento
reloj_viento = m_viento_reloj_max;
for (var i = 0; i < m_viento_historial; i++) {
	histo_viento_ang[i] = irandom(35) * 10;
	histo_viento_vel[i] = irandom(3);
}

// particulas de viento cantidad fija
var dens = m_viento_particulas / (64 * 48);
repeat round(dens * (g_width_c * g_height_c) * o_control.mas_vientos) {
	instance_create_depth(
		random(g_width),
		random(g_height),
		0, o_viento);
}

// crear un mundo aleatorio
tierras = 0; // total de zonas que son terrestres, de g_width_c * g_height_c
biomas = ds_grid_create(g_width_c, g_height_c); // grid con todos los datos de terrenos
do {
	s_new_mundo();
	s_new_biomas();
	s_new_recursos();
}
until (s_inicializar_grupos(ceil(g_width_c * g_height_c *
	(100 / 3072) * s_num_players(true)), 10));
s_crear_demo(300); // Quitar demo

// lista para guardar marcas de quemonazos
lis_quemones_x = ds_list_create();
lis_quemones_y = ds_list_create();

// recursos por grupo
reloj_porcentajes = 0;
ver_porcentajes = true;
for (var i = 0; i < 4; i++) {
	for (var k = 0; k < m_rec_tot; k++) {
		recurso[i, k] = 0;
	}
}
