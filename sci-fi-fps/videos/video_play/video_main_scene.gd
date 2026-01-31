extends Control

@onready var main_menu:String="res://assets/main_menu/main_menu.tscn"
var anim_finish:bool=false
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit_game"):
		if anim_finish==false:
			$VideoStreamPlayer.paused=true
			anim_finish=true
	if anim_finish:
		var progress:Array[float]=[]
		ResourceLoader.load_threaded_request(main_menu)
		ResourceLoader.load_threaded_get_status(main_menu,progress)
		if progress[0]==1:
			var packed_scene:Resource=ResourceLoader.load_threaded_get(main_menu)
			get_tree().change_scene_to_packed(packed_scene)
		
func _on_video_stream_player_finished() -> void:
	$VideoStreamPlayer.paused=true
	anim_finish=true
