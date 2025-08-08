extends Node3D
var player_models=[]
func _ready() -> void:
	player_models.append($sight_main)
	player_models.append($sight_main/sight_m)
	player_models.append($sight_main/sight_id)
	player_models.append($sight_main/red_point)
	
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(0)
