extends StaticBody3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var handrail_material:Resource=preload("res://assets/materials_prefab/maps/office/chair2/256/handrail.tres")
			var leg1_material:Resource=preload("res://assets/materials_prefab/maps/office/chair2/256/leg1.tres")
			var leg2_material:Resource=preload("res://assets/materials_prefab/maps/office/chair2/256/leg2.tres")
			var sofa_material:Resource=preload("res://assets/materials_prefab/maps/office/chair2/256/sofa.tres")
			$sofa.set_surface_override_material(0,sofa_material)
			$leg1.set_surface_override_material(0,leg1_material)
			$handrail.set_surface_override_material(0,handrail_material)
			$leg2.set_surface_override_material(0,leg2_material)
		if UserData.texture_size_data==512:
			var handrail_material:Resource=preload("res://assets/materials_prefab/maps/office/chair2/512/handrail.tres")
			var leg1_material:Resource=preload("res://assets/materials_prefab/maps/office/chair2/512/leg1.tres")
			var leg2_material:Resource=preload("res://assets/materials_prefab/maps/office/chair2/512/leg2.tres")
			var sofa_material:Resource=preload("res://assets/materials_prefab/maps/office/chair2/512/sofa.tres")
			$sofa.set_surface_override_material(0,sofa_material)
			$leg1.set_surface_override_material(0,leg1_material)
			$handrail.set_surface_override_material(0,handrail_material)
			$leg2.set_surface_override_material(0,leg2_material)
		if UserData.texture_size_data==1024:
			var handrail_material:Resource=preload("res://assets/materials_prefab/maps/office/chair2/1024/handrail.tres")
			var leg1_material:Resource=preload("res://assets/materials_prefab/maps/office/chair2/1024/leg1.tres")
			var leg2_material:Resource=preload("res://assets/materials_prefab/maps/office/chair2/1024/leg2.tres")
			var sofa_material:Resource=preload("res://assets/materials_prefab/maps/office/chair2/1024/sofa.tres")
			$sofa.set_surface_override_material(0,sofa_material)
			$leg1.set_surface_override_material(0,leg1_material)
			$handrail.set_surface_override_material(0,handrail_material)
			$leg2.set_surface_override_material(0,leg2_material)
		ready_to_scene=true
