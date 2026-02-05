extends Node3D



var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var stair_material:Resource=preload("res://assets/materials_prefab/maps/office/stair/256/stair1.tres")
			var stair2_material:Resource=preload("res://assets/materials_prefab/maps/office/stair/256/stair2.tres")
			$stair.set_surface_override_material(0,stair_material)
			$stair2.set_surface_override_material(0,stair2_material)
		if UserData.texture_size_data==512:
			var stair_material:Resource=preload("res://assets/materials_prefab/maps/office/stair/512/stair1.tres")
			var stair2_material:Resource=preload("res://assets/materials_prefab/maps/office/stair/512/stair2.tres")
			$stair.set_surface_override_material(0,stair_material)
			$stair2.set_surface_override_material(0,stair2_material)
		if UserData.texture_size_data==1024:
			var stair_material:Resource=preload("res://assets/materials_prefab/maps/office/stair/1024/stair1.tres")
			var stair2_material:Resource=preload("res://assets/materials_prefab/maps/office/stair/1024/stair2.tres")
			$stair.set_surface_override_material(0,stair_material)
			$stair2.set_surface_override_material(0,stair2_material)
		ready_to_scene=true
