extends Node3D
@onready var player_master=$"../../../.."


@onready var rifle_model=$"../../right_hand/rifle"
@onready var pistol_model=$"../../right_hand/pistol"
@onready var smg_model=$"../../right_hand/smg"
@onready var sniper_model=$"../../right_hand/sniper"
@onready var shotgun_model=$"../../right_hand/shotgun"
@onready var machine_gun_model=$"../../right_hand/machine_gun"

func rifle_reload1_audio_event():
	if player_master.player_die==false:
		var rifle_1_audio=preload("res://assets/audios/my_weapon_audio/rifle/rifle_reload_1_audio.tscn")
		var rfa=rifle_1_audio.instantiate()
		rfa.position=rifle_model.global_position
		rfa.rotation_degrees=rifle_model.global_rotation_degrees
		player_master.scene_root.add_child(rfa)
func rifle_reload2_audio_event():
	if player_master.player_die==false:
		var rifle_2_audio=preload("res://assets/audios/my_weapon_audio/rifle/rifle_reload_2_audio.tscn")
		var rfa=rifle_2_audio.instantiate()
		rfa.position=rifle_model.global_position
		rfa.rotation_degrees=rifle_model.global_rotation_degrees
		player_master.scene_root.add_child(rfa)
func pistol_reload1_audio_event():
	if player_master.player_die==false:
		var pistol_1_audio=preload("res://assets/audios/my_weapon_audio/pistol/pistol_reload_1_audio.tscn")
		var pa=pistol_1_audio.instantiate()
		pa.position=pistol_model.global_position
		pa.rotation_degrees=pistol_model.global_rotation_degrees
		player_master.scene_root.add_child(pa)
func pistol_reload2_audio_event():
	if player_master.player_die==false:
		var pistol_2_audio=preload("res://assets/audios/my_weapon_audio/pistol/pistol_reload_2_audio.tscn")
		var pa=pistol_2_audio.instantiate()
		pa.position=pistol_model.global_position
		pa.rotation_degrees=pistol_model.global_rotation_degrees
		player_master.scene_root.add_child(pa)
func smg_reload1_audio_event():
	if player_master.player_die==false:
		var smg_1_audio=preload("res://assets/audios/my_weapon_audio/smg/smg_reload_1_audio.tscn")
		var sa=smg_1_audio.instantiate()
		sa.position=smg_model.global_position
		sa.rotation_degrees=smg_model.global_rotation_degrees
		player_master.scene_root.add_child(sa)
func smg_reload2_audio_event():
	if player_master.player_die==false:
		var smg_2_audio=preload("res://assets/audios/my_weapon_audio/smg/smg_reload_2_audio.tscn")
		var sa=smg_2_audio.instantiate()
		sa.position=smg_model.global_position
		sa.rotation_degrees=smg_model.global_rotation_degrees
		player_master.scene_root.add_child(sa)
func sniper_reload1_audio_event():
	if player_master.player_die==false:
		var sniper_1_audio=preload("res://assets/audios/my_weapon_audio/sniper/sniper_reload_1_audio.tscn")
		var sa=sniper_1_audio.instantiate()
		sa.position=sniper_model.global_position
		sa.rotation_degrees=sniper_model.global_rotation_degrees
		player_master.scene_root.add_child(sa)
func sniper_reload2_audio_event():
	if player_master.player_die==false:
		var sniper_2_audio=preload("res://assets/audios/my_weapon_audio/sniper/sniper_reload_2_audio.tscn")
		var sa=sniper_2_audio.instantiate()
		sa.position=sniper_model.global_position
		sa.rotation_degrees=sniper_model.global_rotation_degrees
		player_master.scene_root.add_child(sa)
func sniper_reload_rock_audio_event():
	if player_master.player_die==false:
		var sniper_rock_audio=preload("res://assets/audios/my_weapon_audio/sniper/sniper_rock_audio.tscn")
		var sa=sniper_rock_audio.instantiate()
		sa.position=sniper_model.global_position
		sa.rotation_degrees=sniper_model.global_rotation_degrees
		player_master.scene_root.add_child(sa)
func shotgun_reload_rock_audio_event():
	if player_master.player_die==false:
		var shotgun_rock_audio=preload("res://assets/audios/my_weapon_audio/shotgun/shotgun_reload_rock_audio.tscn")
		var sa=shotgun_rock_audio.instantiate()
		sa.position=shotgun_model.global_position
		sa.rotation_degrees=shotgun_model.global_rotation_degrees
		player_master.scene_root.add_child(sa)
func shotgun_reload_audio_event():
	if player_master.player_die==false:
		var shotgun_rock_audio=preload("res://assets/audios/my_weapon_audio/shotgun/shotgun_reloading_ammo_audio.tscn")
		var sa=shotgun_rock_audio.instantiate()
		sa.position=shotgun_model.global_position
		sa.rotation_degrees=shotgun_model.global_rotation_degrees
		player_master.scene_root.add_child(sa)
func machine_gun_reload1_audio_event():
	if player_master.player_die==false:
		var machine_gun_1_audio=preload("res://assets/audios/my_weapon_audio/machine_gun/machine_gun_reload_1_audio.tscn")
		var ma=machine_gun_1_audio.instantiate()
		ma.position=machine_gun_model.global_position
		ma.rotation_degrees=machine_gun_model.global_rotation_degrees
		player_master.scene_root.add_child(ma)
func machine_gun_reload2_audio_event():
	if player_master.player_die==false:
		var machine_gun_2_audio=preload("res://assets/audios/my_weapon_audio/machine_gun/machine_gun_reload_2_audio.tscn")
		var ma=machine_gun_2_audio.instantiate()
		ma.position=machine_gun_model.global_position
		ma.rotation_degrees=machine_gun_model.global_rotation_degrees
		player_master.scene_root.add_child(ma)
func machine_gun_reload3_audio_event():
	if player_master.player_die==false:
		var machine_gun_3_audio=preload("res://assets/audios/my_weapon_audio/machine_gun/machine_gun_reload_3_audio.tscn")
		var ma=machine_gun_3_audio.instantiate()
		ma.position=machine_gun_model.global_position
		ma.rotation_degrees=machine_gun_model.global_rotation_degrees
		player_master.scene_root.add_child(ma)
func machine_gun_reload4_audio_event():
	if player_master.player_die==false:
		var machine_gun_4_audio=preload("res://assets/audios/my_weapon_audio/machine_gun/machine_gun_reload_4_audio.tscn")
		var ma=machine_gun_4_audio.instantiate()
		ma.position=machine_gun_model.global_position
		ma.rotation_degrees=machine_gun_model.global_rotation_degrees
		player_master.scene_root.add_child(ma)
