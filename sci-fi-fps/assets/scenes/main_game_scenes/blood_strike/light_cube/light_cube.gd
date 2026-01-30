extends Node3D



var ready_to_scene:bool=false
func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var light_cube1:Resource=preload("res://assets/materials_prefab/maps/blood_strike/light_cube/256/light_cube.tres")
			var light_cube2:Resource=preload("res://assets/materials_prefab/maps/blood_strike/light_cube/256/light_cube_2.tres")
			$light_cube_003.set_surface_override_material(0,light_cube1)
			$light_cube_003.set_surface_override_material(1,light_cube2)
		if UserData.texture_size_data==512:
			var light_cube1:Resource=preload("res://assets/materials_prefab/maps/blood_strike/light_cube/512/light_cube.tres")
			var light_cube2:Resource=preload("res://assets/materials_prefab/maps/blood_strike/light_cube/512/light_cube_2.tres")
			$light_cube_003.set_surface_override_material(0,light_cube1)
			$light_cube_003.set_surface_override_material(1,light_cube2)
		if UserData.texture_size_data==1024:
			var light_cube1:Resource=preload("res://assets/materials_prefab/maps/blood_strike/light_cube/1024/light_cube.tres")
			var light_cube2:Resource=preload("res://assets/materials_prefab/maps/blood_strike/light_cube/1024/light_cube_2.tres")
			$light_cube_003.set_surface_override_material(0,light_cube1)
			$light_cube_003.set_surface_override_material(1,light_cube2)
		ready_to_scene=true
