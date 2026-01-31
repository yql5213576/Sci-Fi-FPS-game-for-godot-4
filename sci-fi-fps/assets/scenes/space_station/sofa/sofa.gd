extends StaticBody3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var sofa2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/sofa/256/sofa2.tres")
			var sofa3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/sofa/256/sofa3.tres")
			var sofa_material:Resource=preload("res://assets/materials_prefab/maps/space_station/sofa/256/sofa.tres")
			$sofa.set_surface_override_material(0,sofa_material)
			$sofa.set_surface_override_material(1,sofa2_material)
			$sofa_001.set_surface_override_material(0,sofa_material)
			$sofa_001.set_surface_override_material(1,sofa3_material)
		if UserData.texture_size_data==512:
			var sofa2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/sofa/512/sofa2.tres")
			var sofa3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/sofa/512/sofa3.tres")
			var sofa_material:Resource=preload("res://assets/materials_prefab/maps/space_station/sofa/512/sofa.tres")
			$sofa.set_surface_override_material(0,sofa_material)
			$sofa.set_surface_override_material(1,sofa2_material)
			$sofa_001.set_surface_override_material(0,sofa_material)
			$sofa_001.set_surface_override_material(1,sofa3_material)
		if UserData.texture_size_data==1024:
			var sofa2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/sofa/1024/sofa2.tres")
			var sofa3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/sofa/1024/sofa3.tres")
			var sofa_material:Resource=preload("res://assets/materials_prefab/maps/space_station/sofa/1024/sofa.tres")
			$sofa.set_surface_override_material(0,sofa_material)
			$sofa.set_surface_override_material(1,sofa2_material)
			$sofa_001.set_surface_override_material(0,sofa_material)
			$sofa_001.set_surface_override_material(1,sofa3_material)
		ready_to_scene=true
