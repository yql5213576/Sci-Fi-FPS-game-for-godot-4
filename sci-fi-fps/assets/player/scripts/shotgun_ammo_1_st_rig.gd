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
			var handle_material:Resource=preload("res://assets/materials_prefab/shotgun/ammo/256/ammo.tres")
			$ammos.set_surface_override_material(0,handle_material)
		if UserData.texture_size_data==512:
			var handle_material:Resource=preload("res://assets/materials_prefab/shotgun/ammo/512/ammo.tres")
			$ammos.set_surface_override_material(0,handle_material)
		if UserData.texture_size_data==1024:
			var handle_material:Resource=preload("res://assets/materials_prefab/shotgun/ammo/1024/ammo.tres")
			$ammos.set_surface_override_material(0,handle_material)
		ready_to_scene=true
