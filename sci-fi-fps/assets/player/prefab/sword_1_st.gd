extends Node3D
var player_models=[]
func _ready() -> void:
	player_models.append($handle)
	player_models.append($handle/hanele2)
	player_models.append($handle/sword)
	player_models.append($handle/sword/GPUParticles3D)
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(0)
