function s_cluster(objeto, cantidad, prob_clust, rad_clust) {
	
	var cx, cy, ok, xx, yy, pr, pd;
	var refer = instance_create_depth(0, 0, 0, objeto);
	var total = cantidad;
	var ini = true;
	while total > 0 {
	    if random(1) < prob_clust or ini {
	        ini = false;
	        // buscar cluster
	        cx = random(g_width);
	        cy = random(g_height);
	    }
	    else {
	        // crear objeto
	        pr = random(360);
	        pd = power(random(1), 1.666) * rad_clust;
	        xx = cx + lengthdir_x(pd, pr);
	        yy = cy + lengthdir_y(pd, pr);
	        if xx > 0 and xx < g_width and yy > 0 and yy < g_height {
				if !s_is_agua(xx, yy) {
		            with refer {
		                ok = place_meeting(xx, yy, o_natural);
		            }
		            if !ok {
		                instance_create_depth(xx, yy, -yy, objeto);
		                total--;
		            }
				}
	        }
	    }
	}
	instance_destroy(refer);
}
