model([d1,d2,d3,d4],
	[f(1,n_boat_1,[d1]),
	 f(1,n_vessel_2,[d1]),
	 f(1,n_craft_2,[d1]),
	 f(1,n_vehicle_1,[d1]),
	 f(1,n_conveyance_3,[d1]),
	 f(1,n_instrumentality_3,[d1]),
	 f(1,n_artifact_1,[d1]),
	 f(1,a_green_1,[d1,d4]),
	 f(1,n_heron_2,[d2]),
	 f(1,n_wading_bird_1,[d2]),
	 f(1,n_aquatic_bird_1,[d2]),
	 f(1,n_bird_1,[d2]),
	 f(1,n_vertebrate_1,[d2]),
	 f(1,n_chordate_1,[d2]),
	 f(1,n_animal_1,[d2]),
	 f(1,n_organism_1,[d2]),
	 f(1,n_living_thing_1,[d2]),
	 f(1,n_whole_2,[d1,d2]),
	 f(1,n_object_1,[d1,d2]),
	 f(1,n_pond_1,[d3]),
	 f(1,n_lake_1,[d3]),
	 f(1,n_body_of_water_1,[d3]),
	 f(1,n_thing_12,[d3]),
	 f(1,n_physical_entity_1,[d1,d2,d3]),
	 f(1,n_vegetation_1,[d4]),
	 f(1,n_collection_1,[d4]),
	 f(1,n_group_1,[d4]),
	 f(1,n_abstraction_6,[d4]),
	 f(1,n_entity_1,[d1,d2,d3,d4]),
	 f(2,s_touches,[ (d2,d1), (d1,d2), (d3,d1), (d1,d3)]),
	 f(2,s_part_of,[ (d4,d3)]),
	 f(2,s_supports,[ (d3,d1), (d1,d2)]),
	 f(2,s_occludes,[ (d1,d3), (d4,d3)])]).