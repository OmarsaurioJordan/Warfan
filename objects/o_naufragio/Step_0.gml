reloj_fin -= dlt;
if reloj_fin <= 0 {
	// 19, 20, 21, 22
	reloj_fin = 2;
	subimg++;
	if subimg > 22 {
		instance_destroy();
	}
}
