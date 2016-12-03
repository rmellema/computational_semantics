model([d1,d2,d3,d4,d5],
	[f(1,n_tent_1,[d1,d2]),
	f(1,n_grass_1,[d3]),
	f(1,n_forest_1,[d4]),
	f(1,n_water_1,[d5]),
	f(1,a_red_1,[d1]),
	f(1,a_blue_1,[d2]),
	f(1,a_green_1,[d3,d4]),
	f(2,s_supports,[(d3,d1),(d3,d2)]),
	f(2,s_touches,[(d3,d1),(d3,d2),(d1,d3),(d2,d3)]))
	f(2,s_near,[(d1,d2),(d2,d4),(d4,d5),(d2,d1),(d4,d2),(d5,d4)]),
	f(2,s_occludes,[(d2,d4)])]).