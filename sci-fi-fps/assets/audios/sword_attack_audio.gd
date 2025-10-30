extends Node3D
var audio_id=[0,1,2]
var timer=0




func _physics_process(delta: float) -> void:
	timer+=delta
	if timer>2:
		queue_free()
