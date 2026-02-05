extends StaticBody3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var chair_black:Resource=preload("res://assets/materials_prefab/maps/space_station/chair/256/chair_black.tres")
			var chair_cushion:Resource=preload("res://assets/materials_prefab/maps/space_station/chair/256/chair_cushion.tres")
			var chair_main:Resource=preload("res://assets/materials_prefab/maps/space_station/chair/256/chair_main.tres")
			$Cube.set_surface_override_material(0,chair_main)
			$Cube_001.set_surface_override_material(0,chair_cushion)
			$Cube_002.set_surface_override_material(0,chair_main)
			$Cube_003.set_surface_override_material(0,chair_black)
		if UserData.texture_size_data==512:
			var chair_black:Resource=preload("res://assets/materials_prefab/maps/space_station/chair/512/chair_black.tres")
			var chair_cushion:Resource=preload("res://assets/materials_prefab/maps/space_station/chair/512/chair_cushion.tres")
			var chair_main:Resource=preload("res://assets/materials_prefab/maps/space_station/chair/512/chair_main.tres")
			$Cube.set_surface_override_material(0,chair_main)
			$Cube_001.set_surface_override_material(0,chair_cushion)
			$Cube_002.set_surface_override_material(0,chair_main)
			$Cube_003.set_surface_override_material(0,chair_black)
		if UserData.texture_size_data==1024:
			var chair_black:Resource=preload("res://assets/materials_prefab/maps/space_station/chair/1024/chair_black.tres")
			var chair_cushion:Resource=preload("res://assets/materials_prefab/maps/space_station/chair/1024/chair_cushion.tres")
			var chair_main:Resource=preload("res://assets/materials_prefab/maps/space_station/chair/1024/chair_main.tres")
			$Cube.set_surface_override_material(0,chair_main)
			$Cube_001.set_surface_override_material(0,chair_cushion)
			$Cube_002.set_surface_override_material(0,chair_main)
			$Cube_003.set_surface_override_material(0,chair_black)
		ready_to_scene=true
