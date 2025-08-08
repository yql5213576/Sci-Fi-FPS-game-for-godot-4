extends Node3D
var player_models=[]
@onready var shoot_point_node=$shoot_point
@onready var mag_model_node=$gun_body2/drum_magazine
func _ready() -> void:
	player_models.append($gun_body2)
	player_models.append($gun_body2/gun_body1)
	player_models.append($gun_body2/gun_body3)
	player_models.append($gun_body2/drum_magazine)
	player_models.append($gun_body2/gun_body4)
	player_models.append($gun_body2/barrel)
	player_models.append($gun_body2/addon)
	player_models.append($gun_body2/gun_body5)
	player_models.append($gun_body2/drum_magazine/magazine_switch)
	player_models.append($gun_body2/mount)
	
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(0)
