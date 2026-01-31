extends StaticBody3D



var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var material1:Resource=preload("res://assets/materials_prefab/maps/office/chair/256/chair1.tres")
			var material2:Resource=preload("res://assets/materials_prefab/maps/office/chair/256/chair2.tres")
			var material3:Resource=preload("res://assets/materials_prefab/maps/office/chair/256/chair3.tres")
			$chair_001.set_surface_override_material(0,material3)
			$chair_002.set_surface_override_material(0,material3)
			$chair_003.set_surface_override_material(0,material2)
			$chair.set_surface_override_material(0,material1)
		if UserData.texture_size_data==512:
			var material1:Resource=preload("res://assets/materials_prefab/maps/office/chair/512/chair1.tres")
			var material2:Resource=preload("res://assets/materials_prefab/maps/office/chair/512/chair2.tres")
			var material3:Resource=preload("res://assets/materials_prefab/maps/office/chair/512/chair3.tres")
			$chair_001.set_surface_override_material(0,material3)
			$chair_002.set_surface_override_material(0,material3)
			$chair_003.set_surface_override_material(0,material2)
			$chair.set_surface_override_material(0,material1)
		if UserData.texture_size_data==1024:
			var material1:Resource=preload("res://assets/materials_prefab/maps/office/chair/1024/chair1.tres")
			var material2:Resource=preload("res://assets/materials_prefab/maps/office/chair/1024/chair2.tres")
			var material3:Resource=preload("res://assets/materials_prefab/maps/office/chair/1024/chair3.tres")
			$chair_001.set_surface_override_material(0,material3)
			$chair_002.set_surface_override_material(0,material3)
			$chair_003.set_surface_override_material(0,material2)
			$chair.set_surface_override_material(0,material1)
		ready_to_scene=true
