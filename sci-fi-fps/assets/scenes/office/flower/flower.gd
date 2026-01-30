extends StaticBody3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var pot_material:Resource=preload("res://assets/materials_prefab/maps/office/flower/256/pot.tres")
			var soil_material:Resource=preload("res://assets/materials_prefab/maps/office/flower/256/soil.tres")
			var tree_material:Resource=preload("res://assets/materials_prefab/maps/office/flower/256/tree.tres")
			$tree.set_surface_override_material(0,tree_material)
			$pot.set_surface_override_material(0,pot_material)
			$soil.set_surface_override_material(0,soil_material)
		if UserData.texture_size_data==512:
			var pot_material:Resource=preload("res://assets/materials_prefab/maps/office/flower/512/pot.tres")
			var soil_material:Resource=preload("res://assets/materials_prefab/maps/office/flower/512/soil.tres")
			var tree_material:Resource=preload("res://assets/materials_prefab/maps/office/flower/512/tree.tres")
			$tree.set_surface_override_material(0,tree_material)
			$pot.set_surface_override_material(0,pot_material)
			$soil.set_surface_override_material(0,soil_material)
		if UserData.texture_size_data==1024:
			var pot_material:Resource=preload("res://assets/materials_prefab/maps/office/flower/1024/pot.tres")
			var soil_material:Resource=preload("res://assets/materials_prefab/maps/office/flower/1024/soil.tres")
			var tree_material:Resource=preload("res://assets/materials_prefab/maps/office/flower/1024/tree.tres")
			$tree.set_surface_override_material(0,tree_material)
			$pot.set_surface_override_material(0,pot_material)
			$soil.set_surface_override_material(0,soil_material)
		ready_to_scene=true
