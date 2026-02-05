extends StaticBody3D
var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var wall1_1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1/256/wall1-1.tres")
			var wall1_2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1/256/wall1-2.tres")
			var wall1_3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1/256/wall1-3.tres")
			$Cube.set_surface_override_material(0,wall1_1_material)
			$Cube.set_surface_override_material(1,wall1_2_material)
			$Cube_005.set_surface_override_material(0,wall1_3_material)
		if UserData.texture_size_data==512:
			var wall1_1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1/512/wall1-1.tres")
			var wall1_2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1/512/wall1-2.tres")
			var wall1_3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1/512/wall1-3.tres")
			$Cube.set_surface_override_material(0,wall1_1_material)
			$Cube.set_surface_override_material(1,wall1_2_material)
			$Cube_005.set_surface_override_material(0,wall1_3_material)
		if UserData.texture_size_data==1024:
			var wall1_1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1/1024/wall1-1.tres")
			var wall1_2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1/1024/wall1-2.tres")
			var wall1_3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1/1024/wall1-3.tres")
			$Cube.set_surface_override_material(0,wall1_1_material)
			$Cube.set_surface_override_material(1,wall1_2_material)
			$Cube_005.set_surface_override_material(0,wall1_3_material)
		ready_to_scene=true
