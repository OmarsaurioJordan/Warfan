function s_busca_punto(la_ia, punto_x, punto_y) {
	
	with la_ia {
		// verificar que no este cerca a otro punto
		var tipo, ok;
		for (var i = 0; i < ds_list_size(punto_ia_x); i++) {
			tipo = ds_list_find_value(punto_ia_tipo, i);
			ok = true;
			switch tipo {
				case m_ia_punto_nuclear:
				case m_ia_punto_peligro:
					ok = false;
					break;
			}
			if ok {
				if s_vec_distancia(punto_x, punto_y,
						ds_list_find_value(punto_ia_x, i),
						ds_list_find_value(punto_ia_y, i)) < m_vision_torre * 2 {
					// Tarea tratar de ver si el otro punto no es tan bueno
					return -1;
				}
			}
		}
		// verificar si es un lugar de recursos
		var terreno = s_is_terreno(punto_x, punto_y); // 0,1,2,3 talla zona
		if terreno > 0 {
			var madera = s_count_circle(punto_x, punto_y, m_vision_extractor, o_planta, noone);
			var mineral = s_count_circle(punto_x, punto_y, m_vision_extractor, o_mineral, noone);
			var gente = s_populization(punto_x, punto_y);
			var recurso = -1;
			if (madera >= 5 or mineral >= 2) and gente >= 0.8 {
				recurso = m_ia_punto_paraiso;
			}
			else if madera >= 5 and mineral >= 2 {
				recurso = m_ia_punto_recursos;
			}
			else if mineral >= 2 {
				recurso = m_ia_punto_mineral;
			}
			else if madera >= 5 {
				recurso = m_ia_punto_madera;
			}
			else if gente >= 0.9 {
				recurso = m_ia_punto_terreno;
			}
			// identificado que el lugar es construible y tiene recursos
			if recurso != -1 {
				var otro = s_count_circle_grupo(punto_x, punto_y, m_vision_torre, o_bloque, grupo, false);
				var mio = s_count_circle_grupo(punto_x, punto_y, m_vision_torre, o_bloque, grupo, true);
				if recurso == m_ia_punto_terreno {
					if otro >= 6 {
						s_set_punto(id, punto_x, punto_y, madera, mineral, gente, m_ia_punto_imperio);
						return m_ia_punto_imperio;
					}
					else if mio >= 6 {
						s_set_punto(id, punto_x, punto_y, madera, mineral, gente, m_ia_punto_ciudad);
						return m_ia_punto_ciudad;
					}
					else if otro > 0 and mio > 0 {
						s_set_punto(id, punto_x, punto_y, madera, mineral, gente, m_ia_punto_tenso);
						return m_ia_punto_tenso;
					}
					else if otro > 0 {
						s_set_punto(id, punto_x, punto_y, madera, mineral, gente, m_ia_punto_menor);
						return m_ia_punto_menor;
					}
					else if mio > 0 {
						s_set_punto(id, punto_x, punto_y, madera, mineral, gente, m_ia_punto_pueblo);
						return m_ia_punto_pueblo;
					}
					else {
						s_set_punto(id, punto_x, punto_y, madera, mineral, gente, recurso);
						return recurso;
					}
				}
				else {
					if s_count_circle_grupo(punto_x, punto_y, m_vision_extractor, o_fabrica, grupo, false) > 0 {
						if otro >= 6 {
							s_set_punto(id, punto_x, punto_y, madera, mineral, gente, m_ia_punto_infierno);
							return m_ia_punto_infierno;
						}
						else {
							s_set_punto(id, punto_x, punto_y, madera, mineral, gente, m_ia_punto_alimento);
							return m_ia_punto_alimento;
						}
					}
					else if s_count_circle_grupo(punto_x, punto_y, m_vision_extractor, o_fabrica, grupo, true) > 0 {
						if mio >= 6 {
							s_set_punto(id, punto_x, punto_y, madera, mineral, gente, m_ia_punto_metropolis);
							return m_ia_punto_metropolis;
						}
						else {
							s_set_punto(id, punto_x, punto_y, madera, mineral, gente, m_ia_punto_extraccion);
							return m_ia_punto_extraccion;
						}
					}
					else if otro > 0 and mio > 0 {
						s_set_punto(id, punto_x, punto_y, madera, mineral, gente, m_ia_punto_conflicto);
						return m_ia_punto_conflicto;
					}
					else if otro > 0 {
						s_set_punto(id, punto_x, punto_y, madera, mineral, gente, m_ia_punto_riesgoso);
						return m_ia_punto_riesgoso;
					}
					else if mio > 0 {
						s_set_punto(id, punto_x, punto_y, madera, mineral, gente, m_ia_punto_pendiente);
						return m_ia_punto_pendiente;
					}
					else {
						s_set_punto(id, punto_x, punto_y, madera, mineral, gente, recurso);
						return recurso;
					}
				}
			}
		}
		// verificar si es altamar
		else if s_radio_mi_bioma(punto_x, punto_y, m_vision_torre, true) {
			s_set_punto(id, punto_x, punto_y, 0, 0, 0, m_ia_punto_altamar);
			return m_ia_punto_altamar;
		}
	}
	return -1;
}
