extends StaticBody3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var blue_material:Resource=preload("res://assets/materials_prefab/maps/office/water_dispenser/256/blue.tres")
			var switch_material:Resource=preload("res://assets/materials_prefab/maps/office/water_dispenser/256/switch.tres")
			var water_material:Resource=preload("res://assets/materials_prefab/maps/office/water_dispenser/256/water.tres")
			var white_material:Resource=preload("res://assets/materials_prefab/maps/office/water_dispenser/256/white.tres")
			$wd.set_surface_override_material(0,white_material)
			$wd.set_surface_override_material(1,blue_material)
			$water.set_surface_override_material(0,water_material)
			$switch.set_surface_override_material(0,switch_material)
			$wd_door.set_surface_override_material(0,white_material)
		if UserData.texture_size_data==512:
			var blue_material:Resource=preload("res://assets/materials_prefab/maps/office/water_dispenser/512/blue.tres")
			var switch_material:Resource=preload("res://assets/materials_prefab/maps/office/water_dispenser/512/switch.tres")
			var water_material:Resource=preload("res://assets/materials_prefab/maps/office/water_dispenser/512/water.tres")
			var white_material:Resource=preload("res://assets/materials_prefab/maps/office/water_dispenser/512/white.tres")
			$wd.set_surface_override_material(0,white_material)
			$wd.set_surface_override_material(1,blue_material)
			$water.set_surface_override_material(0,water_material)
			$switch.set_surface_override_material(0,switch_material)
			$wd_door.set_surface_override_material(0,white_material)
		if UserData.texture_size_data==1024:
			var blue_material:Resource=preload("res://assets/materials_prefab/maps/office/water_dispenser/1024/blue.tres")
			var switch_material:Resource=preload("res://assets/materials_prefab/maps/office/water_dispenser/1024/switch.tres")
			var water_material:Resource=preload("res://assets/materials_prefab/maps/office/water_dispenser/1024/water.tres")
			var white_material:Resource=preload("res://assets/materials_prefab/maps/office/water_dispenser/1024/white.tres")
			$wd.set_surface_override_material(0,white_material)
			$wd.set_surface_override_material(1,blue_material)
			$water.set_surface_override_material(0,water_material)
			$switch.set_surface_override_material(0,switch_material)
			$wd_door.set_surface_override_material(0,white_material)
		ready_to_scene=true
