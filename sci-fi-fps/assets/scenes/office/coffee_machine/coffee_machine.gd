extends StaticBody3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var machine1:Resource=preload("res://assets/materials_prefab/maps/office/coffee_machine/256/machine1.tres")
			var machine2:Resource=preload("res://assets/materials_prefab/maps/office/coffee_machine/256/machine2.tres")
			var machine3:Resource=preload("res://assets/materials_prefab/maps/office/coffee_machine/256/machine3.tres")
			var machine4:Resource=preload("res://assets/materials_prefab/maps/office/coffee_machine/256/machine4.tres")
			$coffee_machine1.set_surface_override_material(0,machine1)
			$coffee_machine1.set_surface_override_material(1,machine4)
			$coffee_machine2.set_surface_override_material(0,machine2)
			$coffee_machine3.set_surface_override_material(0,machine3)
		if UserData.texture_size_data==512:
			var machine1:Resource=preload("res://assets/materials_prefab/maps/office/coffee_machine/512/machine1.tres")
			var machine2:Resource=preload("res://assets/materials_prefab/maps/office/coffee_machine/512/machine2.tres")
			var machine3:Resource=preload("res://assets/materials_prefab/maps/office/coffee_machine/512/machine3.tres")
			var machine4:Resource=preload("res://assets/materials_prefab/maps/office/coffee_machine/512/machine4.tres")
			$coffee_machine1.set_surface_override_material(0,machine1)
			$coffee_machine1.set_surface_override_material(1,machine4)
			$coffee_machine2.set_surface_override_material(0,machine2)
			$coffee_machine3.set_surface_override_material(0,machine3)
		if UserData.texture_size_data==1024:
			var machine1:Resource=preload("res://assets/materials_prefab/maps/office/coffee_machine/1024/machine1.tres")
			var machine2:Resource=preload("res://assets/materials_prefab/maps/office/coffee_machine/1024/machine2.tres")
			var machine3:Resource=preload("res://assets/materials_prefab/maps/office/coffee_machine/1024/machine3.tres")
			var machine4:Resource=preload("res://assets/materials_prefab/maps/office/coffee_machine/1024/machine4.tres")
			$coffee_machine1.set_surface_override_material(0,machine1)
			$coffee_machine1.set_surface_override_material(1,machine4)
			$coffee_machine2.set_surface_override_material(0,machine2)
			$coffee_machine3.set_surface_override_material(0,machine3)
		ready_to_scene=true
