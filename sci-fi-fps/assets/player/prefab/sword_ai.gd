extends Node3D
var player_models:Array[Node]=[]
@onready var player_master:Node=$"../../../.."
func _ready() -> void:
	player_models.append($handle)
	player_models.append($handle/hanele2)
	player_models.append($handle/sword)
	player_models.append($handle/sword/GPUParticles3D)
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(1)
func die_cast_shadows():
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(1)


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var handle1_material:Resource=preload("res://assets/materials_prefab/sword/256/handle1.tres")
			var handle2_material:Resource=preload("res://assets/materials_prefab/sword/256/handle2.tres")
			var sword_material:Resource=preload("res://assets/materials_prefab/sword/256/sword.tres")
			$handle.set_surface_override_material(0,handle1_material)
			$handle/hanele2.set_surface_override_material(0,handle2_material)
			$handle/sword.set_surface_override_material(0,sword_material)
		if UserData.texture_size_data==512:
			var handle1_material:Resource=preload("res://assets/materials_prefab/sword/512/handle1.tres")
			var handle2_material:Resource=preload("res://assets/materials_prefab/sword/512/handle2.tres")
			var sword_material:Resource=preload("res://assets/materials_prefab/sword/512/sword.tres")
			$handle.set_surface_override_material(0,handle1_material)
			$handle/hanele2.set_surface_override_material(0,handle2_material)
			$handle/sword.set_surface_override_material(0,sword_material)
		if UserData.texture_size_data==1024:
			var handle1_material:Resource=preload("res://assets/materials_prefab/sword/1024/handle1.tres")
			var handle2_material:Resource=preload("res://assets/materials_prefab/sword/1024/handle2.tres")
			var sword_material:Resource=preload("res://assets/materials_prefab/sword/1024/sword.tres")
			$handle.set_surface_override_material(0,handle1_material)
			$handle/hanele2.set_surface_override_material(0,handle2_material)
			$handle/sword.set_surface_override_material(0,sword_material)
		ready_to_scene=true
