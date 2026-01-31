extends RigidBody3D
var destory_timer:float=0
func _process(delta: float) -> void:
	destory_timer+=delta
	if destory_timer>=5:
		queue_free()

var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var magazine_material:Resource=preload("res://assets/materials_prefab/sniper/256/magazine.tres")
			$magazine.set_surface_override_material(0,magazine_material)
		if UserData.texture_size_data==512:
			var magazine_material:Resource=preload("res://assets/materials_prefab/sniper/512/magazine.tres")
			$magazine.set_surface_override_material(0,magazine_material)
		if UserData.texture_size_data==1024:
			var magazine_material:Resource=preload("res://assets/materials_prefab/sniper/1024/magazine.tres")
			$magazine.set_surface_override_material(0,magazine_material)
		ready_to_scene=true
