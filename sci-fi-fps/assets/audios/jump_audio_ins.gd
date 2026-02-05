extends Node3D
func move_audio_anim_event():
	var audio_jump:Resource=preload("res://assets/audios/jump_audio.tscn")
	var aj:Node=audio_jump.instantiate()
	aj.position=self.global_position
	$"..".player_master.scene_root.add_child(aj)
