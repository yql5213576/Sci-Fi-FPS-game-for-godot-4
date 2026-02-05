extends StaticBody3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var table_0_material:Resource=preload("res://assets/materials_prefab/maps/office/table1/256/table_0.tres")
			var table_1_material:Resource=preload("res://assets/materials_prefab/maps/office/table1/256/table_1.tres")
			$table.set_surface_override_material(0,table_0_material)
			$table.set_surface_override_material(1,table_1_material)
			$table_001.set_surface_override_material(0,table_0_material)
		if UserData.texture_size_data==512:
			var table_0_material:Resource=preload("res://assets/materials_prefab/maps/office/table1/512/table_0.tres")
			var table_1_material:Resource=preload("res://assets/materials_prefab/maps/office/table1/512/table_1.tres")
			$table.set_surface_override_material(0,table_0_material)
			$table.set_surface_override_material(1,table_1_material)
			$table_001.set_surface_override_material(0,table_0_material)
		if UserData.texture_size_data==1024:
			var table_0_material:Resource=preload("res://assets/materials_prefab/maps/office/table1/1024/table_0.tres")
			var table_1_material:Resource=preload("res://assets/materials_prefab/maps/office/table1/1024/table_1.tres")
			$table.set_surface_override_material(0,table_0_material)
			$table.set_surface_override_material(1,table_1_material)
			$table_001.set_surface_override_material(0,table_0_material)
		ready_to_scene=true
