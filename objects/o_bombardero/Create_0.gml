s_anima_ini_aire(id);
grupo = m_gru_azul;
reloj_vuelo = m_bombardero_reloj_vuelo;
bomba = choose(0, 1, 2);
reloj_anima = 0;
reloj_paso = 0;
// para comenzar a lanzar en linea
reloj_linea = reloj_vuelo * (1 - m_bomba_linea_por_ini);
linea_x = -1000; // posicion ultima bomba lanzada
linea_y = 0;
s_audio(a_bombardero, x, y);
