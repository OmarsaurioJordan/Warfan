function s_invisi_recursos() {
	
	// ver si debe ocultar los recursos cerca a edificaciones
	with o_natural {
		visible = !place_meeting(x, y, o_bloque) and
			!place_meeting(x, y, o_escombro);
	}
	// ver si debe destruir escombros cerca a edificaciones
	// Tarea
}
