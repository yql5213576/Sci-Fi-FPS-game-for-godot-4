extends StaticBody3D



var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var drawer_material:Resource=preload("res://assets/materials_prefab/maps/office/office_boss_table/256/drawer.tres")
			var lock_material:Resource=preload("res://assets/materials_prefab/maps/office/office_boss_table/256/lock.tres")
			var table_material:Resource=preload("res://assets/materials_prefab/maps/office/office_boss_table/256/table.tres")
			$table.set_surface_override_material(0,table_material)
			$drawer.set_surface_override_material(0,drawer_material)
			$lock.set_surface_override_material(0,lock_material)
		if UserData.texture_size_data==512:
			var drawer_material:Resource=preload("res://assets/materials_prefab/maps/office/office_boss_table/512/drawer.tres")
			var lock_material:Resource=preload("res://assets/materials_prefab/maps/office/office_boss_table/512/lock.tres")
			var table_material:Resource=preload("res://assets/materials_prefab/maps/office/office_boss_table/512/table.tres")
			$table.set_surface_override_material(0,table_material)
			$drawer.set_surface_override_material(0,drawer_material)
			$lock.set_surface_override_material(0,lock_material)
		if UserData.texture_size_data==1024:
			var drawer_material:Resource=preload("res://assets/materials_prefab/maps/office/office_boss_table/1024/drawer.tres")
			var lock_material:Resource=preload("res://assets/materials_prefab/maps/office/office_boss_table/1024/lock.tres")
			var table_material:Resource=preload("res://assets/materials_prefab/maps/office/office_boss_table/1024/table.tres")
			$table.set_surface_override_material(0,table_material)
			$drawer.set_surface_override_material(0,drawer_material)
			$lock.set_surface_override_material(0,lock_material)
		ready_to_scene=true
