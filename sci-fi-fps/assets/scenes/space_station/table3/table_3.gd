extends StaticBody3D
var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var table_2:Resource=preload("res://assets/materials_prefab/maps/space_station/table3/256/table001.tres")
			var table_1:Resource=preload("res://assets/materials_prefab/maps/space_station/table3/256/table.tres")
			$table_001.set_surface_override_material(0,table_2)
			$table_001.set_surface_override_material(1,table_1)
		if UserData.texture_size_data==512:
			var table_2:Resource=preload("res://assets/materials_prefab/maps/space_station/table3/512/table001.tres")
			var table_1:Resource=preload("res://assets/materials_prefab/maps/space_station/table3/512/table.tres")
			$table_001.set_surface_override_material(0,table_2)
			$table_001.set_surface_override_material(1,table_1)
		if UserData.texture_size_data==1024:
			var table_2:Resource=preload("res://assets/materials_prefab/maps/space_station/table3/1024/table001.tres")
			var table_1:Resource=preload("res://assets/materials_prefab/maps/space_station/table3/1024/table.tres")
			$table_001.set_surface_override_material(0,table_2)
			$table_001.set_surface_override_material(1,table_1)
		ready_to_scene=true
			
			
