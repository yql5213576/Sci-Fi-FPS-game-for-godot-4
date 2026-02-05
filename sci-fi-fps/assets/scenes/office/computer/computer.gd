extends Node3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var head_material:Resource=preload("res://assets/materials_prefab/maps/office/computer/256/head.tres")
			var key_board_material:Resource=preload("res://assets/materials_prefab/maps/office/computer/256/key_board.tres")
			$keyboard.set_surface_override_material(0,key_board_material)
			$screen.set_surface_override_material(0,head_material)
		if UserData.texture_size_data==512:
			var head_material:Resource=preload("res://assets/materials_prefab/maps/office/computer/512/head.tres")
			var key_board_material:Resource=preload("res://assets/materials_prefab/maps/office/computer/512/key_board.tres")
			$keyboard.set_surface_override_material(0,key_board_material)
			$screen.set_surface_override_material(0,head_material)
		if UserData.texture_size_data==1024:
			var head_material:Resource=preload("res://assets/materials_prefab/maps/office/computer/1024/head.tres")
			var key_board_material:Resource=preload("res://assets/materials_prefab/maps/office/computer/1024/key_board.tres")
			$keyboard.set_surface_override_material(0,key_board_material)
			$screen.set_surface_override_material(0,head_material)
		ready_to_scene=true
