extends Node3D
var audio_id:Array[int]=[0,1,2]
var timer:float=0




func _physics_process(delta: float) -> void:
	timer+=delta
	if timer>2:
		queue_free()
