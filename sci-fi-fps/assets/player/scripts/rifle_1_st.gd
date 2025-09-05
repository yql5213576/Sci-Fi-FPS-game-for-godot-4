extends Node3D
var player_models=[]
@onready var shoot_point_node=$shoot_point
@onready var mag_model_node=$gun_body/magazine
func _ready() -> void:
	player_models.append($gun_body)
	player_models.append($gun_body/barrel)
	player_models.append($gun_body/gun_body2)
	player_models.append($gun_body/magazine)
	player_models.append($gun_body/trigger)
	player_models.append($gun_body/sight/RP1)
	player_models.append($gun_body/sight/RP2)
	
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(0)
