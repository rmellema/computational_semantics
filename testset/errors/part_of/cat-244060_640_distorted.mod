model([d1,d2,d3,n1,n2,n3,n4],
      [f(1,n_cat_1,[d1]),
       f(1,n_laptop_1,[d2]),
       f(1,n_bed_1,[d3]),
       f(1,n_mouth_1,[n1]),
       f(1,n_lamp_2,[n2]),
       f(1,n_cabinet_1,[n3]),
       f(1,n_head_1,[n4]),
       f(2,s_part_of,[(n1,d1),(d1,n1),(n1,n4),(n4,n1),(n4,d1)]),
       f(2,s_touches,[(d1,d2),(d1,d3),(d2,d3),(n2,n3)]),
       f(2,s_supports,[(d2,d1),(d3,d2),(n3,n2)]),
       f(2,s_occludes,[(d1,d2),(d1,d3),(d1,n3),(d2,d3),(d3,n3)]),
       f(1,n_object_1,[d1,d2,d3,n2,n3]),
       f(1,n_external_body_part_1,[n4]),
       f(1,n_placental_1,[d1]),
       f(1,n_furniture_1,[d3,n2,n3]),
       f(1,n_artifact_1,[d2,d3,n2,n3]),
       f(1,n_whole_2,[d1,d2,d3,n2,n3]),
       f(1,n_thing_12,[n1,n4]),
       f(1,n_vertebrate_1,[d1]),
       f(1,n_orifice_1,[n1]),
       f(1,n_device_1,[d2]),
       f(1,n_physical_entity_1,[d1,d2,d3,n1,n2,n3,n4]),
       f(1,n_carnivore_1,[d1]),
       f(1,n_body_part_1,[n1,n4]),
       f(1,n_instrumentality_3,[d2,d3,n2,n3]),
       f(1,n_entity_1,[d1,d2,d3,n1,n2,n3,n4]),
       f(1,n_organism_1,[d1])],
      [g(d1,[198,5,373,317]),
       g(d2,[155,174,382,231]),
       g(d3,[2,101,635,315]),
       g(n1,[202,54,55,55]),
       g(n2,[456,37,88,112]),
       g(n3,[480,136,135,108]),
       g(n4,[200,6,119,103])]).