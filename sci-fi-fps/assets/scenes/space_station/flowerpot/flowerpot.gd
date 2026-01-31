extends StaticBody3D

var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var flower_pot1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/flowerpot/256/flower_pot1.tres")
			var flower_pot2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/flowerpot/256/flower_pot2.tres")
			var soil_material:Resource=preload("res://assets/materials_prefab/maps/space_station/flowerpot/256/soil.tres")
			var tree_material:Resource=preload("res://assets/materials_prefab/maps/space_station/flowerpot/256/tree.tres")
			$tree.set_surface_override_material(0,tree_material)
			$flowerpot.set_surface_override_material(0,flower_pot1_material)
			$soil.set_surface_override_material(0,soil_material)
			$flowerpot_001.set_surface_override_material(0,flower_pot2_material)
		if UserData.texture_size_data==512:
			var flower_pot1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/flowerpot/512/flower_pot1.tres")
			var flower_pot2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/flowerpot/512/flower_pot2.tres")
			var soil_material:Resource=preload("res://assets/materials_prefab/maps/space_station/flowerpot/512/soil.tres")
			var tree_material:Resource=preload("res://assets/materials_prefab/maps/space_station/flowerpot/512/tree.tres")
			$tree.set_surface_override_material(0,tree_material)
			$flowerpot.set_surface_override_material(0,flower_pot1_material)
			$soil.set_surface_override_material(0,soil_material)
			$flowerpot_001.set_surface_override_material(0,flower_pot2_material)
		if UserData.texture_size_data==1024:
			var flower_pot1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/flowerpot/1024/flower_pot1.tres")
			var flower_pot2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/flowerpot/1024/flower_pot2.tres")
			var soil_material:Resource=preload("res://assets/materials_prefab/maps/space_station/flowerpot/1024/soil.tres")
			var tree_material:Resource=preload("res://assets/materials_prefab/maps/space_station/flowerpot/1024/tree.tres")
			$tree.set_surface_override_material(0,tree_material)
			$flowerpot.set_surface_override_material(0,flower_pot1_material)
			$soil.set_surface_override_material(0,soil_material)
			$flowerpot_001.set_surface_override_material(0,flower_pot2_material)
		ready_to_scene=true
		
		
