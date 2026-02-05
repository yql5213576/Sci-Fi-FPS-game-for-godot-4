extends StaticBody3D



var ready_to_scene:bool=false
func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var ground_material:Resource=preload("res://assets/materials_prefab/maps/blood_strike/ground/256/ground.tres")
			$ground.set_surface_override_material(0,ground_material)
		if UserData.texture_size_data==512:
			var ground_material:Resource=preload("res://assets/materials_prefab/maps/blood_strike/ground/512/ground.tres")
			$ground.set_surface_override_material(0,ground_material)
		if UserData.texture_size_data==1024:
			var ground_material:Resource=preload("res://assets/materials_prefab/maps/blood_strike/ground/1024/ground.tres")
			$ground.set_surface_override_material(0,ground_material)
		ready_to_scene=true
