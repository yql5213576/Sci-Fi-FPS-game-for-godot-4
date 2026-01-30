extends Node3D
var player_models:Array[Node]=[]
@onready var player_master:Node=$"../../../.."
func _ready() -> void:
	player_models.append($magazine)
	player_models.append($ammo_sniper)
	player_models.append($ammo_sniper2)
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
			var magazine_material:Resource=preload("res://assets/materials_prefab/sniper/256/magazine.tres")
			var ammo_material:Resource=preload("res://assets/materials_prefab/sniper/ammo/256/ammo.tres")
			$magazine.set_surface_override_material(0,magazine_material)
			$ammo_sniper.set_surface_override_material(0,ammo_material)
			$ammo_sniper2.set_surface_override_material(0,ammo_material)
		if UserData.texture_size_data==512:
			var magazine_material:Resource=preload("res://assets/materials_prefab/sniper/512/magazine.tres")
			var ammo_material:Resource=preload("res://assets/materials_prefab/sniper/ammo/512/ammo.tres")
			$magazine.set_surface_override_material(0,magazine_material)
			$ammo_sniper.set_surface_override_material(0,ammo_material)
			$ammo_sniper2.set_surface_override_material(0,ammo_material)
		if UserData.texture_size_data==1024:
			var magazine_material:Resource=preload("res://assets/materials_prefab/sniper/1024/magazine.tres")
			var ammo_material:Resource=preload("res://assets/materials_prefab/sniper/ammo/1024/ammo.tres")
			$magazine.set_surface_override_material(0,magazine_material)
			$ammo_sniper.set_surface_override_material(0,ammo_material)
			$ammo_sniper2.set_surface_override_material(0,ammo_material)
		ready_to_scene=true
