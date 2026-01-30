extends Node3D
var player_models:Array[Node]=[]
@onready var player_master:Node=$"../../../.."
func _ready() -> void:
	player_models.append($magazine)
	player_models.append($ammo_pistol)
	if player_master.view_mode_player==0:
		for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(3)
	if player_master.view_mode_player==1:
		for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(1)


var ready_to_scene:bool=false
func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var magazine:Resource=preload("res://assets/materials_prefab/pistol/256/magazine.tres")
			var ammo:Resource=preload("res://assets/materials_prefab/pistol/ammo/256/ammo.tres")
			$magazine.set_surface_override_material(0,magazine)
			$ammo_pistol.set_surface_override_material(0,ammo)
		if UserData.texture_size_data==512:
			var magazine:Resource=preload("res://assets/materials_prefab/pistol/512/magazine.tres")
			var ammo:Resource=preload("res://assets/materials_prefab/pistol/ammo/512/ammo.tres")
			$magazine.set_surface_override_material(0,magazine)
			$ammo_pistol.set_surface_override_material(0,ammo)
		if UserData.texture_size_data==1024:
			var magazine:Resource=preload("res://assets/materials_prefab/pistol/1024/magazine.tres")
			var ammo:Resource=preload("res://assets/materials_prefab/pistol/ammo/1024/ammo.tres")
			$magazine.set_surface_override_material(0,magazine)
			$ammo_pistol.set_surface_override_material(0,ammo)
		ready_to_scene=true
