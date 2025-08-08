extends Node3D
var player_models=[]
@onready var player_master=$"../../../.."
func _ready() -> void:
	player_models.append($ammos)
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(1)
