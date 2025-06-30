// viento
#macro m_viento_particulas 1000
#macro m_viento_vel_max 300
#macro m_viento_historial 5
#macro m_viento_reloj_max 12
#macro m_dlt 0.2 // paso constante para predicciones

// costos
#macro m_costo_explosivo 2

// entes
#macro m_reloj_regenera 30
#macro m_altu_vuelo 127
#macro m_gravedad 64
#macro m_vision_suelo 150
#macro m_vision_torre 200
#macro m_vision_extractor 250
#macro m_vision_aire 300
#macro m_vision_dron 400
#macro m_paracaidas_reloj_vuelo 10
#macro m_bombardero_reloj_vuelo 10
#macro m_bomba_dispersion_vel_min 150
#macro m_bomba_dispersion_vel_max 200
#macro m_bomba_linea_por_ini 0.333
#macro m_bomba_dispersion_total 10
#macro m_bomba_linea_total 10
#macro m_bomba_normal_total 6
#macro m_bomba_radio_normal 200
#macro m_bomba_radio_nuclear 666
#macro m_reloj_nuclear 120
#macro m_radio_bombita_nuclear 55
#macro m_vel_dron 0.75
#macro m_vel_velero 0.5
#macro m_vel_bombardero 0.8
#macro m_vel_paracaidas_min 0.3
#macro m_vel_paracaidas_max 0.9
#macro m_reloj_produccion 2
#macro m_radio_velero 28
#macro m_reloj_onda 4
#macro m_vel_onda 180
#macro m_ondas_total 32
#macro m_cadencia_ondas 30
#macro m_radio_explosion 80
#macro m_reloj_ataque 2.5
#macro m_viviendas_ini 12
#macro m_viviendas_edi1 4
#macro m_viviendas_edi2 8
#macro m_viviendas_edi3 12

// otras cosas, decorados
#macro m_paso_fin_explosion 120
#macro m_reloj_porcentajes 3
#macro m_fuegos_ani 24

// dibujado de colores y terrenos
#macro m_gru_azul 0
#macro m_gru_rojo 1
#macro m_gru_amarillo 2
#macro m_gru_verde 3
#macro m_ctrl_vacio 0
#macro m_ctrl_player 1
#macro m_ctrl_auto 3
#macro m_bio_agua 0
#macro m_bio_arena 1
#macro m_bio_tierra 2
#macro m_bio_pasto 3
#macro m_bio_nieve 4
#macro m_bio_hielo 5
#macro m_bio_rojo 6

// estructura del mundo
#macro m_mundo_w 64
#macro m_mundo_h 48
#macro m_wcelda 134
#macro m_hcelda 84
#macro m_players 4
#macro m_radio_ciudad 220
#macro m_mutar false

// enumeraciones
#macro m_bomb_normal 0
#macro m_bomb_dispersion 1
#macro m_bomb_linea 2
#macro m_bomb_nuclear 3
#macro m_rec_gente 0
#macro m_rec_mineral 1
#macro m_rec_madera 2
#macro m_rec_poblacion 3
#macro m_rec_edificios 4
#macro m_rec_explosiones 5
#macro m_rec_vivo 6
#macro m_rec_porcent 7
#macro m_rec_viviendas 8
#macro m_rec_soldados 9
#macro m_rec_tot 10
#macro m_foc_nada -1
#macro m_foc_silo_nuclear 0
#macro m_foc_antena 1
#macro m_foc_fuerte 2
#macro m_foc_fabrica 3
#macro m_foc_edificio 4
#macro m_foc_torre 5
#macro m_foc_cuartel 6
#macro m_foc_edi_foco 7
#macro m_foc_bomb_normal 8
#macro m_foc_bomb_dispersion 9
#macro m_foc_bomb_linea 10
#macro m_foc_bomb_nuclear 11
#macro m_foc_paracaidas1 12
#macro m_foc_paracaidas2 13
#macro m_foc_paracaidas3 14
#macro m_foc_velero 15
#macro m_foc_mejora 16
#macro m_foc_dron 17
#macro m_foc_antibombas 18

// cosas de la IA
// si agrega algo nuevo, ponerlo en o_control ini
#macro m_ia_prob_accion 0.03 // para comportamiento estocastico
#macro m_ia_retardo_rafaga_cosas 4 // seg para no paracaidas y bombas seguidos
#macro m_ia_cluster_construir 5 // cuantos edificios para elegir
#macro m_ia_punto_madera 0 // pendiente por dominar
#macro m_ia_punto_mineral 1 // pendiente por dominar
#macro m_ia_punto_recursos 2 // madera mas mineral por dominar
#macro m_ia_punto_extraccion 3 // ya se han puesto bases en recurso
#macro m_ia_punto_ciudad 4 // infraestructura grande de viviendas
#macro m_ia_punto_terreno 5 // para hacer ciudad, population
#macro m_ia_punto_paraiso 6 // para hacer ciudad ademas con recursos
#macro m_ia_punto_alimento 7 // zona de extraccion enemiga
#macro m_ia_punto_imperio 8 // ciudad enemiga grande de viviendas
#macro m_ia_punto_altamar 9 // zona de mar amplia
#macro m_ia_punto_peligro 10 // silo nuclear enemigo
#macro m_ia_punto_nuclear 11 // silo nuclear propio
#macro m_ia_punto_pueblo 12 // lanzaderas y construcciones random propias
#macro m_ia_punto_menor 13 // lanzaderas y construcciones random enemigas
#macro m_ia_punto_tenso 14 // mezcla de edificaciones propias y enemigas
#macro m_ia_punto_metropolis 15 // ciudad propia que ademas extrae
#macro m_ia_punto_infierno 16 // ciudad enemiga que ademas extrae
#macro m_ia_punto_pendiente 17 // tiene edificios en recurso pero no extractor
#macro m_ia_punto_riesgoso 18 // enemigo edificios en recurso pero no extractor
#macro m_ia_punto_conflicto 19 // sin extractor en recursos pero ambos ahi
