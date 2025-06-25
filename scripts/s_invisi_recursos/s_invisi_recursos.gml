function s_invisi_recursos() {
	
	with o_natural {
		visible = !place_meeting(x, y, o_bloque) and
			!place_meeting(x, y, o_escombro);
	}
}
