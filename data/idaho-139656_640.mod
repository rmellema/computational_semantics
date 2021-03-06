model([d1,d2,d3,d4,d5,d6,d7,d8],
	[f(1,n_sheep_1,[d1,d2]),
	 f(1,n_bovid_1,[d1,d2]),
	 f(1,n_ruminant_1,[d1,d2]),
	 f(1,n_even-toed_ungulate_1,[d1,d2]),
	 f(1,n_flock_5,[d3]),
	 f(1,n_animal_group_1,[d3]),
	 f(1,n_biological_group_1,[d3]),
	 f(1,n_group_1,[d3]),
	 f(1,n_abstraction_6,[d3]),
	 f(1,n_horse_1,[d4]),
	 f(1,n_equine_1,[d4]),
	 f(1,n_odd-toed_ungulate_1,[d4]),
	 f(1,n_ungulate_1,[d1,d2,d4]),
	 f(1,n_dog_1,[d5]),
	 f(1,n_canine_2,[d5]),
	 f(1,n_domestic_animal_1,[d5]),
	 f(1,n_carnivore_1,[d5]),
	 f(1,n_placental_1,[d1,d2,d4,d5]),
	 f(1,n_mammal_1,[d1,d2,d4,d5]),
	 f(1,n_vertebrate_1,[d1,d2,d4,d5]),
	 f(1,n_chordate_1,[d1,d2,d4,d5]),
	 f(1,n_animal_1,[d1,d2,d4,d5]),
	 f(1,n_mountain_1,[d6]),
	 f(1,n_natural_elevation_1,[d6]),
	 f(1,n_geological_formation_1,[d6]),
	 f(1,n_sky_1,[d8]),
	 f(1,n_atmosphere_5,[d8]),
	 f(1,n_gas_2,[d8]),
	 f(1,n_fluid_2,[d8]),
	 f(1,n_matter_3,[d8]),
	 f(1,a_orange_1,[d8]),
	 f(1,n_horseman_1,[d7]),
	 f(1,n_rider_1,[d7]),
	 f(1,n_traveler_1,[d7]),
	 f(1,n_person_1,[d7]),
	 f(1,n_causal_agent_1,[d7]),
	 f(1,n_organism_1,[d1,d2,d4,d5,d7]),
	 f(1,n_living_thing_1,[d1,d2,d4,d5,d7]),
	 f(1,n_whole_2,[d1,d2,d4,d5,d7]),
	 f(1,n_object_1,[d1,d2,d4,d5,d6,d7]),
	 f(1,n_physical_entity_1,[d1,d2,d4,d5,d6,d7,d8]),
	 f(1,n_entity_1,[d1,d2,d3,d4,d5,d6,d7,d8]),
	 f(2,s_touches,[ (d1,d2), (d2,d1), (d4,d7), (d7,d4)]),
	 f(2,s_near,[ (d7,d5), (d5,d7), (d7,d3), (d3,d7)]),
	 f(2,s_part_of,[ (d1,d3), (d2,d3)]),
	 f(2,s_supports,[ (d4,d7)])]).