extends RigidBody3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var mw0_material:Resource=preload("res://assets/materials_prefab/maps/office/mineral_water/256/mw0.tres")
			var mw1_material:Resource=preload("res://assets/materials_prefab/maps/office/mineral_water/256/mw1.tres")
			var mw2_material:Resource=preload("res://assets/materials_prefab/maps/office/mineral_water/256/mw2.tres")
			var mw3_material:Resource=preload("res://assets/materials_prefab/maps/office/mineral_water/256/mw3.tres")
			$mineral_water.set_surface_override_material(0,mw0_material)
			$mineral_water.set_surface_override_material(1,mw1_material)
			$mineral_water.set_surface_override_material(2,mw2_material)
			$mineral_water.set_surface_override_material(3,mw3_material)
		if UserData.texture_size_data==512:
			var mw0_material:Resource=preload("res://assets/materials_prefab/maps/office/mineral_water/512/mw0.tres")
			var mw1_material:Resource=preload("res://assets/materials_prefab/maps/office/mineral_water/512/mw1.tres")
			var mw2_material:Resource=preload("res://assets/materials_prefab/maps/office/mineral_water/512/mw2.tres")
			var mw3_material:Resource=preload("res://assets/materials_prefab/maps/office/mineral_water/512/mw3.tres")
			$mineral_water.set_surface_override_material(0,mw0_material)
			$mineral_water.set_surface_override_material(1,mw1_material)
			$mineral_water.set_surface_override_material(2,mw2_material)
			$mineral_water.set_surface_override_material(3,mw3_material)
		if UserData.texture_size_data==1024:
			var mw0_material:Resource=preload("res://assets/materials_prefab/maps/office/mineral_water/1024/mw0.tres")
			var mw1_material:Resource=preload("res://assets/materials_prefab/maps/office/mineral_water/1024/mw1.tres")
			var mw2_material:Resource=preload("res://assets/materials_prefab/maps/office/mineral_water/1024/mw2.tres")
			var mw3_material:Resource=preload("res://assets/materials_prefab/maps/office/mineral_water/1024/mw3.tres")
			$mineral_water.set_surface_override_material(0,mw0_material)
			$mineral_water.set_surface_override_material(1,mw1_material)
			$mineral_water.set_surface_override_material(2,mw2_material)
			$mineral_water.set_surface_override_material(3,mw3_material)
		ready_to_scene=true
