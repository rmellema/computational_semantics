model([d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13],
[
	f(1,n_water_2,[d1]),
	f(1,n_boat_1,[d2]),
	f(1,n_outboard_2,[d3]),
	f(1,n_chair_1,[d4,d5,d6]),
	f(1,n_man_1,[d7,d8,d9]),
	f(1,n_hat_1,[d10,d11,d12]),
	f(1,'n_fishing rod_1',[d13]),
	f(1,a_white_1,[d2,d11]),
	f(1,a_black_1,[d11]),
	f(1,a_red_1,[d10,d12]),
	f(2,s_touches,[(d10,d7),(d11,d8),(d12,d9),(d8,d13)]),
	f(2,s_part_of,[(d3,d2),(d4,d2),(d5,d2),(d6,d2)])
]).