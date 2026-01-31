extends StaticBody3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var table2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/table2/256/table2.tres")
			var table3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/table2/256/table3.tres")
			var table_material:Resource=preload("res://assets/materials_prefab/maps/space_station/table2/256/table.tres")
			$Cube.set_surface_override_material(0,table_material)
			$Cube.set_surface_override_material(1,table2_material)
			$Cube.set_surface_override_material(2,table3_material)
		if UserData.texture_size_data==512:
			var table2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/table2/512/table2.tres")
			var table3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/table2/512/table3.tres")
			var table_material:Resource=preload("res://assets/materials_prefab/maps/space_station/table2/512/table.tres")
			$Cube.set_surface_override_material(0,table_material)
			$Cube.set_surface_override_material(1,table2_material)
			$Cube.set_surface_override_material(2,table3_material)
		if UserData.texture_size_data==1024:
			var table2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/table2/1024/table2.tres")
			var table3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/table2/1024/table3.tres")
			var table_material:Resource=preload("res://assets/materials_prefab/maps/space_station/table2/1024/table.tres")
			$Cube.set_surface_override_material(0,table_material)
			$Cube.set_surface_override_material(1,table2_material)
			$Cube.set_surface_override_material(2,table3_material)
		ready_to_scene=true
