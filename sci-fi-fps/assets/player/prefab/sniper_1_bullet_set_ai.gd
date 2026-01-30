extends Node3D
var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var bullet_set_0_material:Resource=preload("res://assets/materials_prefab/sniper/256/bullet_set_0.tres")
			var bullet_set_1_material:Resource=preload("res://assets/materials_prefab/sniper/256/bullet_set_1.tres")
			var bullet_set_2_material:Resource=preload("res://assets/materials_prefab/sniper/256/bullet_set_2.tres")
			$bullet_set.set_surface_override_material(0,bullet_set_0_material)
			$bullet_set.set_surface_override_material(1,bullet_set_1_material)
			$bullet_set.set_surface_override_material(2,bullet_set_2_material)
		
		if UserData.texture_size_data==512:
			var bullet_set_0_material:Resource=preload("res://assets/materials_prefab/sniper/512/bullet_set_0.tres")
			var bullet_set_1_material:Resource=preload("res://assets/materials_prefab/sniper/512/bullet_set_1.tres")
			var bullet_set_2_material:Resource=preload("res://assets/materials_prefab/sniper/512/bullet_set_2.tres")
			$bullet_set.set_surface_override_material(0,bullet_set_0_material)
			$bullet_set.set_surface_override_material(1,bullet_set_1_material)
			$bullet_set.set_surface_override_material(2,bullet_set_2_material)
		
		if UserData.texture_size_data==1024:
			var bullet_set_0_material:Resource=preload("res://assets/materials_prefab/sniper/1024/bullet_set_0.tres")
			var bullet_set_1_material:Resource=preload("res://assets/materials_prefab/sniper/1024/bullet_set_1.tres")
			var bullet_set_2_material:Resource=preload("res://assets/materials_prefab/sniper/1024/bullet_set_2.tres")
			$bullet_set.set_surface_override_material(0,bullet_set_0_material)
			$bullet_set.set_surface_override_material(1,bullet_set_1_material)
			$bullet_set.set_surface_override_material(2,bullet_set_2_material)
		ready_to_scene=true
