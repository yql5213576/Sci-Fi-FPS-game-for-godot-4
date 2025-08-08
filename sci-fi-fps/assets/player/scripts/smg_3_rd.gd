extends Node3D
var player_models=[]

@onready var player_master=$"../../../.."
@onready var weapon_mag_3rd=$gun_main/magazine
@onready var shoot_point_node=$shoot_point
@onready var sight_node=$gun_main/sight
func _ready() -> void:
	player_models.append($gun_main)
	player_models.append($gun_main/trigger)
	player_models.append($gun_main/barrel)
	player_models.append($gun_main/magazine)
	player_models.append($gun_main/handle)
	player_models.append($gun_main/object2)
	player_models.append($gun_main/object1)
	if player_master.view_mode_player==0:
		sight_node.weapons_ready(0)
		for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(3)
	if player_master.view_mode_player==1:
		sight_node.weapons_ready(1)
		for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(1)
func die_cast_shadows():
	for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(1)
