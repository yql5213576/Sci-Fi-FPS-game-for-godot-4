extends StaticBody3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var table1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/table/256/table1.tres")
			var table2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/table/256/table2.tres")
			$table_002.set_surface_override_material(0,table1_material)
			$table.set_surface_override_material(0,table2_material)
			$table_003.set_surface_override_material(0,table1_material)
			$table_003.set_surface_override_material(0,table2_material)
			$table_004.set_surface_override_material(0,table2_material)
		if UserData.texture_size_data==512:
			var table1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/table/512/table1.tres")
			var table2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/table/512/table2.tres")
			$table_002.set_surface_override_material(0,table1_material)
			$table.set_surface_override_material(0,table2_material)
			$table_003.set_surface_override_material(0,table1_material)
			$table_003.set_surface_override_material(0,table2_material)
			$table_004.set_surface_override_material(0,table2_material)
		if UserData.texture_size_data==1024:
			var table1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/table/1024/table1.tres")
			var table2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/table/1024/table2.tres")
			$table_002.set_surface_override_material(0,table1_material)
			$table.set_surface_override_material(0,table2_material)
			$table_003.set_surface_override_material(0,table1_material)
			$table_003.set_surface_override_material(0,table2_material)
			$table_004.set_surface_override_material(0,table2_material)
		ready_to_scene=true
