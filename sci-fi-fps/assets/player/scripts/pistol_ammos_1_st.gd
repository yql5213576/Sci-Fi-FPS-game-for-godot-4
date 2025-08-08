extends Node3D
var speed=0
var trail=null
func _physics_process(delta: float) -> void:
	translate(Vector3(0,0,speed*delta))
	if trail!=null:
		look_at(trail.global_position,Vector3.UP,true)
