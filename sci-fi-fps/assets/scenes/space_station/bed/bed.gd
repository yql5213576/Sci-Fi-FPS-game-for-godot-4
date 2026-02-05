extends StaticBody3D

var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var bed2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/256/bed2.tres")
			var bed_main_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/256/bed_main.tres")
			var mattress2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/256/mattress2.tres")
			var mattress_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/256/mattress.tres")
			var pillow_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/256/pillow.tres")
			var quilt_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/256/quilt.tres")
			$bad.set_surface_override_material(0,bed_main_material)
			$bad.set_surface_override_material(1,bed2_material)
			$pillow.set_surface_override_material(0,pillow_material)
			$mattress.set_surface_override_material(0,mattress_material)
			$bad_001.set_surface_override_material(0,mattress_material)
			$bad_001.set_surface_override_material(1,mattress2_material)
			$quilt.set_surface_override_material(0,quilt_material)
			$pillow_001.set_surface_override_material(0,pillow_material)
		if UserData.texture_size_data==512:
			var bed2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/512/bed2.tres")
			var bed_main_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/512/bed_main.tres")
			var mattress2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/512/mattress2.tres")
			var mattress_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/512/mattress.tres")
			var pillow_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/512/pillow.tres")
			var quilt_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/512/quilt.tres")
			$bad.set_surface_override_material(0,bed_main_material)
			$bad.set_surface_override_material(1,bed2_material)
			$pillow.set_surface_override_material(0,pillow_material)
			$mattress.set_surface_override_material(0,mattress_material)
			$bad_001.set_surface_override_material(0,mattress_material)
			$bad_001.set_surface_override_material(1,mattress2_material)
			$quilt.set_surface_override_material(0,quilt_material)
			$pillow_001.set_surface_override_material(0,pillow_material)
		if UserData.texture_size_data==1024:
			var bed2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/1024/bed2.tres")
			var bed_main_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/1024/bed_main.tres")
			var mattress2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/1024/mattress2.tres")
			var mattress_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/1024/mattress.tres")
			var pillow_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/1024/pillow.tres")
			var quilt_material:Resource=preload("res://assets/materials_prefab/maps/space_station/bed/1024/quilt.tres")
			$bad.set_surface_override_material(0,bed_main_material)
			$bad.set_surface_override_material(1,bed2_material)
			$pillow.set_surface_override_material(0,pillow_material)
			$mattress.set_surface_override_material(0,mattress_material)
			$bad_001.set_surface_override_material(0,mattress_material)
			$bad_001.set_surface_override_material(1,mattress2_material)
			$quilt.set_surface_override_material(0,quilt_material)
			$pillow_001.set_surface_override_material(0,pillow_material)
		ready_to_scene=true
