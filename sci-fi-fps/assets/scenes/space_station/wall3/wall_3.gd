extends StaticBody3D
var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var wall_3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall3/256/wall3.tres")
			$Cube_005.set_surface_override_material(0,wall_3_material)
		if UserData.texture_size_data==512:
			var wall_3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall3/512/wall3.tres")
			$Cube_005.set_surface_override_material(0,wall_3_material)
		if UserData.texture_size_data==1024:
			var wall_3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall3/1024/wall3.tres")
			$Cube_005.set_surface_override_material(0,wall_3_material)
		ready_to_scene=true
			
			
			
