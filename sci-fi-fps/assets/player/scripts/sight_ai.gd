extends Node3D
var player_models=[]
func weapons_ready(vmp):
	player_models.append($sight_main)
	player_models.append($sight_main/sight_m)
	player_models.append($sight_main/sight_id)
	player_models.append($sight_main/RP1)
	player_models.append($sight_main/RP2)
	
	if vmp==0:
		for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(3)
	if vmp==1:
		for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(1)
func die_cast_shadows():
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(1)
