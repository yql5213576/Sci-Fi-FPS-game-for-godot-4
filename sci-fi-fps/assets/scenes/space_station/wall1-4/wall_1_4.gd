extends StaticBody3D
var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var black_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-4/256/black.tres")
			var wall1_1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-4/256/wall1-1.tres")
			var wall1_2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-4/256/wall1-2.tres")
			var wall1_3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-4/256/wall1-3.tres")
			var wall1_4_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-4/256/wall1-4.tres")
			$Cube.set_surface_override_material(0,wall1_1_material)
			$Cube.set_surface_override_material(1,black_material)
			$Cube_005.set_surface_override_material(0,wall1_3_material)
			$Cube_005.set_surface_override_material(2,wall1_4_material)
			$Cube_001.set_surface_override_material(0,wall1_2_material)
		if UserData.texture_size_data==512:
			var black_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-4/512/black.tres")
			var wall1_1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-4/512/wall1-1.tres")
			var wall1_2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-4/512/wall1-2.tres")
			var wall1_3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-4/512/wall1-3.tres")
			var wall1_4_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-4/512/wall1-4.tres")
			$Cube.set_surface_override_material(0,wall1_1_material)
			$Cube.set_surface_override_material(1,black_material)
			$Cube_005.set_surface_override_material(0,wall1_3_material)
			$Cube_005.set_surface_override_material(2,wall1_4_material)
			$Cube_001.set_surface_override_material(0,wall1_2_material)
		if UserData.texture_size_data==1024:
			var black_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-4/1024/black.tres")
			var wall1_1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-4/1024/wall1-1.tres")
			var wall1_2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-4/1024/wall1-2.tres")
			var wall1_3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-4/1024/wall1-3.tres")
			var wall1_4_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-4/1024/wall1-4.tres")
			$Cube.set_surface_override_material(0,wall1_1_material)
			$Cube.set_surface_override_material(1,black_material)
			$Cube_005.set_surface_override_material(0,wall1_3_material)
			$Cube_005.set_surface_override_material(2,wall1_4_material)
			$Cube_001.set_surface_override_material(0,wall1_2_material)
		ready_to_scene=true
