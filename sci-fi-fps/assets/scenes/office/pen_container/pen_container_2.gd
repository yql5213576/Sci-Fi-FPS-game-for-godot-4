extends StaticBody3D



var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var pen_container_material:Resource=preload("res://assets/materials_prefab/maps/office/pen_container/256/pen_container.tres")
			$pen_container.set_surface_override_material(0,pen_container_material)
		if UserData.texture_size_data==512:
			var pen_container_material:Resource=preload("res://assets/materials_prefab/maps/office/pen_container/512/pen_container.tres")
			$pen_container.set_surface_override_material(0,pen_container_material)
		if UserData.texture_size_data==1024:
			var pen_container_material:Resource=preload("res://assets/materials_prefab/maps/office/pen_container/1024/pen_container.tres")
			$pen_container.set_surface_override_material(0,pen_container_material)
		ready_to_scene=true
