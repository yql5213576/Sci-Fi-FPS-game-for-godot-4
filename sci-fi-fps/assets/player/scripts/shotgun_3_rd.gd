extends Node3D
var player_models=[]
@onready var shoot_point_node=$shoot_point

@onready var player_master=$"../../../.."

func _ready() -> void:
	player_models.append($gun_body5)
	player_models.append($gun_body5/gun_body1)
	player_models.append($gun_body5/gun_body2)
	player_models.append($gun_body5/gun_body3)
	player_models.append($gun_body5/gun_body4)
	player_models.append($gun_body5/gun_body6)
	player_models.append($gun_body5/gun_body8)
	player_models.append($gun_body5/gun_body9)
	player_models.append($gun_body5/gun_body10)
	player_models.append($gun_body5/handle)
	player_models.append($gun_body5/barrel)
	player_models.append($gun_body5/aiming_point)
	player_models.append($gun_body5/gun_body7)
	
	if player_master.view_mode_player==0:
		for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(3)
	if player_master.view_mode_player==1:
		for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(1)
func die_cast_shadows():
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(1)
