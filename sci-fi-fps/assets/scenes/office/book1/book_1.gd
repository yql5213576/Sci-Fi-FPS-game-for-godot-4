extends Node3D



var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var book_material:Resource=preload("res://assets/materials_prefab/maps/office/book1/256/book.tres")
			$book1.set_surface_override_material(0,book_material)
		if UserData.texture_size_data==512:
			var book_material:Resource=preload("res://assets/materials_prefab/maps/office/book1/512/book.tres")
			$book1.set_surface_override_material(0,book_material)
		if UserData.texture_size_data==1024:
			var book_material:Resource=preload("res://assets/materials_prefab/maps/office/book1/1024/book.tres")
			$book1.set_surface_override_material(0,book_material)
		ready_to_scene=true
