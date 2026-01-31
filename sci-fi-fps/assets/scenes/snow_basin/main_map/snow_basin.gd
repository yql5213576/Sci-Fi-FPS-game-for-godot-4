extends Node3D
var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var terrain_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/main_map/256/terrain.tres")
			$terrain.set_surface_override_material(0,terrain_material)
		if UserData.texture_size_data==512:
			var terrain_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/main_map/512/terrain.tres")
			$terrain.set_surface_override_material(0,terrain_material)
		if UserData.texture_size_data==1024:
			var terrain_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/main_map/1024/terrain.tres")
			$terrain.set_surface_override_material(0,terrain_material)
		ready_to_scene=true
