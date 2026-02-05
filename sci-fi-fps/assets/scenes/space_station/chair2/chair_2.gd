extends StaticBody3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var chair1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/chair2/256/chair1.tres")
			var chair2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/chair2/256/chair2.tres")
			var chair3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/chair2/256/chair3.tres")
			var chair4_material:Resource=preload("res://assets/materials_prefab/maps/space_station/chair2/256/chair4.tres")
			$chair1.set_surface_override_material(0,chair1_material)
			$chair1.set_surface_override_material(0,chair4_material)
			$chair2.set_surface_override_material(0,chair2_material)
			$chair2.set_surface_override_material(0,chair3_material)
		if UserData.texture_size_data==512:
			var chair1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/chair2/512/chair1.tres")
			var chair2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/chair2/512/chair2.tres")
			var chair3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/chair2/512/chair3.tres")
			var chair4_material:Resource=preload("res://assets/materials_prefab/maps/space_station/chair2/512/chair4.tres")
			$chair1.set_surface_override_material(0,chair1_material)
			$chair1.set_surface_override_material(0,chair4_material)
			$chair2.set_surface_override_material(0,chair2_material)
			$chair2.set_surface_override_material(0,chair3_material)
		if UserData.texture_size_data==1024:
			var chair1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/chair2/1024/chair1.tres")
			var chair2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/chair2/1024/chair2.tres")
			var chair3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/chair2/1024/chair3.tres")
			var chair4_material:Resource=preload("res://assets/materials_prefab/maps/space_station/chair2/1024/chair4.tres")
			$chair1.set_surface_override_material(0,chair1_material)
			$chair1.set_surface_override_material(0,chair4_material)
			$chair2.set_surface_override_material(0,chair2_material)
			$chair2.set_surface_override_material(0,chair3_material)
		ready_to_scene=true
			
