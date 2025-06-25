function s_anima_aire(quien) {
	
	with quien {
		reloj_anima_aire -= dlts;
		if reloj_anima_aire <= 0 {
			reloj_anima_aire += random_range(0.1, 0.2);
			switch abs(paso_anima_aire) {
				case 0.01:
					paso_anima_aire = 0.5 * sign(paso_anima_aire);
					break;
				case 0.5:
					paso_anima_aire = 0.8 * sign(paso_anima_aire);
					break;
				case 0.8:
					paso_anima_aire = 1 * sign(paso_anima_aire);
					break;
				case 1:
					paso_anima_aire = 0.81 * sign(paso_anima_aire);
					break;
				case 0.81:
					paso_anima_aire = 0.51 * sign(paso_anima_aire);
					break;
				case 0.51:
					paso_anima_aire = -0.01 * sign(paso_anima_aire);
					break;
			}
			altura = m_altu_vuelo + paso_anima_aire * 7;
		}
	}
}
