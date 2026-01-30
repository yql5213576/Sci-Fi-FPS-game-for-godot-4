extends RigidBody3D

var destory_timer:int=0
func _process(delta: float) -> void:
	destory_timer+=delta
	if destory_timer>=5:
		queue_free()


var ready_to_scene:bool=false
func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var magazine:Resource=preload("res://assets/materials_prefab/pistol/256/magazine.tres")
			$magazine.set_surface_override_material(0,magazine)
		if UserData.texture_size_data==512:
			var magazine:Resource=preload("res://assets/materials_prefab/pistol/512/magazine.tres")
			$magazine.set_surface_override_material(0,magazine)
		if UserData.texture_size_data==1024:
			var magazine:Resource=preload("res://assets/materials_prefab/pistol/1024/magazine.tres")
			$magazine.set_surface_override_material(0,magazine)
		ready_to_scene=true
