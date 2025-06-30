depth = -1000000;
grupo = m_gru_azul;

// estructura de zonas identificadas en el mapa
punto_ia_x = ds_list_create();
punto_ia_y = ds_list_create();
punto_ia_madera = ds_list_create();
punto_ia_mineral = ds_list_create();
punto_ia_gente = ds_list_create();
punto_ia_tipo = ds_list_create();

// listado de acciones posibles
posible_retardo = ds_list_create();
posible_accion = ds_list_create();
posible_criterio = ds_list_create();
posible_edificio = ds_list_create();
posible_x = ds_list_create();
posible_y = ds_list_create();

// listado de acciones aprobadas
aprobado_retardo = ds_list_create();
aprobado_accion = ds_list_create();
aprobado_cantidad = ds_list_create();
aprobado_edificio = ds_list_create();
aprobado_x = ds_list_create();
aprobado_y = ds_list_create();

// sistema de ahorro para cosas
ahorro[m_foc_antena] = 0;
ahorro[m_foc_cuartel] = 0;
ahorro[m_foc_edificio] = 0;
ahorro[m_foc_fabrica] = 0;
ahorro[m_foc_fuerte] = 0;
ahorro[m_foc_silo_nuclear] = 0;
ahorro[m_foc_torre] = 0;
ahorro[m_foc_velero] = 0;
ahorro[m_foc_antibombas] = 0;
ahorro[m_foc_bomb_nuclear] = 0;
ahorro[m_foc_bomb_normal] = 0; // las 3 bombas

// distribucion de ahorro
admin[0] = [m_foc_antena, 15];
admin[1] = [m_foc_cuartel, 35];
admin[2] = [m_foc_edificio, 30];
admin[3] = [m_foc_fabrica, 50];
admin[4] = [m_foc_fuerte, 20];
admin[5] = [m_foc_silo_nuclear, 1];
admin[6] = [m_foc_torre, 25];
admin[7] = [m_foc_velero, 3];
admin[8] = [m_foc_mejora, 15];
// mineral
admin[9] = [m_foc_antibombas, 4];
admin[10] = [m_foc_bomb_nuclear, 1];
admin[11] = [m_foc_bomb_normal, 12]; // las 3 bombas
// normaizacion
s_normalizar_admin(id);
