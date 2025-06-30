// modo buscar bombarderos
if reloj_paso == -1 {
	reloj_fin -= dlt;
	if reloj_fin <= 0 {
		instance_destroy();
	}
	else {
		// moverse
		x += lengthdir_x(m_vel_onda * dlt, direction);
		y += lengthdir_y(m_vel_onda * dlt, direction);
		s_limites(id);
		// verificar si puede desactivar bombarderos
		if codigo_onda != -1 {
			var otr = instance_place(x, y, o_bombardero);
			if otr != noone {
				if otr.grupo != grupo {
					if o_juego.recurso[grupo, m_rec_mineral] >=
							o_juego.costo[m_foc_antibombas] {
						o_juego.recurso[grupo, m_rec_mineral] -=
							o_juego.costo[m_foc_antibombas];
						reloj_paso = 0;
						reloj_fin = random_range(0.1, 0.15);
						x = otr.x;
						y = otr.y;
						depth = otr.depth;
						var ccc = codigo_onda;
						s_audio(a_explosion, x, y); // Tarea sonido implosion
						with o_onda {
							if codigo_onda == ccc {
								codigo_onda = -1;
							}
						}
						instance_destroy(otr);
					}
				}
			}
		}
	}
}
// modo explotando
else {
	reloj_fin -= dlt;
	if reloj_fin <= 0 {
		reloj_fin = random_range(0.1, 0.15);
		reloj_paso++;
		if reloj_paso >= 9 {
			instance_destroy();
		}
	}
}
