model([d1,d2,d3,d4],
	[f(1,n_boy_3,[d1]),
	 f(1,n_male_offspring_1,[d1]),
	 f(1,n_child_2,[d1]),
	 f(1,n_male_2,[d1]),
	 f(1,n_offspring_1,[d1]),
	 f(1,n_relative_1,[d1]),
	 f(1,n_coat_1,[d2]),
	 f(1,n_overgarment_1,[d2]),
	 f(1,n_garment_1,[d2]),
	 f(1,n_clothing_1,[d2]),
	 f(1,n_consumer_goods_1,[d2]),
	 f(1,n_covering_2,[d2]),
	 f(1,n_commodity_1,[d2]),
	 f(1,a_red_1,[d2]),
	 f(1,n_car_2,[d3]),
	 f(1,n_wheeled_vehicle_1,[d3]),
	 f(1,n_container_1,[d3]),
	 f(1,n_vehicle_1,[d3]),
	 f(1,n_conveyance_3,[d3]),
	 f(1,n_instrumentality_3,[d3]),
	 f(1,n_artifact_1,[d2,d3]),
	 f(1,a_green_1,[d3]),
	 f(1,n_sponge_2,[d4]),
	 f(1,n_learner_1,[d4]),
	 f(1,n_person_1,[d1,d4]),
	 f(1,n_causal_agent_1,[d1,d4]),
	 f(1,n_organism_1,[d1,d4]),
	 f(1,n_living_thing_1,[d1,d4]),
	 f(1,n_whole_2,[d1,d2,d3,d4]),
	 f(1,n_object_1,[d1,d2,d3,d4]),
	 f(1,n_physical_entity_1,[d1,d2,d3,d4]),
	 f(1,n_entity_1,[d1,d2,d3,d4]),
	 f(2,s_touches,[ (d1,d3), (d1,d4), (d3,d4), (d3,d1), (d4,d1), (d4,d3)]),
	 f(2,s_part_of,[ (d2,d1)]),
	 f(2,s_supports,[ (d1,d4)]),
	 f(2,s_occludes,[ (d1,d4)])]).