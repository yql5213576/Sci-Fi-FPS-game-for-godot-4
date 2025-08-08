extends Area3D

@export_enum("hip", "spine", "leg1_L","leg2_L","foot_L","leg1_R","leg2_R","foot_R",
"head","shouder_L","arm_L","hand_L","shouder_R","arm_R","hand_R") var body_pos: String

@onready var player_master=$"../../../.."

func hurt_event(weapon_damage,from_enemy):
	player_master.hit_loss_health_event(weapon_damage)
	player_master.murderer=from_enemy

func hit_from_enemy_bullet_anim_event():
	player_master.hit_from_enemy_bullet_anim_event()
