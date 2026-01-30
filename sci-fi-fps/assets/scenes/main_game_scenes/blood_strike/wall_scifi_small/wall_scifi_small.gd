extends StaticBody3D


var ready_to_scene:bool=false
func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var color1_material:Resource=preload("res://assets/materials_prefab/maps/blood_strike/wall_scifi_small/256/color1.tres")
			var color2_material:Resource=preload("res://assets/materials_prefab/maps/blood_strike/wall_scifi_small/256/color2.tres")
			$Cube.set_surface_override_material(0,color1_material)
			$"立方体".set_surface_override_material(0,color1_material)
			$"立方体".set_surface_override_material(1,color2_material)
			$"立方体_001".set_surface_override_material(0,color1_material)
			$"立方体_001".set_surface_override_material(1,color1_material)
			$"柱体_007".set_surface_override_material(0,color2_material)
			$"立方体_002".set_surface_override_material(0,color2_material)
			$"立方体_003".set_surface_override_material(0,color2_material)
			$"立方体_004".set_surface_override_material(0,color2_material)
		if UserData.texture_size_data==512:
			var color1_material:Resource=preload("res://assets/materials_prefab/maps/blood_strike/wall_scifi_small/512/color1.tres")
			var color2_material:Resource=preload("res://assets/materials_prefab/maps/blood_strike/wall_scifi_small/512/color2.tres")
			$Cube.set_surface_override_material(0,color1_material)
			$"立方体".set_surface_override_material(0,color1_material)
			$"立方体".set_surface_override_material(1,color2_material)
			$"立方体_001".set_surface_override_material(0,color1_material)
			$"立方体_001".set_surface_override_material(1,color1_material)
			$"柱体_007".set_surface_override_material(0,color2_material)
			$"立方体_002".set_surface_override_material(0,color2_material)
			$"立方体_003".set_surface_override_material(0,color2_material)
			$"立方体_004".set_surface_override_material(0,color2_material)
		if UserData.texture_size_data==1024:
			var color1_material:Resource=preload("res://assets/materials_prefab/maps/blood_strike/wall_scifi_small/1024/color1.tres")
			var color2_material:Resource=preload("res://assets/materials_prefab/maps/blood_strike/wall_scifi_small/1024/color2.tres")
			$Cube.set_surface_override_material(0,color1_material)
			$"立方体".set_surface_override_material(0,color1_material)
			$"立方体".set_surface_override_material(1,color2_material)
			$"立方体_001".set_surface_override_material(0,color1_material)
			$"立方体_001".set_surface_override_material(1,color1_material)
			$"柱体_007".set_surface_override_material(0,color2_material)
			$"立方体_002".set_surface_override_material(0,color2_material)
			$"立方体_003".set_surface_override_material(0,color2_material)
			$"立方体_004".set_surface_override_material(0,color2_material)
		ready_to_scene=true
