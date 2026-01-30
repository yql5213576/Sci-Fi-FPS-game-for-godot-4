extends Node3D



var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var case_material:Resource=preload("res://assets/materials_prefab/maps/office/door/256/case.tres")
			var handle_material:Resource=preload("res://assets/materials_prefab/maps/office/door/256/handle.tres")
			var lock_material:Resource=preload("res://assets/materials_prefab/maps/office/door/256/lock.tres")
			var surface_material:Resource=preload("res://assets/materials_prefab/maps/office/door/256/surface.tres")
			$door_surface.set_surface_override_material(0,surface_material)
			$door_surface/door_handle1.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_handle2.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_handle3.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_handle4.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_handle5.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_handle6.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_lock.set_surface_override_material(0,lock_material)
			$door_surface/door_handle1/door_lock/door_lock2.set_surface_override_material(0,lock_material)
			$door_case.set_surface_override_material(0,case_material)
		if UserData.texture_size_data==512:
			var case_material:Resource=preload("res://assets/materials_prefab/maps/office/door/512/case.tres")
			var handle_material:Resource=preload("res://assets/materials_prefab/maps/office/door/512/handle.tres")
			var lock_material:Resource=preload("res://assets/materials_prefab/maps/office/door/512/lock.tres")
			var surface_material:Resource=preload("res://assets/materials_prefab/maps/office/door/512/surface.tres")
			$door_surface.set_surface_override_material(0,surface_material)
			$door_surface/door_handle1.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_handle2.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_handle3.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_handle4.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_handle5.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_handle6.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_lock.set_surface_override_material(0,lock_material)
			$door_surface/door_handle1/door_lock/door_lock2.set_surface_override_material(0,lock_material)
			$door_case.set_surface_override_material(0,case_material)
		if UserData.texture_size_data==1024:
			var case_material:Resource=preload("res://assets/materials_prefab/maps/office/door/1024/case.tres")
			var handle_material:Resource=preload("res://assets/materials_prefab/maps/office/door/1024/handle.tres")
			var lock_material:Resource=preload("res://assets/materials_prefab/maps/office/door/1024/lock.tres")
			var surface_material:Resource=preload("res://assets/materials_prefab/maps/office/door/1024/surface.tres")
			$door_surface.set_surface_override_material(0,surface_material)
			$door_surface/door_handle1.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_handle2.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_handle3.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_handle4.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_handle5.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_handle6.set_surface_override_material(0,handle_material)
			$door_surface/door_handle1/door_lock.set_surface_override_material(0,lock_material)
			$door_surface/door_handle1/door_lock/door_lock2.set_surface_override_material(0,lock_material)
			$door_case.set_surface_override_material(0,case_material)
		ready_to_scene=true
