model([d1,d2,d3,d5,d6,d7],
	[f(1,n_woman_1,[d1]),
	 f(1,n_adult_1,[d1]),
	 f(1,n_female_2,[d1]),
	 f(1,n_person_1,[d1]),
	 f(1,n_causal_agent_1,[d1]),
	 f(1,n_organism_1,[d1]),
	 f(1,n_living_thing_1,[d1]),
	 f(1,a_brown_1,[d2]),
	 f(1,n_hair_1,[d2]),
	 f(1,n_body_covering_1,[d2]),
	 f(1,n_covering_1,[d2]),
	 f(1,a_white_1,[d3]),
	 f(1,n_shirt_1,[d3]),
	 f(1,n_garment_1,[d3]),
	 f(1,n_clothing_1,[d3]),
	 f(1,n_consumer_goods_1,[d3]),
	 f(1,n_covering_2,[d3]),
	 f(1,n_commodity_1,[d3]),
	 f(1,a_red_1,[d5,d6]),
	 f(1,n_apple_1,[d6]),
	 f(1,n_pear_1,[d7]),
	 f(1,n_edible_fruit_1,[d6,d7]),
	 f(1,n_pome_1,[d6,d7]),
	 f(1,n_produce_1,[d6,d7]),
	 f(1,n_fruit_1,[d6,d7]),
	 f(1,n_food_2,[d6,d7]),
	 f(1,n_reproductive_structure_1,[d6,d7]),
	 f(1,n_solid_1,[d6,d7]),
	 f(1,n_plant_organ_1,[d6,d7]),
	 f(1,n_matter_3,[d6,d7]),
	 f(1,n_plant_part_1,[d6,d7]),
	 f(1,n_natural_object_1,[d2,d6,d7]),
	 f(1,n_lipstick_1,[d5]),
	 f(1,n_makeup_1,[d5]),
	 f(1,n_cosmetic_1,[d5]),
	 f(1,n_toiletry_1,[d5]),
	 f(1,n_instrumentality_3,[d5]),
	 f(1,n_artifact_1,[d3,d5]),
	 f(1,n_whole_2,[d1,d2,d3,d5,d6,d7]),
	 f(1,n_object_1,[d1,d2,d3,d5,d6,d7]),
	 f(1,n_physical_entity_1,[d1,d2,d3,d5,d6,d7]),
	 f(1,n_entity_1,[d1,d2,d3,d5,d6,d7]),
	 f(2,s_touches,[ (d1,d6), (d6,d1), (d1,d7), (d7,d1), (d1,d2), (d2,d1), (d1,d5), (d5,d1), (d1,d3), (d3,d1)]),
	 f(2,s_near,[ (d3,d2), (d5,d2), (d2,d3), (d5,d3), (d6,d3), (d7,d3), (d7,d6), (d6,d7), (d2,d5), (d3,d5), (d3,d6), (d3,d7)]),
	 f(2,s_part_of,[ (d2,d1)]),
	 f(2,s_supports,[ (d1,d3), (d1,d6), (d1,d7), (d1,d5)])]).