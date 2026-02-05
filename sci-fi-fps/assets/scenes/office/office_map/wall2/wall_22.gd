extends Node3D

var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var wall2_material:Resource=preload("res://assets/materials_prefab/maps/office/office_map/wall2/256/wall2.tres")
			$wall2.set_surface_override_material(0,wall2_material)
		if UserData.texture_size_data==512:
			var wall2_material:Resource=preload("res://assets/materials_prefab/maps/office/office_map/wall2/512/wall2.tres")
			$wall2.set_surface_override_material(0,wall2_material)
		if UserData.texture_size_data==1024:
			var wall2_material:Resource=preload("res://assets/materials_prefab/maps/office/office_map/wall2/1024/wall2.tres")
			$wall2.set_surface_override_material(0,wall2_material)
		ready_to_scene=true
