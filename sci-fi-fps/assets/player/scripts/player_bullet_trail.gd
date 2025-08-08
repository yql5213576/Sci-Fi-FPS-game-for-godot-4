extends Node3D
var _speed=1000
func _physics_process(delta: float) -> void:
	translate(Vector3(0,0,_speed))
