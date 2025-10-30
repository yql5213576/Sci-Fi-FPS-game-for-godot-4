extends Camera3D
var movespeed=10
var mouse_speed=0.1
func _input(event: InputEvent) -> void:
	Input.set_mouse_mode(2)
	if event is InputEventMouseMotion:
		self.rotation_degrees.y-=event.relative.x*mouse_speed
		self.rotation_degrees.x-=event.relative.y*mouse_speed

#func _physics_process(delta: float) -> void:
	#if Input.is_action_pressed("F"):
		#translate(Vector3(0,0,-movespeed*delta))
	#if Input.is_action_pressed("B"):
		#translate(Vector3(0,0,movespeed*delta))
	#if Input.is_action_pressed("L"):
		#translate(Vector3(-movespeed*delta,0,0))
	#if Input.is_action_pressed("R"):
		#translate(Vector3(movespeed*delta,0,0))
	#if Input.is_action_pressed("U"):
		#translate(Vector3(0,movespeed*delta,0))
	#if Input.is_action_pressed("D"):
		#translate(Vector3(0,-movespeed*delta,0))
	#if Input.is_action_just_pressed("quit"):
		#get_tree().quit()
	#if Input.is_action_pressed("speed_up"):
		#movespeed=20
	#else:
		#movespeed=10
