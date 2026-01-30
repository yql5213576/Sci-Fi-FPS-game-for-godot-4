extends StaticBody3D
var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var handle_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/256/handle.tres")
			var pipeline_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/256/pipeline.tres")
			var power_box_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/256/power_box.tres")
			var wall1_1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/256/wall1-1.tres")
			var wall1_2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/256/wall1-2.tres")
			var wall1_3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/256/wall1-3.tres")
			$Cube.set_surface_override_material(0,wall1_1_material)
			$Cube.set_surface_override_material(1,wall1_2_material)
			$Cube_005.set_surface_override_material(0,wall1_3_material)
			$Cube_005.set_surface_override_material(1,wall1_3_material)
			$pipeline_001.set_surface_override_material(0,pipeline_material)
			$pipeline_002.set_surface_override_material(0,pipeline_material)
			$pipeline.set_surface_override_material(0,pipeline_material)
			$Cube_001.set_surface_override_material(0,power_box_material)
			$handle_001.set_surface_override_material(0,handle_material)
			$handle.set_surface_override_material(0,handle_material)
		if UserData.texture_size_data==512:
			var handle_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/512/handle.tres")
			var pipeline_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/512/pipeline.tres")
			var power_box_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/512/power_box.tres")
			var wall1_1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/512/wall1-1.tres")
			var wall1_2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/512/wall1-2.tres")
			var wall1_3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/512/wall1-3.tres")
			$Cube.set_surface_override_material(0,wall1_1_material)
			$Cube.set_surface_override_material(1,wall1_2_material)
			$Cube_005.set_surface_override_material(0,wall1_3_material)
			$Cube_005.set_surface_override_material(1,wall1_3_material)
			$pipeline_001.set_surface_override_material(0,pipeline_material)
			$pipeline_002.set_surface_override_material(0,pipeline_material)
			$pipeline.set_surface_override_material(0,pipeline_material)
			$Cube_001.set_surface_override_material(0,power_box_material)
			$handle_001.set_surface_override_material(0,handle_material)
			$handle.set_surface_override_material(0,handle_material)
		if UserData.texture_size_data==1024:
			var handle_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/1024/handle.tres")
			var pipeline_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/1024/pipeline.tres")
			var power_box_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/1024/power_box.tres")
			var wall1_1_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/1024/wall1-1.tres")
			var wall1_2_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/1024/wall1-2.tres")
			var wall1_3_material:Resource=preload("res://assets/materials_prefab/maps/space_station/wall1-3/1024/wall1-3.tres")
			$Cube.set_surface_override_material(0,wall1_1_material)
			$Cube.set_surface_override_material(1,wall1_2_material)
			$Cube_005.set_surface_override_material(0,wall1_3_material)
			$Cube_005.set_surface_override_material(1,wall1_3_material)
			$pipeline_001.set_surface_override_material(0,pipeline_material)
			$pipeline_002.set_surface_override_material(0,pipeline_material)
			$pipeline.set_surface_override_material(0,pipeline_material)
			$Cube_001.set_surface_override_material(0,power_box_material)
			$handle_001.set_surface_override_material(0,handle_material)
			$handle.set_surface_override_material(0,handle_material)
		ready_to_scene=true
			
			
