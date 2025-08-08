extends RigidBody3D
var destory_timer=0
func _process(delta: float) -> void:
	destory_timer+=delta
	if destory_timer>=5:
		queue_free()
