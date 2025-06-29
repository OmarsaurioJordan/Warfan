function s_objeto_azar(el_grupo, objeto) {
	
	var aux = noone;
	var lis = ds_list_create();
	with objeto {
		if grupo == el_grupo {
			ds_list_add(lis, id);
		}
	}
	if !ds_list_empty(lis) {
		aux = ds_list_find_value(lis,
			irandom(ds_list_size(lis) - 1));
	}
	ds_list_destroy(lis);
	return aux;
}
