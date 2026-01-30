extends Node3D



var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var celling_material:Resource=preload("res://assets/materials_prefab/maps/office/office_map/celling/256/celling.tres")
			$celling.set_surface_override_material(0,celling_material)
		if UserData.texture_size_data==512:
			var celling_material:Resource=preload("res://assets/materials_prefab/maps/office/office_map/celling/512/celling.tres")
			$celling.set_surface_override_material(0,celling_material)
		if UserData.texture_size_data==1024:
			var celling_material:Resource=preload("res://assets/materials_prefab/maps/office/office_map/celling/1024/celling.tres")
			$celling.set_surface_override_material(0,celling_material)
		ready_to_scene=true
