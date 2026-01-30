extends Node3D
var player_models:Array[Node]=[]
func _ready() -> void:
	player_models.append($sight_main)
	player_models.append($sight_main/sight_m)
	player_models.append($sight_main/sight_id)
	player_models.append($sight_main/RP1)
	player_models.append($sight_main/RP2)
	
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(0)

var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var sight_main:Resource=preload("res://assets/materials_prefab/sight/256/sight_main.tres")
			var sight_id:Resource=preload("res://assets/materials_prefab/sight/256/sight_id.tres")
			$sight_main.set_surface_override_material(0,sight_main)
			$sight_main/sight_id.set_surface_override_material(0,sight_id)
		if UserData.texture_size_data==512:
			var sight_main:Resource=preload("res://assets/materials_prefab/sight/512/sight_main.tres")
			var sight_id:Resource=preload("res://assets/materials_prefab/sight/512/sight_id.tres")
			$sight_main.set_surface_override_material(0,sight_main)
			$sight_main/sight_id.set_surface_override_material(0,sight_id)
		if UserData.texture_size_data==1024:
			var sight_main:Resource=preload("res://assets/materials_prefab/sight/1024/sight_main.tres")
			var sight_id:Resource=preload("res://assets/materials_prefab/sight/1024/sight_id.tres")
			$sight_main.set_surface_override_material(0,sight_main)
			$sight_main/sight_id.set_surface_override_material(0,sight_id)
		
		ready_to_scene=true
