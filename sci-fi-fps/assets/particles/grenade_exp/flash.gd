extends Node3D
var scene_root:Node=null
var player_master:Node=null
func _ready() -> void: 
	$fire_sm.restart()
	
var a:bool=false
func _on_fire_sm_finished() -> void:
	a=true

var b:bool=false
func _on_exp_audio_finished() -> void:
	b=true
var flash_ready:bool=false
func _physics_process(delta: float) -> void:
	if flash_ready==false:
		if $Area3D.has_overlapping_bodies():
			for flash in $Area3D.get_overlapping_bodies():
				if flash.has_method("flash_my_eyes"):
					flash.flash_my_eyes()
					
		var flash_audio_scene:Resource=preload("res://assets/audios/flash_audio.tscn").duplicate()
		var fa:Node=flash_audio_scene.instantiate()
		fa.position=self.global_position
		scene_root.add_child(fa)
		flash_ready=true
	if a:
		if b:
			queue_free()
