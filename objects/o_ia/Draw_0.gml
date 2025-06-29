draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var c = g_color[grupo];
var txt;
for (var i = 0; i < ds_list_size(punto_ia_x); i++) {
	switch ds_list_find_value(punto_ia_tipo, i) {
		case m_ia_punto_alimento: txt = "x-Alimento"; break;
		case m_ia_punto_altamar: txt = "Altamar"; break;
		case m_ia_punto_ciudad: txt = "o-Ciudad"; break;
		case m_ia_punto_conflicto: txt = "i-Conflicto"; break;
		case m_ia_punto_extraccion: txt = "o-Extraccion"; break;
		case m_ia_punto_imperio: txt = "x-Imperio"; break;
		case m_ia_punto_infierno: txt = "x-Infierno"; break;
		case m_ia_punto_madera: txt = "Madera"; break;
		case m_ia_punto_menor: txt = "x-Menor"; break;
		case m_ia_punto_metropolis: txt = "o-Metropolis"; break;
		case m_ia_punto_mineral: txt = "Mineral"; break;
		case m_ia_punto_nuclear: txt = "o-Nuclear"; break;
		case m_ia_punto_paraiso: txt = "Paraiso"; break;
		case m_ia_punto_peligro: txt = "x-Nuclear"; break;
		case m_ia_punto_pendiente: txt = "o-Pendiente"; break;
		case m_ia_punto_pueblo: txt = "o-Pueblo"; break;
		case m_ia_punto_recursos: txt = "Recursos"; break;
		case m_ia_punto_riesgoso: txt = "x-Riesgoso"; break;
		case m_ia_punto_tenso: txt = "i-Tenso"; break;
		case m_ia_punto_terreno: txt = "Terreno"; break;
	}
	draw_text_transformed_color(
		ds_list_find_value(punto_ia_x, i) - 2,
		ds_list_find_value(punto_ia_y, i),
		txt, 1.5, 1.5, 0, c, c, c, c, 1);
	draw_text_transformed_color(
		ds_list_find_value(punto_ia_x, i) + 2,
		ds_list_find_value(punto_ia_y, i),
		txt, 1.5, 1.5, 0, c, c, c, c, 1);
	draw_text_transformed_color(
		ds_list_find_value(punto_ia_x, i),
		ds_list_find_value(punto_ia_y, i),
		txt, 1.5, 1.5, 0, c_black, c_black, c_black, c_black, 1);
}
