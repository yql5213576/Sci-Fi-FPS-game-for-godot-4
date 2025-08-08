extends Node3D
func move_audio_anim_event():
	if $"../AnimationPlayer/AnimationTree"["parameters/move/blend_position"]>0.9||$"../AnimationPlayer/AnimationTree"["parameters/run/blend_amount"]>0.9:
		var audio_walk=preload("res://assets/audios/walk_audio.tscn")
		var aw=audio_walk.instantiate()
		aw.position=self.global_position
		$"..".player_master.scene_root.add_child(aw)
func move_audio_anim_event_ai():
	if (($"../AnimationPlayer/AnimationTree"["parameters/move/blend_position"].x>0.9)||($"../AnimationPlayer/AnimationTree"["parameters/move/blend_position"].y>0.9))||$"../AnimationPlayer/AnimationTree"["parameters/run/blend_amount"]>0.9:
		var audio_walk=preload("res://assets/audios/walk_audio.tscn")
		var aw=audio_walk.instantiate()
		aw.position=self.global_position
		$"..".scene_root.add_child(aw)
