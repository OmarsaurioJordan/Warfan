function s_set_construir(objeto) {
	
	with o_juego {
		if construir == objeto {
			construir = noone;
		}
		else {
			construir = objeto;
			constru_foc = mouse_foco;
			surface_free(o_mouse.surf_edi);
		}
	}
}
