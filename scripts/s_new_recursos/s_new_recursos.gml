function s_new_recursos(obj_creador) {
	
	with o_planta {
		instance_destroy();
	}
	with o_mineral {
		instance_destroy();
	}
	with obj_creador {
		// vegetales
		var tot = round(0.25 * tierras);
		var prob = 0.1;
		var rad = 0.1 * g_height;
		s_cluster(o_planta, tot, prob, rad);
		// minerales
		tot = round(0.05 * tierras);
		prob = 0.1;
		rad = 0.01 * g_height;
		s_cluster(o_mineral, tot, prob, rad);
	}
}
