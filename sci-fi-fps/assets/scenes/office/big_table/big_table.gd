extends StaticBody3D



var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var leg_material:Resource=preload("res://assets/materials_prefab/maps/office/big_table/256/leg.tres")
			var table_wood:Resource=preload("res://assets/materials_prefab/maps/office/big_table/256/table_wood.tres")
			$table_wood.set_surface_override_material(0,table_wood)
			$leg.set_surface_override_material(0,leg_material)
		if UserData.texture_size_data==512:
			var leg_material:Resource=preload("res://assets/materials_prefab/maps/office/big_table/512/leg.tres")
			var table_wood:Resource=preload("res://assets/materials_prefab/maps/office/big_table/512/table_wood.tres")
			$table_wood.set_surface_override_material(0,table_wood)
			$leg.set_surface_override_material(0,leg_material)
		if UserData.texture_size_data==1024:
			var leg_material:Resource=preload("res://assets/materials_prefab/maps/office/big_table/1024/leg.tres")
			var table_wood:Resource=preload("res://assets/materials_prefab/maps/office/big_table/1024/table_wood.tres")
			$table_wood.set_surface_override_material(0,table_wood)
			$leg.set_surface_override_material(0,leg_material)
		ready_to_scene=true
			
