extends Node3D
var player_models=[]

@onready var player_master=$"../../../.."
@onready var weapon_mag_3rd=$gun_main/magazine
@onready var shoot_point_node=$shoot_point
@onready var sight_node=$gun_main/sight
func _ready() -> void:
	player_models.append($gun_main)
	player_models.append($gun_main/trigger)
	player_models.append($gun_main/barrel)
	player_models.append($gun_main/magazine)
	player_models.append($gun_main/handle)
	player_models.append($gun_main/object2)
	player_models.append($gun_main/object1)
	sight_node.weapons_ready(1)
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(1)
func die_cast_shadows():
	for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(1)

var ready_to_scene=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var gun_main_0_material=preload("res://assets/materials_prefab/smg/256/gun_main_0.tres")
			var gun_main_1_material=preload("res://assets/materials_prefab/smg/256/gun_main_1.tres")
			var gun_main_2_material=preload("res://assets/materials_prefab/smg/256/gun_main_2.tres")
			var gun_main_3_material=preload("res://assets/materials_prefab/smg/256/gun_main_3.tres")
			var gun_main_4_material=preload("res://assets/materials_prefab/smg/256/gun_main_4.tres")
			var gun_main_5_material=preload("res://assets/materials_prefab/smg/256/gun_main_5.tres")
			var gun_main_6_material=preload("res://assets/materials_prefab/smg/256/gun_main_6.tres")
			var gun_main_7_material=preload("res://assets/materials_prefab/smg/256/gun_main_7.tres")
			var gun_main_8_material=preload("res://assets/materials_prefab/smg/256/gun_main_8.tres")
			var gun_main_9_material=preload("res://assets/materials_prefab/smg/256/gun_main_9.tres")
			var gun_main_10_material=preload("res://assets/materials_prefab/smg/256/gun_main_10.tres")
			var trigger_material=preload("res://assets/materials_prefab/smg/256/trigger.tres")
			var barrel_material=preload("res://assets/materials_prefab/smg/256/barrel.tres")
			var magazine_material=preload("res://assets/materials_prefab/smg/256/magazine.tres")
			var handle_material=preload("res://assets/materials_prefab/smg/256/handle.tres")
			var object1_material=preload("res://assets/materials_prefab/smg/256/object1.tres")
			var object2_material=preload("res://assets/materials_prefab/smg/256/object2.tres")
			
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
			$gun_main/trigger.set_surface_override_material(0,trigger_material)
			$gun_main/barrel.set_surface_override_material(0,barrel_material)
			$gun_main/magazine.set_surface_override_material(0,magazine_material)
			$gun_main/handle.set_surface_override_material(0,handle_material)
			$gun_main/object2.set_surface_override_material(0,object2_material)
			$gun_main/object1.set_surface_override_material(0,object1_material)
		
		
		if UserData.texture_size_data==512:
			var gun_main_0_material=preload("res://assets/materials_prefab/smg/512/gun_main_0.tres")
			var gun_main_1_material=preload("res://assets/materials_prefab/smg/512/gun_main_1.tres")
			var gun_main_2_material=preload("res://assets/materials_prefab/smg/512/gun_main_2.tres")
			var gun_main_3_material=preload("res://assets/materials_prefab/smg/512/gun_main_3.tres")
			var gun_main_4_material=preload("res://assets/materials_prefab/smg/512/gun_main_4.tres")
			var gun_main_5_material=preload("res://assets/materials_prefab/smg/512/gun_main_5.tres")
			var gun_main_6_material=preload("res://assets/materials_prefab/smg/512/gun_main_6.tres")
			var gun_main_7_material=preload("res://assets/materials_prefab/smg/512/gun_main_7.tres")
			var gun_main_8_material=preload("res://assets/materials_prefab/smg/512/gun_main_8.tres")
			var gun_main_9_material=preload("res://assets/materials_prefab/smg/512/gun_main_9.tres")
			var gun_main_10_material=preload("res://assets/materials_prefab/smg/512/gun_main_10.tres")
			var trigger_material=preload("res://assets/materials_prefab/smg/512/trigger.tres")
			var barrel_material=preload("res://assets/materials_prefab/smg/512/barrel.tres")
			var magazine_material=preload("res://assets/materials_prefab/smg/512/magazine.tres")
			var handle_material=preload("res://assets/materials_prefab/smg/512/handle.tres")
			var object1_material=preload("res://assets/materials_prefab/smg/512/object1.tres")
			var object2_material=preload("res://assets/materials_prefab/smg/512/object2.tres")
			
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
			$gun_main/trigger.set_surface_override_material(0,trigger_material)
			$gun_main/barrel.set_surface_override_material(0,barrel_material)
			$gun_main/magazine.set_surface_override_material(0,magazine_material)
			$gun_main/handle.set_surface_override_material(0,handle_material)
			$gun_main/object2.set_surface_override_material(0,object2_material)
			$gun_main/object1.set_surface_override_material(0,object1_material)
		
		
		if UserData.texture_size_data==1024:
			var gun_main_0_material=preload("res://assets/materials_prefab/smg/1024/gun_main_0.tres")
			var gun_main_1_material=preload("res://assets/materials_prefab/smg/1024/gun_main_1.tres")
			var gun_main_2_material=preload("res://assets/materials_prefab/smg/1024/gun_main_2.tres")
			var gun_main_3_material=preload("res://assets/materials_prefab/smg/1024/gun_main_3.tres")
			var gun_main_4_material=preload("res://assets/materials_prefab/smg/1024/gun_main_4.tres")
			var gun_main_5_material=preload("res://assets/materials_prefab/smg/1024/gun_main_5.tres")
			var gun_main_6_material=preload("res://assets/materials_prefab/smg/1024/gun_main_6.tres")
			var gun_main_7_material=preload("res://assets/materials_prefab/smg/1024/gun_main_7.tres")
			var gun_main_8_material=preload("res://assets/materials_prefab/smg/1024/gun_main_8.tres")
			var gun_main_9_material=preload("res://assets/materials_prefab/smg/1024/gun_main_9.tres")
			var gun_main_10_material=preload("res://assets/materials_prefab/smg/1024/gun_main_10.tres")
			var trigger_material=preload("res://assets/materials_prefab/smg/1024/trigger.tres")
			var barrel_material=preload("res://assets/materials_prefab/smg/1024/barrel.tres")
			var magazine_material=preload("res://assets/materials_prefab/smg/1024/magazine.tres")
			var handle_material=preload("res://assets/materials_prefab/smg/1024/handle.tres")
			var object1_material=preload("res://assets/materials_prefab/smg/1024/object1.tres")
			var object2_material=preload("res://assets/materials_prefab/smg/1024/object2.tres")
			
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
			$gun_main/trigger.set_surface_override_material(0,trigger_material)
			$gun_main/barrel.set_surface_override_material(0,barrel_material)
			$gun_main/magazine.set_surface_override_material(0,magazine_material)
			$gun_main/handle.set_surface_override_material(0,handle_material)
			$gun_main/object2.set_surface_override_material(0,object2_material)
			$gun_main/object1.set_surface_override_material(0,object1_material)
		
		ready_to_scene=true
