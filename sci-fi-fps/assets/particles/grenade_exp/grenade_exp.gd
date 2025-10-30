extends Node3D
var scene_root=null
var player_master=null
var damage1=100
var damage2=100
var damage3=60
func _ready() -> void:
	$smoke2.restart()
	$fire_sm.restart()
	$fire2.restart()
	#$smoke2.emitting=true
	#$fire_sm.emitting=true
	#$fire2.emitting=true
var a=false
func _on_smoke_2_finished() -> void:
	a=true
#
var b=false
func _on_fire_sm_finished() -> void:
	b=true
#
var c=false
func _on_fire_2_finished() -> void:
	c=true

var timer=0
func _physics_process(delta: float) -> void:
	timer+=delta
	if a:
		if b:
			if c:
				if d:
					queue_free()
	#timer+=delta
	#if timer>=1.5:
		#if a:
			#if b:
				#if c:
					#print("test")
					#$smoke2.restart()
					#$fire_sm.restart()
					#$fire2.restart()
					#a=false
					#b=false
					#c=false
					#timer=0

var d=false
func _on_exp_audio_finished() -> void:
	d=true

var area1_lock=false
func _on_area_3d_1_body_entered(body: Node3D) -> void:
	if timer<0.01:
		if area1_lock==false:
			if body.has_method("hit_loss_health_event"):
				body.hit_loss_health_event(damage1)
				body.murderer=player_master
				area1_lock=true
		

var area2_lock=false
func _on_area_3d_2_body_entered(body: Node3D) -> void:
	if timer<0.01:
		if area2_lock==false:
			if body.has_method("hit_loss_health_event"):
				body.hit_loss_health_event(damage2)
				body.murderer=player_master
				area2_lock=true
	

var area3_lock=false
func _on_area_3d_3_body_entered(body: Node3D) -> void:
	if timer<0.01:
		if area3_lock==false:
			if body.has_method("hit_loss_health_event"):
				body.hit_loss_health_event(damage3)
				body.murderer=player_master
				area3_lock=true
	
