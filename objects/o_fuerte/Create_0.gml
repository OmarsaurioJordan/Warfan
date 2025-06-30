s_invisi_recursos();
grupo = m_gru_azul;
vida_max = s_get_vida(object_index);
vida = vida_max;
fuego = irandom(m_fuegos_ani - 1);
paso_disparo = -1;
reloj_disparo = 0;
reloj_ataque = m_reloj_ataque;
reloj_activo = 0; // evita error
s_audio(a_construir, x, y);
