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
