extends AudioStreamPlayer3D
func _physics_process(delta: float) -> void:
	self.volume_db=Vector2(volume_db,0).lerp(Vector2(-80,0),0.001).x
	
	if self.volume_db<=-75:
		queue_free()
