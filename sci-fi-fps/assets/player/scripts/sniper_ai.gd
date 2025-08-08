extends Node3D
var player_models=[]

@onready var player_master=$"../../../.."
@onready var weapon_mag_3rd=$gun_body/magazine
@onready var shoot_point_node=$shoot_point
func _ready() -> void:
	player_models.append($gun_body)
	player_models.append($gun_body/magazine)
	player_models.append($gun_body/sight)
	player_models.append($gun_body/barrel)
	player_models.append($gun_body/gun_body2)
	player_models.append($gun_body/trigger)
	player_models.append($gun_body/bullet_set)
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(1)
func die_cast_shadows():
	for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(1)
