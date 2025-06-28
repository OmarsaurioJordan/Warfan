function s_get_vida(objeto) {
	
	switch objeto {
		case o_soldado: return 10;
		case o_velero: return 15;
		case o_antena: return 50;
		case o_cuartel: return 70;
		case o_torre: return 70;
		case o_silo_nuclear: return 80;
		case o_fabrica: return 90;
		case o_edificio: return 100;
		case o_fuerte: return 300;
		default: return 0;
	}
}
