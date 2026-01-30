extends StaticBody3D


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var lg_material:Resource=preload("res://assets/materials_prefab/maps/space_station/levitation_globe/256/lg.tres")
			$lg.set_surface_override_material(0,lg_material)
		if UserData.texture_size_data==512:
			var lg_material:Resource=preload("res://assets/materials_prefab/maps/space_station/levitation_globe/512/lg.tres")
			$lg.set_surface_override_material(0,lg_material)
		if UserData.texture_size_data==1024:
			var lg_material:Resource=preload("res://assets/materials_prefab/maps/space_station/levitation_globe/1024/lg.tres")
			$lg.set_surface_override_material(0,lg_material)
		ready_to_scene=true
