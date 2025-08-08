extends Node3D
var player_models=[]
@onready var shoot_point_node=$shoot_point
@onready var mag_model_node=$gun_main/magazine
func _ready() -> void:
	player_models.append($gun_main)
	player_models.append($gun_main/trigger)
	player_models.append($gun_main/magazine)
	
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(0)
