extends StaticBody3D

var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var black_material:Resource=preload("res://assets/materials_prefab/maps/office/gel_pen/256/black.tres")
			var nib_material:Resource=preload("res://assets/materials_prefab/maps/office/gel_pen/256/nib.tres")
			var transparent_material:Resource=preload("res://assets/materials_prefab/maps/office/gel_pen/256/transparent.tres")
			$gel_pen.set_surface_override_material(0,transparent_material)
			$gel_pen.set_surface_override_material(1,black_material)
			$gel_pen.set_surface_override_material(2,nib_material)
		if UserData.texture_size_data==512:
			var black_material:Resource=preload("res://assets/materials_prefab/maps/office/gel_pen/512/black.tres")
			var nib_material:Resource=preload("res://assets/materials_prefab/maps/office/gel_pen/512/nib.tres")
			var transparent_material:Resource=preload("res://assets/materials_prefab/maps/office/gel_pen/512/transparent.tres")
			$gel_pen.set_surface_override_material(0,transparent_material)
			$gel_pen.set_surface_override_material(1,black_material)
			$gel_pen.set_surface_override_material(2,nib_material)
		if UserData.texture_size_data==1024:
			var black_material:Resource=preload("res://assets/materials_prefab/maps/office/gel_pen/1024/black.tres")
			var nib_material:Resource=preload("res://assets/materials_prefab/maps/office/gel_pen/1024/nib.tres")
			var transparent_material:Resource=preload("res://assets/materials_prefab/maps/office/gel_pen/1024/transparent.tres")
			$gel_pen.set_surface_override_material(0,transparent_material)
			$gel_pen.set_surface_override_material(1,black_material)
			$gel_pen.set_surface_override_material(2,nib_material)
		ready_to_scene=true
