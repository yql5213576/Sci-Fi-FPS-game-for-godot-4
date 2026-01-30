extends StaticBody3D
var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var wall_2_1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall2/256/wall2-1.tres") 
			var wall_2_2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall2/256/wall2-2.tres")
			$Cube.set_surface_override_material(0,wall_2_2_material)
			$Cube_005.set_surface_override_material(0,wall_2_1_material)
		if UserData.texture_size_data==512:
			var wall_2_1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall2/512/wall2-1.tres") 
			var wall_2_2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall2/512/wall2-2.tres")
			$Cube.set_surface_override_material(0,wall_2_2_material)
			$Cube_005.set_surface_override_material(0,wall_2_1_material)
		if UserData.texture_size_data==1024:
			var wall_2_1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall2/1024/wall2-1.tres") 
			var wall_2_2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall2/1024/wall2-2.tres")
			$Cube.set_surface_override_material(0,wall_2_2_material)
			$Cube_005.set_surface_override_material(0,wall_2_1_material)
		ready_to_scene=true
			
			
			 
