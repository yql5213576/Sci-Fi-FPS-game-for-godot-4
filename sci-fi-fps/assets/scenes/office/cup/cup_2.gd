extends StaticBody3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var cup_material:Resource=preload("res://assets/materials_prefab/maps/office/cup/256/cup.tres")
			$cup.set_surface_override_material(0,cup_material)
		if UserData.texture_size_data==512:
			var cup_material:Resource=preload("res://assets/materials_prefab/maps/office/cup/512/cup.tres")
			$cup.set_surface_override_material(0,cup_material)
		if UserData.texture_size_data==1024:
			var cup_material:Resource=preload("res://assets/materials_prefab/maps/office/cup/1024/cup.tres")
			$cup.set_surface_override_material(0,cup_material)
		ready_to_scene=true
