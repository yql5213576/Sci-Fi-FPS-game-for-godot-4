extends Node3D
var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var rock_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/rock1/256/rock.tres")
			var snow_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/rock1/256/snow.tres")
			$Cube.set_surface_override_material(0,rock_material)
			$Cube/SnowBall_001.set_surface_override_material(0,snow_material)
		if UserData.texture_size_data==512:
			var rock_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/rock1/512/rock.tres")
			var snow_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/rock1/512/snow.tres")
			$Cube.set_surface_override_material(0,rock_material)
			$Cube/SnowBall_001.set_surface_override_material(0,snow_material)
		if UserData.texture_size_data==1024:
			var rock_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/rock1/1024/rock.tres")
			var snow_material:Resource=preload("res://assets/materials_prefab/maps/snow_basin/rock1/1024/snow.tres")
			$Cube.set_surface_override_material(0,rock_material)
			$Cube/SnowBall_001.set_surface_override_material(0,snow_material)
		ready_to_scene=true
