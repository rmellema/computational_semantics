model([d1,d2,d3,d4,d5,d6,d7,d8],
      [f(1,n_swan_1,[d1,d2,d3,d4]),
       f(1,a_white_2,[d1,d4]),
	f(1,a_black_1,[d2,d3]),
	f(1,n_water_1,[d5]),
	f(1,n_ripple_1,[d6,d7,d8]),
	f(2,s_supports,[(d5,d1),(d5,d2),(d5,d3),(d5,d4)]),
	f(2,s_part_of,[(d6,d5),(d7,d5),(d8,d5)])]).
