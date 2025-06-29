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
reloj_recalcula_plantas = 0; // cuando se destruyen, ver produccion
reloj_envejecer = 0; // para eliminar soldados extra

// costos de todas las cosas
costo[m_foc_antena] = 30;
costo[m_foc_cuartel] = 15;
costo[m_foc_torre] = 25;
costo[m_foc_fabrica] = 20;
costo[m_foc_fuerte] = 40;
costo[m_foc_silo_nuclear] = 100;
costo[m_foc_edificio] = 17;
costo[m_foc_paracaidas1] = 1;
costo[m_foc_paracaidas2] = costo[m_foc_paracaidas1];
costo[m_foc_paracaidas3] = costo[m_foc_paracaidas1];
costo[m_foc_bomb_normal] = m_costo_explosivo * m_bomba_normal_total;
costo[m_foc_bomb_dispersion] = m_costo_explosivo * m_bomba_dispersion_total;
costo[m_foc_bomb_linea] = m_costo_explosivo * m_bomba_linea_total;
var tot = ceil(power(m_bomba_radio_nuclear, 2) /
	power(m_radio_bombita_nuclear, 2));
costo[m_foc_bomb_nuclear] = ceil(m_costo_explosivo * tot * 0.25);
costo[m_foc_velero] = 3;
costo[m_foc_mejora] = ceil(costo[m_foc_edificio] / 2);
costo[m_foc_dron] = 0; // gratis
costo[m_foc_antibombas] = m_costo_explosivo * m_bomba_normal_total;

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

// recursos por grupo
reloj_porcentajes = 0;
ver_porcentajes = true;
for (var i = 0; i < 4; i++) {
	for (var k = 0; k < m_rec_tot; k++) {
		recurso[i, k] = 0;
	}
}

// lista para guardar marcas de quemonazos
lis_quemones_x = ds_list_create();
lis_quemones_y = ds_list_create();

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
//s_crear_demo(300); // Quitar demo
s_viviendas();

// recursos iniciales
for (var i = 0; i < m_players; i++) {
	recurso[i, m_rec_gente] = costo[m_foc_paracaidas3] * 12;
	recurso[i, m_rec_madera] = costo[m_foc_fabrica] * 3;
	recurso[i, m_rec_mineral] = 0;
}
