extends Node3D
var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	rotation_degrees.y+=3

	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var ice_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/ice/256/ice.tres")
			$ice.set_surface_override_material(0,ice_material)
		if UserData.texture_size_data==512:
			var ice_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/ice/512/ice.tres")
			$ice.set_surface_override_material(0,ice_material)
		if UserData.texture_size_data==1024:
			var ice_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/ice/1024/ice.tres")
			$ice.set_surface_override_material(0,ice_material)
		ready_to_scene=true
