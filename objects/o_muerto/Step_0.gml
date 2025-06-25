// 14:agua, 15:kill, 16:craneo
if subimg != 16 {
	reloj_fin -= dlt;
	if reloj_fin <= 0 {
		subimg++;
		if subimg == 15 {
			reloj_fin = 10;
		}
		else if s_is_agua(x, y) {
			instance_destroy();
		}
	}
}
