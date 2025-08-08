extends Node3D
var player_models=[]
func _ready() -> void:
	player_models.append($magazine)
	player_models.append($ammo_pistol)
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(0)
