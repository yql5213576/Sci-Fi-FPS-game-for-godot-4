extends Node3D
var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var snow_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/tree2/256/snow.tres")
			var tree_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/tree2/256/tree.tres")
			$tree.set_surface_override_material(0,tree_material)
			$tree/SnowBall_001.set_surface_override_material(0,snow_material)
		if UserData.texture_size_data==512:
			var snow_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/tree2/512/snow.tres")
			var tree_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/tree2/512/tree.tres")
			$tree.set_surface_override_material(0,tree_material)
			$tree/SnowBall_001.set_surface_override_material(0,snow_material)
		if UserData.texture_size_data==1024:
			var snow_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/tree2/1024/snow.tres")
			var tree_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/tree2/1024/tree.tres")
			$tree.set_surface_override_material(0,tree_material)
			$tree/SnowBall_001.set_surface_override_material(0,snow_material)
		ready_to_scene=true
