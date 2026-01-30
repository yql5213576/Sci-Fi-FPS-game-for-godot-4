extends Node3D
var player_models:Array[Node]=[]
@onready var player_master:Node=$"../../../.."
func _ready() -> void:
	player_models.append($drum_magazine)
	player_models.append($drum_magazine/magazine_switch)
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(1)

var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var drum_magazine_material:Resource=preload("res://assets/materials_prefab/machine_gun/256/drum_magazine.tres")
			var magazine_switch_material:Resource=preload("res://assets/materials_prefab/machine_gun/256/magazine_switch.tres")
			$drum_magazine.set_surface_override_material(0,drum_magazine_material)
			$drum_magazine/magazine_switch.set_surface_override_material(0,magazine_switch_material)
		
		if UserData.texture_size_data==512:
			var drum_magazine_material:Resource=preload("res://assets/materials_prefab/machine_gun/512/drum_magazine.tres")
			var magazine_switch_material:Resource=preload("res://assets/materials_prefab/machine_gun/512/magazine_switch.tres")
			$drum_magazine.set_surface_override_material(0,drum_magazine_material)
			$drum_magazine/magazine_switch.set_surface_override_material(0,magazine_switch_material)
		
		if UserData.texture_size_data==1024:
			var drum_magazine_material:Resource=preload("res://assets/materials_prefab/machine_gun/1024/drum_magazine.tres")
			var magazine_switch_material:Resource=preload("res://assets/materials_prefab/machine_gun/1024/magazine_switch.tres")
			$drum_magazine.set_surface_override_material(0,drum_magazine_material)
			$drum_magazine/magazine_switch.set_surface_override_material(0,magazine_switch_material)
			
		ready_to_scene=true
