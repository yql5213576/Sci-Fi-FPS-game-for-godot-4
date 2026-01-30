extends Node3D
var player_models:Array[Node]=[]
@onready var player_master:Node=$"../../../.."
func _ready() -> void:
	player_models.append($ammos)
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(1)
var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var ammo_material:Resource=preload("res://assets/materials_prefab/shotgun/ammo/256/ammo.tres")
			$ammos.set_surface_override_material(0,ammo_material)
		if UserData.texture_size_data==512:
			var ammo_material:Resource=preload("res://assets/materials_prefab/shotgun/ammo/512/ammo.tres")
			$ammos.set_surface_override_material(0,ammo_material)
		if UserData.texture_size_data==1024:
			var ammo_material:Resource=preload("res://assets/materials_prefab/shotgun/ammo/1024/ammo.tres")
			$ammos.set_surface_override_material(0,ammo_material)
		ready_to_scene=true
