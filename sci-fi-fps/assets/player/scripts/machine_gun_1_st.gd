extends Node3D
var player_models:Array[Node]=[]
@onready var shoot_point_node:Node=$shoot_point
@onready var mag_model_node:Node=$gun_body2/drum_magazine
func _ready() -> void:
	player_models.append($gun_body2)
	player_models.append($gun_body2/gun_body1)
	player_models.append($gun_body2/gun_body3)
	player_models.append($gun_body2/drum_magazine)
	player_models.append($gun_body2/gun_body4)
	player_models.append($gun_body2/barrel)
	player_models.append($gun_body2/addon)
	player_models.append($gun_body2/gun_body5)
	player_models.append($gun_body2/drum_magazine/magazine_switch)
	player_models.append($gun_body2/mount)
	
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(0)


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var gun_body_1_material:Resource=preload("res://assets/materials_prefab/machine_gun/256/gun_body_1.tres")
			var gun_body_2_material:Resource=preload("res://assets/materials_prefab/machine_gun/256/gun_body_2.tres")
			var gun_body_3_material:Resource=preload("res://assets/materials_prefab/machine_gun/256/gun_body_3.tres")
			var gun_body_4_material:Resource=preload("res://assets/materials_prefab/machine_gun/256/gun_body_4.tres")
			var gun_body_5_material:Resource=preload("res://assets/materials_prefab/machine_gun/256/gun_body_5.tres")
			var drum_magazine_material:Resource=preload("res://assets/materials_prefab/machine_gun/256/drum_magazine.tres")
			var magazine_switch_material:Resource=preload("res://assets/materials_prefab/machine_gun/256/magazine_switch.tres")
			var barrel_material:Resource=preload("res://assets/materials_prefab/machine_gun/256/barrel.tres")
			var addon_material:Resource=preload("res://assets/materials_prefab/machine_gun/256/addon.tres")
			var mount_material:Resource=preload("res://assets/materials_prefab/machine_gun/256/mount.tres")
			
			$gun_body2/gun_body1.set_surface_override_material(0,gun_body_1_material)
			$gun_body2.set_surface_override_material(0,gun_body_2_material)
			$gun_body2/gun_body3.set_surface_override_material(0,gun_body_3_material)
			$gun_body2/gun_body4.set_surface_override_material(0,gun_body_4_material)
			$gun_body2/gun_body5.set_surface_override_material(0,gun_body_5_material)
			$gun_body2/drum_magazine.set_surface_override_material(0,drum_magazine_material)
			$gun_body2/drum_magazine/magazine_switch.set_surface_override_material(0,magazine_switch_material)
			$gun_body2/barrel.set_surface_override_material(0,barrel_material)
			$gun_body2/addon.set_surface_override_material(0,addon_material)
			$gun_body2/mount.set_surface_override_material(0,mount_material)
		
		if UserData.texture_size_data==512:
			var gun_body_1_material:Resource=preload("res://assets/materials_prefab/machine_gun/512/gun_body_1.tres")
			var gun_body_2_material:Resource=preload("res://assets/materials_prefab/machine_gun/512/gun_body_2.tres")
			var gun_body_3_material:Resource=preload("res://assets/materials_prefab/machine_gun/512/gun_body_3.tres")
			var gun_body_4_material:Resource=preload("res://assets/materials_prefab/machine_gun/512/gun_body_4.tres")
			var gun_body_5_material:Resource=preload("res://assets/materials_prefab/machine_gun/512/gun_body_5.tres")
			var drum_magazine_material:Resource=preload("res://assets/materials_prefab/machine_gun/512/drum_magazine.tres")
			var magazine_switch_material:Resource=preload("res://assets/materials_prefab/machine_gun/512/magazine_switch.tres")
			var barrel_material:Resource=preload("res://assets/materials_prefab/machine_gun/512/barrel.tres")
			var addon_material:Resource=preload("res://assets/materials_prefab/machine_gun/512/addon.tres")
			var mount_material:Resource=preload("res://assets/materials_prefab/machine_gun/512/mount.tres")
			
			$gun_body2/gun_body1.set_surface_override_material(0,gun_body_1_material)
			$gun_body2.set_surface_override_material(0,gun_body_2_material)
			$gun_body2/gun_body3.set_surface_override_material(0,gun_body_3_material)
			$gun_body2/gun_body4.set_surface_override_material(0,gun_body_4_material)
			$gun_body2/gun_body5.set_surface_override_material(0,gun_body_5_material)
			$gun_body2/drum_magazine.set_surface_override_material(0,drum_magazine_material)
			$gun_body2/drum_magazine/magazine_switch.set_surface_override_material(0,magazine_switch_material)
			$gun_body2/barrel.set_surface_override_material(0,barrel_material)
			$gun_body2/addon.set_surface_override_material(0,addon_material)
			$gun_body2/mount.set_surface_override_material(0,mount_material)
		
		if UserData.texture_size_data==1024:
			var gun_body_1_material:Resource=preload("res://assets/materials_prefab/machine_gun/1024/gun_body_1.tres")
			var gun_body_2_material:Resource=preload("res://assets/materials_prefab/machine_gun/1024/gun_body_2.tres")
			var gun_body_3_material:Resource=preload("res://assets/materials_prefab/machine_gun/1024/gun_body_3.tres")
			var gun_body_4_material:Resource=preload("res://assets/materials_prefab/machine_gun/1024/gun_body_4.tres")
			var gun_body_5_material:Resource=preload("res://assets/materials_prefab/machine_gun/1024/gun_body_5.tres")
			var drum_magazine_material:Resource=preload("res://assets/materials_prefab/machine_gun/1024/drum_magazine.tres")
			var magazine_switch_material:Resource=preload("res://assets/materials_prefab/machine_gun/1024/magazine_switch.tres")
			var barrel_material:Resource=preload("res://assets/materials_prefab/machine_gun/1024/barrel.tres")
			var addon_material:Resource=preload("res://assets/materials_prefab/machine_gun/1024/addon.tres")
			var mount_material:Resource=preload("res://assets/materials_prefab/machine_gun/1024/mount.tres")
			
			$gun_body2/gun_body1.set_surface_override_material(0,gun_body_1_material)
			$gun_body2.set_surface_override_material(0,gun_body_2_material)
			$gun_body2/gun_body3.set_surface_override_material(0,gun_body_3_material)
			$gun_body2/gun_body4.set_surface_override_material(0,gun_body_4_material)
			$gun_body2/gun_body5.set_surface_override_material(0,gun_body_5_material)
			$gun_body2/drum_magazine.set_surface_override_material(0,drum_magazine_material)
			$gun_body2/drum_magazine/magazine_switch.set_surface_override_material(0,magazine_switch_material)
			$gun_body2/barrel.set_surface_override_material(0,barrel_material)
			$gun_body2/addon.set_surface_override_material(0,addon_material)
			$gun_body2/mount.set_surface_override_material(0,mount_material)
		
		ready_to_scene=true
