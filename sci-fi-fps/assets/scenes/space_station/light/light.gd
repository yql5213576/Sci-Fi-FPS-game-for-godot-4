extends StaticBody3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var cube_material:Resource=preload("res://assets/materials_prefab/maps/space_station/light/256/cube.tres")
			$Cube.set_surface_override_material(0,cube_material)
		if UserData.texture_size_data==512:
			var cube_material:Resource=preload("res://assets/materials_prefab/maps/space_station/light/512/cube.tres")
			$Cube.set_surface_override_material(0,cube_material)
		if UserData.texture_size_data==1024:
			var cube_material:Resource=preload("res://assets/materials_prefab/maps/space_station/light/1024/cube.tres")
			$Cube.set_surface_override_material(0,cube_material)
		ready_to_scene=true
