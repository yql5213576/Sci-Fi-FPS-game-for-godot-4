extends StaticBody3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var pencel_0_material:Resource=preload("res://assets/materials_prefab/maps/office/pencil/256/pencel_0.tres")
			var pencel_1_material:Resource=preload("res://assets/materials_prefab/maps/office/pencil/256/pencel_1.tres")
			$pencil.set_surface_override_material(0,pencel_0_material)
			$pencil.set_surface_override_material(1,pencel_1_material)
		if UserData.texture_size_data==512:
			var pencel_0_material:Resource=preload("res://assets/materials_prefab/maps/office/pencil/512/pencel_0.tres")
			var pencel_1_material:Resource=preload("res://assets/materials_prefab/maps/office/pencil/512/pencel_1.tres")
			$pencil.set_surface_override_material(0,pencel_0_material)
			$pencil.set_surface_override_material(1,pencel_1_material)
		if UserData.texture_size_data==1024:
			var pencel_0_material:Resource=preload("res://assets/materials_prefab/maps/office/pencil/1024/pencel_0.tres")
			var pencel_1_material:Resource=preload("res://assets/materials_prefab/maps/office/pencil/1024/pencel_1.tres")
			$pencil.set_surface_override_material(0,pencel_0_material)
			$pencil.set_surface_override_material(1,pencel_1_material)
		ready_to_scene=true
