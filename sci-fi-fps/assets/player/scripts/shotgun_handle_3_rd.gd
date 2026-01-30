extends Node3D
var player_models:Array[Node]=[]
func _ready() -> void:
	player_models.append($handle)
	
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(3)
func die_cast_shadows():
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(1)

var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var handle_material:Resource=preload("res://assets/materials_prefab/shotgun/256/handle.tres")
			$handle.set_surface_override_material(0,handle_material)
		if UserData.texture_size_data==512:
			var handle_material:Resource=preload("res://assets/materials_prefab/shotgun/512/handle.tres")
			$handle.set_surface_override_material(0,handle_material)
		if UserData.texture_size_data==1024:
			var handle_material:Resource=preload("res://assets/materials_prefab/shotgun/1024/handle.tres")
			$handle.set_surface_override_material(0,handle_material)
		ready_to_scene=true
