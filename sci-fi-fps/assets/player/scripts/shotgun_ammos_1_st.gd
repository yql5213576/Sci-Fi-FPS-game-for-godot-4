extends Node3D
var speed=10
var trail=null
var timer=0

func _physics_process(delta: float) -> void:
	timer+=delta
	if timer>=5:
		queue_free()
	#translate(Vector3(0,0,speed*delta))
	$ammo_center.translate(Vector3(0,0,speed))
	$ammo_rd.translate(Vector3(0,0,speed))
	$ammo_ru.translate(Vector3(0,0,speed))
	$ammo_ld.translate(Vector3(0,0,speed))
	$ammo_lu.translate(Vector3(0,0,speed))
	$ammo_left.translate(Vector3(0,0,speed))
	$ammo_right.translate(Vector3(0,0,speed))
	$ammo_up.translate(Vector3(0,0,speed))
	$ammo_down.translate(Vector3(0,0,speed))


	if trail!=null:
		look_at(trail.global_position,Vector3.UP,true)
