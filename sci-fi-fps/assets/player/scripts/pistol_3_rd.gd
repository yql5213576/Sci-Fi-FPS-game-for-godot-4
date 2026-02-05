extends Node3D
var player_models:Array[Node]=[]
@onready var shoot_point_node:Node=$gun_main/shoot_point
@onready var player_master:Node=$"../../../.."
@onready var weapon_mag_3rd:Node=$gun_main/magazine
func _ready() -> void:
	player_models.append($gun_main)
	player_models.append($gun_main/trigger)
	player_models.append($gun_main/magazine)
	
	if player_master.view_mode_player==0:
		for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(3)
	if player_master.view_mode_player==1:
		for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(1)
func die_cast_shadows():
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(1)

var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var gun_main_0_material:Resource=preload("res://assets/materials_prefab/pistol/256/gun_main_0.tres")
			var gun_main_1_material:Resource=preload("res://assets/materials_prefab/pistol/256/gun_main_1.tres")
			var gun_main_2_material:Resource=preload("res://assets/materials_prefab/pistol/256/gun_main_2.tres")
			var gun_main_3_material:Resource=preload("res://assets/materials_prefab/pistol/256/gun_main_3.tres")
			var gun_main_4_material:Resource=preload("res://assets/materials_prefab/pistol/256/gun_main_4.tres")
			var gun_main_5_material:Resource=preload("res://assets/materials_prefab/pistol/256/gun_main_5.tres")
			var gun_main_6_material:Resource=preload("res://assets/materials_prefab/pistol/256/gun_main_6.tres")
			var gun_main_7_material:Resource=preload("res://assets/materials_prefab/pistol/256/gun_main_7.tres")
			var gun_main_8_material:Resource=preload("res://assets/materials_prefab/pistol/256/gun_main_8.tres")
			var gun_main_9_material:Resource=preload("res://assets/materials_prefab/pistol/256/gun_main_9.tres")
			var gun_main_10_material:Resource=preload("res://assets/materials_prefab/pistol/256/gun_main_10.tres")
			var gun_main_11_material:Resource=preload("res://assets/materials_prefab/pistol/256/gun_main_11.tres")
			var gun_main_12_material:Resource=preload("res://assets/materials_prefab/pistol/256/gun_main_12.tres")
			var trigger_material:Resource=preload("res://assets/materials_prefab/pistol/256/trigger.tres")
			var magazine_material:Resource=preload("res://assets/materials_prefab/pistol/256/magazine.tres")
			
			$gun_main.set_surface_override_material(0,gun_main_0_material)
			$gun_main.set_surface_override_material(1,gun_main_1_material)
			$gun_main.set_surface_override_material(2,gun_main_2_material)
			$gun_main.set_surface_override_material(3,gun_main_3_material)
			$gun_main.set_surface_override_material(4,gun_main_4_material)
			$gun_main.set_surface_override_material(5,gun_main_5_material)
			$gun_main.set_surface_override_material(6,gun_main_6_material)
			$gun_main.set_surface_override_material(7,gun_main_7_material)
			$gun_main.set_surface_override_material(8,gun_main_8_material)
			$gun_main.set_surface_override_material(9,gun_main_9_material)
			$gun_main.set_surface_override_material(10,gun_main_10_material)
			$gun_main.set_surface_override_material(11,gun_main_11_material)
			$gun_main.set_surface_override_material(12,gun_main_12_material)
			$gun_main/trigger.set_surface_override_material(0,trigger_material)
			$gun_main/magazine.set_surface_override_material(0,magazine_material)
		
		
		if UserData.texture_size_data==512:
			var gun_main_0_material:Resource=preload("res://assets/materials_prefab/pistol/512/gun_main_0.tres")
			var gun_main_1_material:Resource=preload("res://assets/materials_prefab/pistol/512/gun_main_1.tres")
			var gun_main_2_material:Resource=preload("res://assets/materials_prefab/pistol/512/gun_main_2.tres")
			var gun_main_3_material:Resource=preload("res://assets/materials_prefab/pistol/512/gun_main_3.tres")
			var gun_main_4_material:Resource=preload("res://assets/materials_prefab/pistol/512/gun_main_4.tres")
			var gun_main_5_material:Resource=preload("res://assets/materials_prefab/pistol/512/gun_main_5.tres")
			var gun_main_6_material:Resource=preload("res://assets/materials_prefab/pistol/512/gun_main_6.tres")
			var gun_main_7_material:Resource=preload("res://assets/materials_prefab/pistol/512/gun_main_7.tres")
			var gun_main_8_material:Resource=preload("res://assets/materials_prefab/pistol/512/gun_main_8.tres")
			var gun_main_9_material:Resource=preload("res://assets/materials_prefab/pistol/512/gun_main_9.tres")
			var gun_main_10_material:Resource=preload("res://assets/materials_prefab/pistol/512/gun_main_10.tres")
			var gun_main_11_material:Resource=preload("res://assets/materials_prefab/pistol/512/gun_main_11.tres")
			var gun_main_12_material:Resource=preload("res://assets/materials_prefab/pistol/512/gun_main_12.tres")
			var trigger_material:Resource=preload("res://assets/materials_prefab/pistol/512/trigger.tres")
			var magazine_material:Resource=preload("res://assets/materials_prefab/pistol/512/magazine.tres")
			
			$gun_main.set_surface_override_material(0,gun_main_0_material)
			$gun_main.set_surface_override_material(1,gun_main_1_material)
			$gun_main.set_surface_override_material(2,gun_main_2_material)
			$gun_main.set_surface_override_material(3,gun_main_3_material)
			$gun_main.set_surface_override_material(4,gun_main_4_material)
			$gun_main.set_surface_override_material(5,gun_main_5_material)
			$gun_main.set_surface_override_material(6,gun_main_6_material)
			$gun_main.set_surface_override_material(7,gun_main_7_material)
			$gun_main.set_surface_override_material(8,gun_main_8_material)
			$gun_main.set_surface_override_material(9,gun_main_9_material)
			$gun_main.set_surface_override_material(10,gun_main_10_material)
			$gun_main.set_surface_override_material(11,gun_main_11_material)
			$gun_main.set_surface_override_material(12,gun_main_12_material)
			$gun_main/trigger.set_surface_override_material(0,trigger_material)
			$gun_main/magazine.set_surface_override_material(0,magazine_material)
		
		
		if UserData.texture_size_data==1024:
			var gun_main_0_material:Resource=preload("res://assets/materials_prefab/pistol/1024/gun_main_0.tres")
			var gun_main_1_material:Resource=preload("res://assets/materials_prefab/pistol/1024/gun_main_1.tres")
			var gun_main_2_material:Resource=preload("res://assets/materials_prefab/pistol/1024/gun_main_2.tres")
			var gun_main_3_material:Resource=preload("res://assets/materials_prefab/pistol/1024/gun_main_3.tres")
			var gun_main_4_material:Resource=preload("res://assets/materials_prefab/pistol/1024/gun_main_4.tres")
			var gun_main_5_material:Resource=preload("res://assets/materials_prefab/pistol/1024/gun_main_5.tres")
			var gun_main_6_material:Resource=preload("res://assets/materials_prefab/pistol/1024/gun_main_6.tres")
			var gun_main_7_material:Resource=preload("res://assets/materials_prefab/pistol/1024/gun_main_7.tres")
			var gun_main_8_material:Resource=preload("res://assets/materials_prefab/pistol/1024/gun_main_8.tres")
			var gun_main_9_material:Resource=preload("res://assets/materials_prefab/pistol/1024/gun_main_9.tres")
			var gun_main_10_material:Resource=preload("res://assets/materials_prefab/pistol/1024/gun_main_10.tres")
			var gun_main_11_material:Resource=preload("res://assets/materials_prefab/pistol/1024/gun_main_11.tres")
			var gun_main_12_material:Resource=preload("res://assets/materials_prefab/pistol/1024/gun_main_12.tres")
			var trigger_material:Resource=preload("res://assets/materials_prefab/pistol/1024/trigger.tres")
			var magazine_material:Resource=preload("res://assets/materials_prefab/pistol/1024/magazine.tres")
			
			$gun_main.set_surface_override_material(0,gun_main_0_material)
			$gun_main.set_surface_override_material(1,gun_main_1_material)
			$gun_main.set_surface_override_material(2,gun_main_2_material)
			$gun_main.set_surface_override_material(3,gun_main_3_material)
			$gun_main.set_surface_override_material(4,gun_main_4_material)
			$gun_main.set_surface_override_material(5,gun_main_5_material)
			$gun_main.set_surface_override_material(6,gun_main_6_material)
			$gun_main.set_surface_override_material(7,gun_main_7_material)
			$gun_main.set_surface_override_material(8,gun_main_8_material)
			$gun_main.set_surface_override_material(9,gun_main_9_material)
			$gun_main.set_surface_override_material(10,gun_main_10_material)
			$gun_main.set_surface_override_material(11,gun_main_11_material)
			$gun_main.set_surface_override_material(12,gun_main_12_material)
			$gun_main/trigger.set_surface_override_material(0,trigger_material)
			$gun_main/magazine.set_surface_override_material(0,magazine_material)
		
		
		ready_to_scene=true
