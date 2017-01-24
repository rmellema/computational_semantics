model([c1,d1,n1,n2],
	[f(1,n_cat_1,[c1]),
	 f(1,n_feline_1,[c1]),
	 f(1,n_dog_1,[d1]),
	 f(1,n_canine_2,[d1]),
	 f(1,n_domestic_animal_1,[d1]),
	 f(1,n_carnivore_1,[c1,d1]),
	 f(1,n_placental_1,[c1,d1]),
	 f(1,n_mammal_1,[c1,d1]),
	 f(1,n_vertebrate_1,[c1,d1]),
	 f(1,n_chordate_1,[c1,d1]),
	 f(1,n_animal_1,[c1,d1]),
	 f(1,n_organism_1,[c1,d1]),
	 f(1,n_living_thing_1,[c1,d1]),
	 f(1,n_whole_2,[c1,d1]),
	 f(1,n_object_1,[c1,d1]),
	 f(1,n_head_1,[n1,n2]),
	 f(1,n_external_body_part_1,[n1,n2]),
	 f(1,n_body_part_1,[n1,n2]),
	 f(1,n_part_3,[n1,n2]),
	 f(1,n_thing_12,[n1,n2]),
	 f(1,n_physical_entity_1,[c1,d1,n1,n2]),
	 f(1,n_entity_1,[c1,d1,n1,n2]),
	 f(2,s_touches,[ (c1,d1), (c1,n2), (d1,n1), (n1,n2), (d1,c1), (n2,c1), (n1,d1), (n2,n1)]),
	 f(2,s_part_of,[ (n1,c1), (n2,d1)]),
	 f(2,s_occludes,[ (c1,d1)])],
	[g(c1,[136,26,229,371]),
	 g(d1,[318,34,304,391]),
	 g(n1,[204,236,159,159]),
	 g(n2,[321,36,285,283])]).