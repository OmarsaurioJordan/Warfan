function s_colision_suelo(quien, proporcion) {
	
	if random(1) < proporcion {
		with quien {
			var otr = instance_place(x, y, o_bloque);
			if otr != noone {
				var dd = point_direction(otr.x, otr.y, x, y);
				var vv = 100 * dlt;
				x += lengthdir_x(vv, dd);
				y += lengthdir_y(vv, dd);
				return true;
			}
			else {
				otr = instance_place(x, y, o_movil);
				if otr != noone {
					var dd = point_direction(otr.x, otr.y, x, y);
					var vv = 100 * dlt;
					x += lengthdir_x(vv, dd);
					y += lengthdir_y(vv, dd);
					return true;
				}
			}
		}
	}
	return false;
}
