extends Node3D
var player_models:Array[Node]=[]
@onready var shoot_point_node:Node=$shoot_point
@onready var mag_model_node:Node=$gun_body/magazine
func _ready() -> void:
	player_models.append($gun_body)
	player_models.append($gun_body/barrel)
	player_models.append($gun_body/gun_body2)
	player_models.append($gun_body/magazine)
	player_models.append($gun_body/trigger)
	player_models.append($gun_body/sight/RP1)
	player_models.append($gun_body/sight/RP2)
	
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(0)

var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var gun_body_0_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body.tres")
			var gun_body_1_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body1-1.tres")
			var gun_body_2_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body1-2.tres")
			var gun_body_3_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body1-3.tres")
			var gun_body_4_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body1-4.tres")
			var gun_body_5_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body1-5.tres")
			var gun_body_6_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body1-6.tres")
			var gun_body_7_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body1-7.tres")
			var gun_body_8_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body1-8.tres")
			var gun_body_9_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body1-9.tres")
			var gun_body_10_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body1-10.tres")
			var gun_body_11_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body1-11.tres")
			var gun_body_12_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body1-12.tres")
			var barrel_material:Resource=preload("res://assets/materials_prefab/rifle/256/barrel.tres")
			var gun_body2_0_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body2-1.tres")
			var gun_body2_1_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body2-2.tres")
			var gun_body2_2_material:Resource=preload("res://assets/materials_prefab/rifle/256/gun_body2-3.tres")
			var magazine_material:Resource=preload("res://assets/materials_prefab/rifle/256/magazine.tres")
			var trigger_material:Resource=preload("res://assets/materials_prefab/rifle/256/trigger.tres")
			
			$gun_body.set_surface_override_material(0,gun_body_0_material)
			$gun_body.set_surface_override_material(1,gun_body_1_material)
			$gun_body.set_surface_override_material(2,gun_body_2_material)
			$gun_body.set_surface_override_material(3,gun_body_3_material)
			$gun_body.set_surface_override_material(4,gun_body_4_material)
			$gun_body.set_surface_override_material(5,gun_body_5_material)
			$gun_body.set_surface_override_material(6,gun_body_6_material)
			$gun_body.set_surface_override_material(7,gun_body_7_material)
			$gun_body.set_surface_override_material(8,gun_body_8_material)
			$gun_body.set_surface_override_material(9,gun_body_9_material)
			$gun_body.set_surface_override_material(10,gun_body_10_material)
			$gun_body.set_surface_override_material(11,gun_body_11_material)
			$gun_body.set_surface_override_material(12,gun_body_12_material)
			
			$gun_body/barrel.set_surface_override_material(0,barrel_material)
			$gun_body/barrel.set_surface_override_material(1,barrel_material)
			
			$gun_body/gun_body2.set_surface_override_material(0,gun_body2_0_material)
			$gun_body/gun_body2.set_surface_override_material(1,gun_body2_1_material)
			$gun_body/gun_body2.set_surface_override_material(2,gun_body2_2_material)
			
			$gun_body/magazine.set_surface_override_material(0,magazine_material)
			
			$gun_body/trigger.set_surface_override_material(0,trigger_material)
		
		if UserData.texture_size_data==512:
			var gun_body_0_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body.tres")
			var gun_body_1_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body1-1.tres")
			var gun_body_2_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body1-2.tres")
			var gun_body_3_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body1-3.tres")
			var gun_body_4_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body1-4.tres")
			var gun_body_5_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body1-5.tres")
			var gun_body_6_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body1-6.tres")
			var gun_body_7_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body1-7.tres")
			var gun_body_8_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body1-8.tres")
			var gun_body_9_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body1-9.tres")
			var gun_body_10_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body1-10.tres")
			var gun_body_11_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body1-11.tres")
			var gun_body_12_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body1-12.tres")
			var barrel_material:Resource=preload("res://assets/materials_prefab/rifle/512/barrel.tres")
			var gun_body2_0_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body2-1.tres")
			var gun_body2_1_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body2-2.tres")
			var gun_body2_2_material:Resource=preload("res://assets/materials_prefab/rifle/512/gun_body2-3.tres")
			var magazine_material:Resource=preload("res://assets/materials_prefab/rifle/512/magazine.tres")
			var trigger_material:Resource=preload("res://assets/materials_prefab/rifle/512/trigger.tres")
			
			$gun_body.set_surface_override_material(0,gun_body_0_material)
			$gun_body.set_surface_override_material(1,gun_body_1_material)
			$gun_body.set_surface_override_material(2,gun_body_2_material)
			$gun_body.set_surface_override_material(3,gun_body_3_material)
			$gun_body.set_surface_override_material(4,gun_body_4_material)
			$gun_body.set_surface_override_material(5,gun_body_5_material)
			$gun_body.set_surface_override_material(6,gun_body_6_material)
			$gun_body.set_surface_override_material(7,gun_body_7_material)
			$gun_body.set_surface_override_material(8,gun_body_8_material)
			$gun_body.set_surface_override_material(9,gun_body_9_material)
			$gun_body.set_surface_override_material(10,gun_body_10_material)
			$gun_body.set_surface_override_material(11,gun_body_11_material)
			$gun_body.set_surface_override_material(12,gun_body_12_material)
			
			$gun_body/barrel.set_surface_override_material(0,barrel_material)
			$gun_body/barrel.set_surface_override_material(1,barrel_material)
			
			$gun_body/gun_body2.set_surface_override_material(0,gun_body2_0_material)
			$gun_body/gun_body2.set_surface_override_material(1,gun_body2_1_material)
			$gun_body/gun_body2.set_surface_override_material(2,gun_body2_2_material)
			
			$gun_body/magazine.set_surface_override_material(0,magazine_material)
			
			$gun_body/trigger.set_surface_override_material(0,trigger_material)
			
		
		if UserData.texture_size_data==1024:
			var gun_body_0_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body.tres")
			var gun_body_1_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body1-1.tres")
			var gun_body_2_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body1-2.tres")
			var gun_body_3_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body1-3.tres")
			var gun_body_4_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body1-4.tres")
			var gun_body_5_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body1-5.tres")
			var gun_body_6_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body1-6.tres")
			var gun_body_7_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body1-7.tres")
			var gun_body_8_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body1-8.tres")
			var gun_body_9_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body1-9.tres")
			var gun_body_10_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body1-10.tres")
			var gun_body_11_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body1-11.tres")
			var gun_body_12_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body1-12.tres")
			var barrel_material:Resource=preload("res://assets/materials_prefab/rifle/1024/barrel.tres")
			var gun_body2_0_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body2-1.tres")
			var gun_body2_1_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body2-2.tres")
			var gun_body2_2_material:Resource=preload("res://assets/materials_prefab/rifle/1024/gun_body2-3.tres")
			var magazine_material:Resource=preload("res://assets/materials_prefab/rifle/1024/magazine.tres")
			var trigger_material:Resource=preload("res://assets/materials_prefab/rifle/1024/trigger.tres")
			
			$gun_body.set_surface_override_material(0,gun_body_0_material)
			$gun_body.set_surface_override_material(1,gun_body_1_material)
			$gun_body.set_surface_override_material(2,gun_body_2_material)
			$gun_body.set_surface_override_material(3,gun_body_3_material)
			$gun_body.set_surface_override_material(4,gun_body_4_material)
			$gun_body.set_surface_override_material(5,gun_body_5_material)
			$gun_body.set_surface_override_material(6,gun_body_6_material)
			$gun_body.set_surface_override_material(7,gun_body_7_material)
			$gun_body.set_surface_override_material(8,gun_body_8_material)
			$gun_body.set_surface_override_material(9,gun_body_9_material)
			$gun_body.set_surface_override_material(10,gun_body_10_material)
			$gun_body.set_surface_override_material(11,gun_body_11_material)
			$gun_body.set_surface_override_material(12,gun_body_12_material)
			
			$gun_body/barrel.set_surface_override_material(0,barrel_material)
			$gun_body/barrel.set_surface_override_material(1,barrel_material)
			
			$gun_body/gun_body2.set_surface_override_material(0,gun_body2_0_material)
			$gun_body/gun_body2.set_surface_override_material(1,gun_body2_1_material)
			$gun_body/gun_body2.set_surface_override_material(2,gun_body2_2_material)
			
			$gun_body/magazine.set_surface_override_material(0,magazine_material)
			
			$gun_body/trigger.set_surface_override_material(0,trigger_material)
		
		ready_to_scene=true
		
		
