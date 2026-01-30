extends Node3D
var player_models:Array[Node]=[]
@onready var shoot_point_node:Node=$shoot_point

@onready var player_master:Node=$"../../../.."

func _ready() -> void:
	player_models.append($gun_body5)
	player_models.append($gun_body5/gun_body1)
	player_models.append($gun_body5/gun_body2)
	player_models.append($gun_body5/gun_body3)
	player_models.append($gun_body5/gun_body4)
	player_models.append($gun_body5/gun_body6)
	player_models.append($gun_body5/gun_body8)
	player_models.append($gun_body5/gun_body9)
	player_models.append($gun_body5/gun_body10)
	player_models.append($gun_body5/handle)
	player_models.append($gun_body5/barrel)
	player_models.append($gun_body5/aiming_point)
	player_models.append($gun_body5/gun_body7)
	
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(1)
func die_cast_shadows():
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(1)

var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var gun_body_1_material:Resource=preload("res://assets/materials_prefab/shotgun/256/gun_body1.tres")
			var gun_body_2_material:Resource=preload("res://assets/materials_prefab/shotgun/256/gun_body2.tres")
			var gun_body_3_material:Resource=preload("res://assets/materials_prefab/shotgun/256/gun_body3.tres")
			var gun_body_4_material:Resource=preload("res://assets/materials_prefab/shotgun/256/gun_body4.tres")
			var gun_body_5_material:Resource=preload("res://assets/materials_prefab/shotgun/256/gun_body5.tres")
			var gun_body_6_material:Resource=preload("res://assets/materials_prefab/shotgun/256/gun_body6.tres")
			var gun_body_7_material:Resource=preload("res://assets/materials_prefab/shotgun/256/gun_body7.tres")
			var gun_body_8_material:Resource=preload("res://assets/materials_prefab/shotgun/256/gun_body8.tres")
			var gun_body_9_material:Resource=preload("res://assets/materials_prefab/shotgun/256/gun_body9.tres")
			var gun_body_10_material:Resource=preload("res://assets/materials_prefab/shotgun/256/gun_body10.tres")
			var handle_material:Resource=preload("res://assets/materials_prefab/shotgun/256/handle.tres")
			var barrel_material:Resource=preload("res://assets/materials_prefab/shotgun/256/barrel.tres")
			$gun_body5/gun_body1.set_surface_override_material(0,gun_body_1_material)
			$gun_body5/gun_body1.set_surface_override_material(1,gun_body_1_material)
			$gun_body5/gun_body2.set_surface_override_material(0,gun_body_2_material)
			$gun_body5/gun_body3.set_surface_override_material(0,gun_body_3_material)
			$gun_body5/gun_body4.set_surface_override_material(0,gun_body_4_material)
			$gun_body5.set_surface_override_material(0,gun_body_5_material)
			$gun_body5/gun_body6.set_surface_override_material(0,gun_body_6_material)
			$gun_body5/gun_body7.set_surface_override_material(0,gun_body_7_material)
			$gun_body5/gun_body8.set_surface_override_material(0,gun_body_8_material)
			$gun_body5/gun_body9.set_surface_override_material(0,gun_body_9_material)
			$gun_body5/gun_body10.set_surface_override_material(0,gun_body_10_material)
			$gun_body5/handle.set_surface_override_material(0,handle_material)
			$gun_body5/barrel.set_surface_override_material(0,barrel_material)
		
		
		if UserData.texture_size_data==512:
			var gun_body_1_material:Resource=preload("res://assets/materials_prefab/shotgun/512/gun_body1.tres")
			var gun_body_2_material:Resource=preload("res://assets/materials_prefab/shotgun/512/gun_body2.tres")
			var gun_body_3_material:Resource=preload("res://assets/materials_prefab/shotgun/512/gun_body3.tres")
			var gun_body_4_material:Resource=preload("res://assets/materials_prefab/shotgun/512/gun_body4.tres")
			var gun_body_5_material:Resource=preload("res://assets/materials_prefab/shotgun/512/gun_body5.tres")
			var gun_body_6_material:Resource=preload("res://assets/materials_prefab/shotgun/512/gun_body6.tres")
			var gun_body_7_material:Resource=preload("res://assets/materials_prefab/shotgun/512/gun_body7.tres")
			var gun_body_8_material:Resource=preload("res://assets/materials_prefab/shotgun/512/gun_body8.tres")
			var gun_body_9_material:Resource=preload("res://assets/materials_prefab/shotgun/512/gun_body9.tres")
			var gun_body_10_material:Resource=preload("res://assets/materials_prefab/shotgun/512/gun_body10.tres")
			var handle_material:Resource=preload("res://assets/materials_prefab/shotgun/512/handle.tres")
			var barrel_material:Resource=preload("res://assets/materials_prefab/shotgun/512/barrel.tres")
			$gun_body5/gun_body1.set_surface_override_material(0,gun_body_1_material)
			$gun_body5/gun_body1.set_surface_override_material(1,gun_body_1_material)
			$gun_body5/gun_body2.set_surface_override_material(0,gun_body_2_material)
			$gun_body5/gun_body3.set_surface_override_material(0,gun_body_3_material)
			$gun_body5/gun_body4.set_surface_override_material(0,gun_body_4_material)
			$gun_body5.set_surface_override_material(0,gun_body_5_material)
			$gun_body5/gun_body6.set_surface_override_material(0,gun_body_6_material)
			$gun_body5/gun_body7.set_surface_override_material(0,gun_body_7_material)
			$gun_body5/gun_body8.set_surface_override_material(0,gun_body_8_material)
			$gun_body5/gun_body9.set_surface_override_material(0,gun_body_9_material)
			$gun_body5/gun_body10.set_surface_override_material(0,gun_body_10_material)
			$gun_body5/handle.set_surface_override_material(0,handle_material)
			$gun_body5/barrel.set_surface_override_material(0,barrel_material)
		
		
		if UserData.texture_size_data==1024:
			var gun_body_1_material:Resource=preload("res://assets/materials_prefab/shotgun/1024/gun_body1.tres")
			var gun_body_2_material:Resource=preload("res://assets/materials_prefab/shotgun/1024/gun_body2.tres")
			var gun_body_3_material:Resource=preload("res://assets/materials_prefab/shotgun/1024/gun_body3.tres")
			var gun_body_4_material:Resource=preload("res://assets/materials_prefab/shotgun/1024/gun_body4.tres")
			var gun_body_5_material:Resource=preload("res://assets/materials_prefab/shotgun/1024/gun_body5.tres")
			var gun_body_6_material:Resource=preload("res://assets/materials_prefab/shotgun/1024/gun_body6.tres")
			var gun_body_7_material:Resource=preload("res://assets/materials_prefab/shotgun/1024/gun_body7.tres")
			var gun_body_8_material:Resource=preload("res://assets/materials_prefab/shotgun/1024/gun_body8.tres")
			var gun_body_9_material:Resource=preload("res://assets/materials_prefab/shotgun/1024/gun_body9.tres")
			var gun_body_10_material:Resource=preload("res://assets/materials_prefab/shotgun/1024/gun_body10.tres")
			var handle_material:Resource=preload("res://assets/materials_prefab/shotgun/1024/handle.tres")
			var barrel_material:Resource=preload("res://assets/materials_prefab/shotgun/1024/barrel.tres")
			$gun_body5/gun_body1.set_surface_override_material(0,gun_body_1_material)
			$gun_body5/gun_body1.set_surface_override_material(1,gun_body_1_material)
			$gun_body5/gun_body2.set_surface_override_material(0,gun_body_2_material)
			$gun_body5/gun_body3.set_surface_override_material(0,gun_body_3_material)
			$gun_body5/gun_body4.set_surface_override_material(0,gun_body_4_material)
			$gun_body5.set_surface_override_material(0,gun_body_5_material)
			$gun_body5/gun_body6.set_surface_override_material(0,gun_body_6_material)
			$gun_body5/gun_body7.set_surface_override_material(0,gun_body_7_material)
			$gun_body5/gun_body8.set_surface_override_material(0,gun_body_8_material)
			$gun_body5/gun_body9.set_surface_override_material(0,gun_body_9_material)
			$gun_body5/gun_body10.set_surface_override_material(0,gun_body_10_material)
			$gun_body5/handle.set_surface_override_material(0,handle_material)
			$gun_body5/barrel.set_surface_override_material(0,barrel_material)
			
		ready_to_scene=true
