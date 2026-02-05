extends Node3D



var ready_to_scene:bool=false
func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var stair_material:Resource=preload("res://assets/materials_prefab/maps/blood_strike/stair/256/stair.tres")
			$stair.set_surface_override_material(0,stair_material)
		if UserData.texture_size_data==512:
			var stair_material:Resource=preload("res://assets/materials_prefab/maps/blood_strike/stair/512/stair.tres")
			$stair.set_surface_override_material(0,stair_material)
		if UserData.texture_size_data==1024:
			var stair_material:Resource=preload("res://assets/materials_prefab/maps/blood_strike/stair/1024/stair.tres")
			$stair.set_surface_override_material(0,stair_material)
		ready_to_scene=true
