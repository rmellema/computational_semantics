model([d1,c1,f1,w1],
	[f(1,n_dog_1,[d1]),
	 f(1,n_canine_2,[d1]),
	 f(1,n_domestic_animal_1,[d1]),
	 f(1,n_cat_1,[c1]),
	 f(1,n_feline_1,[c1]),
	 f(1,n_carnivore_1,[c1,d1]),
	 f(1,n_placental_1,[c1,d1]),
	 f(1,n_mammal_1,[c1,d1]),
	 f(1,n_vertebrate_1,[c1,d1]),
	 f(1,n_chordate_1,[c1,d1]),
	 f(1,n_animal_1,[c1,d1]),
	 f(1,n_organism_1,[c1,d1]),
	 f(1,n_living_thing_1,[c1,d1]),
	 f(1,n_field_1,[f1]),
	 f(1,n_tract_1,[f1]),
	 f(1,n_geographical_area_1,[f1]),
	 f(1,n_region_3,[f1]),
	 f(1,n_location_1,[f1]),
	 f(1,n_wall_7,[w1]),
	 f(1,n_fence_1,[w1]),
	 f(1,n_barrier_1,[w1]),
	 f(1,n_obstruction_1,[w1]),
	 f(1,n_structure_1,[w1]),
	 f(1,n_artifact_1,[w1]),
	 f(1,n_whole_2,[c1,d1,w1]),
	 f(1,n_object_1,[c1,d1,f1,w1]),
	 f(1,n_physical_entity_1,[c1,d1,f1,w1]),
	 f(1,n_entity_1,[c1,d1,f1,w1]),
	 f(1,a_black_1,[c1]),
	 f(1,a_beige_1,[d1]),
	 f(1,a_green_1,[f1]),
	 f(1,a_dirty_1,[w1]),
	 f(2,s_touches,[ (c1,f1), (w1,f1), (f1,c1), (f1,w1)]),
	 f(2,s_supports,[ (f1,c1)]),
	 f(2,s_occludes,[ (c1,f1), (c1,w1), (f1,w1)])],
	[g(c1,[175,247,251,231]),
	 g(d1,[131,33,108,206]),
	 g(f1,[1,246,638,232]),
	 g(w1,[261,24,377,260])]).