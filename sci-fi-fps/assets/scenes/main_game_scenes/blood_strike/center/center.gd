extends StaticBody3D

var ready_to_scene:bool=false
func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var color1_color:Resource=preload("res://assets/materials_prefab/maps/blood_strike/center/256/color1.tres")
			var color2_color:Resource=preload("res://assets/materials_prefab/maps/blood_strike/center/256/color2.tres")
			$center1.set_surface_override_material(0,color1_color)
			$center1.set_surface_override_material(1,color2_color)
			$center2.set_surface_override_material(0,color2_color)
		if UserData.texture_size_data==512:
			var color1_color:Resource=preload("res://assets/materials_prefab/maps/blood_strike/center/512/color1.tres")
			var color2_color:Resource=preload("res://assets/materials_prefab/maps/blood_strike/center/512/color2.tres")
			$center1.set_surface_override_material(0,color1_color)
			$center1.set_surface_override_material(1,color2_color)
			$center2.set_surface_override_material(0,color2_color)
		if UserData.texture_size_data==1024:
			var color1_color:Resource=preload("res://assets/materials_prefab/maps/blood_strike/center/1024/color1.tres")
			var color2_color:Resource=preload("res://assets/materials_prefab/maps/blood_strike/center/1024/color2.tres")
			$center1.set_surface_override_material(0,color1_color)
			$center1.set_surface_override_material(1,color2_color)
			$center2.set_surface_override_material(0,color2_color)
		ready_to_scene=true
