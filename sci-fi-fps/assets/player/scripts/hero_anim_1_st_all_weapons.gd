extends Node3D
@onready var player_master=$".."
var player_models=[]

@onready var right_hand=$Skeleton/Skeleton3D/right_hand
@onready var scene_root=$"..".scene_root

@onready var camera_main=$Camera3D_main
@onready var camera_idle_pos_node=$camera_idle_pos
@onready var camera_aiming_pos_node=$Camera3D_aiming
@onready var sniper_camera=$Camera3D_sniper

@onready var sub_camera_main=$SubViewportContainer/SubViewport/Camera3D_sub
@onready var sub_sniper_camera_main=$SubViewportContainer/SubViewport/Camera3D_sniper_sub

@onready var player_1st_animation_tree=$AnimationPlayer/AnimationTree


@onready var rifle_model=$Skeleton/Skeleton3D/right_hand/rifle
@onready var pistol_model=$Skeleton/Skeleton3D/right_hand/pistol
@onready var smg_model=$Skeleton/Skeleton3D/right_hand/smg
@onready var sniper_model=$Skeleton/Skeleton3D/right_hand/sniper
@onready var shotgun_model=$Skeleton/Skeleton3D/right_hand/shotgun
@onready var machine_gun_model=$Skeleton/Skeleton3D/right_hand/machine_gun

@onready var rifle_mag_model=$Skeleton/Skeleton3D/left_hand/rifle1_mag
@onready var pistol_mag_model=$Skeleton/Skeleton3D/left_hand/pistol1_mag
@onready var smg_mag_model=$Skeleton/Skeleton3D/left_hand/smg1_mag
@onready var sniper_mag_model=$Skeleton/Skeleton3D/left_hand/sniper1_mag
@onready var shotgun_mag_model=$Skeleton/Skeleton3D/left_hand/shotgun_ammo_model_1st
@onready var machine_gun_mag_model=$Skeleton/Skeleton3D/left_hand/machine_gun_mag_1st

@onready var sniper_zoom_ui=$SubViewportContainer/SubViewport/Camera3D_sniper_sub/zoom_texture
@onready var weapon_change_ui=$CanvasLayer/screen/weapons_change_class_1


@onready var TDM_ui=$CanvasLayer/screen/TDM_UI
@onready var blue_score_node_ui=$CanvasLayer/screen/TDM_UI/blue_score/Label_blue
@onready var red_score_node_ui=$CanvasLayer/screen/TDM_UI/red_score/Label_red

@onready var FFA_ui=$CanvasLayer/screen/FAA_UI
@onready var player_score_node_ui=$CanvasLayer/screen/FAA_UI/player_score/Label_player

@onready var game_time_ui=$CanvasLayer/screen/game_time/time_label

@onready var victory_icon=$CanvasLayer/screen/TDM_UI/game_result/victory
@onready var draw_icon=$CanvasLayer/screen/TDM_UI/game_result/draw
@onready var defeat_icon=$CanvasLayer/screen/TDM_UI/game_result/defeat
@onready var game_over_icon=$CanvasLayer/screen/FAA_UI/game_result/game_over


var weapon_change_alert_timer=0








@onready var sub_viewport_ui=$SubViewportContainer






@onready var arms_mod=$Skeleton/Skeleton3D/armor_arms
@onready var hand_mod=$Skeleton/Skeleton3D/armor_hand
@onready var shouder_mod=$Skeleton/Skeleton3D/armor_shouder
@onready var body_mod=$Skeleton/Skeleton3D/skin_body


@onready var jump_audio_node=$jump_audio
var machine_gun_ammos_models=[]
func _ready() -> void:
	player_models.append($Skeleton/Skeleton3D/armor_arms)
	player_models.append($Skeleton/Skeleton3D/armor_hand)
	player_models.append($Skeleton/Skeleton3D/armor_shouder)
	player_models.append($Skeleton/Skeleton3D/skin_body)
	
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(0)
	
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D2)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D3)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D4)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D5)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D6)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D7)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D8)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D9)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D10)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D11)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D12)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D13)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D14)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D15)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D16)
	machine_gun_ammos_models.append($Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D17)

func _process(delta: float) -> void:
	$CanvasLayer/screen/rifle_crosshair/rifle_crosshair_2d.scale=Vector2(UserData.crosshair_data,UserData.crosshair_data)
	$CanvasLayer/screen/pistol_crosshair/pistol_crosshair_2d.scale=Vector2(UserData.crosshair_data,UserData.crosshair_data)
	$CanvasLayer/screen/smg_crosshair/smg_crosshair_2d.scale=Vector2(UserData.crosshair_data,UserData.crosshair_data)
	$CanvasLayer/screen/sniper_crosshair/hit.scale=Vector2(UserData.crosshair_data,UserData.crosshair_data)
	$CanvasLayer/screen/shotgun_crosshair/shot_gun_crosshair.scale=Vector2(UserData.crosshair_data,UserData.crosshair_data)
	$CanvasLayer/screen/machine_gun_crosshair/machine_gun_crosshair2.scale=Vector2(UserData.crosshair_data,UserData.crosshair_data)
	
	
	$SubViewportContainer/SubViewport/Camera3D_sub.global_transform=$Camera3D_main.global_transform
	$SubViewportContainer/SubViewport/Camera3D_sniper_sub.global_transform=$Camera3D_sniper.global_transform
	#if Input.is_action_just_pressed("start_test"):
	#	start_game_ui_event()
	#	$"..".player_can_move()
	if $CanvasLayer/screen/alert_change_weapon.visible==true:
		weapon_change_alert_timer+=delta
	if weapon_change_alert_timer>=1:
		$CanvasLayer/screen/alert_change_weapon.visible=false
		weapon_change_alert_timer=0
	
	if $"..".machine_gun_current_ammos==17:
		machine_gun_ammos_models[16].visible=false
	if $"..".machine_gun_current_ammos==16:
		machine_gun_ammos_models[15].visible=false
	if $"..".machine_gun_current_ammos==15:
		machine_gun_ammos_models[14].visible=false
	if $"..".machine_gun_current_ammos==14:
		machine_gun_ammos_models[13].visible=false
	if $"..".machine_gun_current_ammos==13:
		machine_gun_ammos_models[12].visible=false
	if $"..".machine_gun_current_ammos==12:
		machine_gun_ammos_models[11].visible=false
	if $"..".machine_gun_current_ammos==11:
		machine_gun_ammos_models[10].visible=false
	if $"..".machine_gun_current_ammos==10:
		machine_gun_ammos_models[9].visible=false
	if $"..".machine_gun_current_ammos==9:
		machine_gun_ammos_models[8].visible=false
	if $"..".machine_gun_current_ammos==8:
		machine_gun_ammos_models[7].visible=false
	if $"..".machine_gun_current_ammos==7:
		machine_gun_ammos_models[6].visible=false
	if $"..".machine_gun_current_ammos==6:
		machine_gun_ammos_models[5].visible=false
	if $"..".machine_gun_current_ammos==5:
		machine_gun_ammos_models[4].visible=false
	if $"..".machine_gun_current_ammos==4:
		machine_gun_ammos_models[3].visible=false
	if $"..".machine_gun_current_ammos==3:
		machine_gun_ammos_models[2].visible=false
	if $"..".machine_gun_current_ammos==2:
		machine_gun_ammos_models[1].visible=false
	if $"..".machine_gun_current_ammos==1:
		machine_gun_ammos_models[0].visible=false
	
	
func gun_shoot_anim_event():
	$"..".gun_shoot_anim_event()
	#$Skeleton/Skeleton3D/right_hand/sniper/ammo_rig_position/ammo_sniper_anim_model.visible=true
	#$Skeleton/Skeleton3D/right_hand/sniper/ammo_rig_position/ammo_sniper_anim_model.set_layer_mask_value(7,true)

func recoil_idle_force_on():
	$"..".recoil_idle_force_on()

func recoil_aiming_force_on():
	$"..".recoil_aiming_force_on()

func recoil_force_off():
	$"..".recoil_force_off()

func reloading1_anim_event_start():#handle
	if $"..".using_weapon=="rifle":
		pass
	if $"..".using_weapon=="pistol":
		pass
	if $"..".using_weapon=="smg":
		pass
	if $"..".using_weapon=="sniper":
		pass
	if $"..".using_weapon=="shotgun":
		pass
	if $"..".using_weapon=="machine_gun":
		pass
func reloading1_anim_event_end():#handle
	if $"..".using_weapon=="rifle":
		pass
	if $"..".using_weapon=="pistol":
		pass
	if $"..".using_weapon=="smg":
		pass
	if $"..".using_weapon=="sniper":
		#$Skeleton/Skeleton3D/right_hand/sniper/ammo_rig_position/ammo_sniper_anim_model.visible=false
		#$Skeleton/Skeleton3D/right_hand/sniper/ammo_rig_position/ammo_sniper_anim_model.set_layer_mask_value(7,false)
		var sniper_ammo_rig_1st=preload("res://assets/player/prefab/sniper1_ammo_1st_rig.tscn")
		var sar=sniper_ammo_rig_1st.instantiate()
		sar.global_transform=$Skeleton/Skeleton3D/right_hand/sniper/ammo_rig_position.global_transform
		$"..".scene_root.add_child(sar)
		sar.apply_impulse($Skeleton/Skeleton3D/right_hand/sniper/ammo_rig_position.get_global_transform().basis.x.normalized()*10)

	if $"..".using_weapon=="shotgun":
		var shotgun_ammo_rig_1st=preload("res://assets/player/prefab/shotgun_ammo_1st_rig.tscn")
		var str=shotgun_ammo_rig_1st.instantiate()
		str.global_transform=$Skeleton/Skeleton3D/right_hand/shotgun/ammo_rig_position.global_transform
		$"..".scene_root.add_child(str)
		str.apply_impulse($Skeleton/Skeleton3D/right_hand/shotgun/ammo_rig_position.get_global_transform().basis.y.normalized()*-10)
	if $"..".using_weapon=="machine_gun":
		pass
func reloading2_anim_event_start():#mag
	if $"..".using_weapon=="rifle"&&player_master.player_die==false:
		rifle_model.mag_model_node.visible=false
		var rifle_mag_rig_1st=preload("res://assets/player/prefab/rifle1_mag_1st_rig.tscn")
		var rmrig=rifle_mag_rig_1st.instantiate()
		rmrig.transform=rifle_model.mag_model_node.global_transform
		$"..".scene_root.add_child(rmrig)
		
	if $"..".using_weapon=="pistol"&&player_master.player_die==false:
		pistol_model.mag_model_node.visible=false
		
		var pistol_mag_rig_1st=preload("res://assets/player/prefab/pistol1_mag_1st_rig.tscn")
		var pmrig=pistol_mag_rig_1st.instantiate()
		pmrig.transform=pistol_model.mag_model_node.global_transform
		$"..".scene_root.add_child(pmrig)
		
	if $"..".using_weapon=="smg"&&player_master.player_die==false:
		smg_model.mag_model_node.visible=false
		
		var smg_mag_rig_1st=preload("res://assets/player/prefab/smg1_mag_1st_rig.tscn")
		var smrig=smg_mag_rig_1st.instantiate()
		smrig.transform=smg_model.mag_model_node.global_transform
		$"..".scene_root.add_child(smrig)
		
	if $"..".using_weapon=="sniper"&&player_master.player_die==false:
		sniper_model.mag_model_node.visible=false
		
		var sniper_mag_rig_1st=preload("res://assets/player/prefab/sniper1_mag_1st_rig.tscn")
		var ssmrig=sniper_mag_rig_1st.instantiate()
		ssmrig.transform=sniper_model.mag_model_node.global_transform
		$"..".scene_root.add_child(ssmrig)
		
	if $"..".using_weapon=="shotgun"&&player_master.player_die==false:
		pass
	if $"..".using_weapon=="machine_gun"&&player_master.player_die==false:
		machine_gun_model.mag_model_node.visible=false
		machine_gun_mag_model.visible=true
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos.visible=false

func reloading2_anim_event_halfway():
	if $"..".using_weapon=="rifle":
		rifle_mag_model.visible=true
	if $"..".using_weapon=="pistol":
		pistol_mag_model.visible=true
	if $"..".using_weapon=="smg":
		smg_mag_model.visible=true
	if $"..".using_weapon=="sniper":
		sniper_mag_model.visible=true
	if $"..".using_weapon=="shotgun":
		pass
	if $"..".using_weapon=="machine_gun":
		machine_gun_model.mag_model_node.visible=true
		machine_gun_mag_model.visible=false
	
func reloading2_anim_event_end():#mag
	if $"..".using_weapon=="rifle":
		rifle_model.mag_model_node.visible=true
		rifle_mag_model.visible=false
	if $"..".using_weapon=="pistol":
		pistol_model.mag_model_node.visible=true
		pistol_mag_model.visible=false
	if $"..".using_weapon=="smg":
		smg_model.mag_model_node.visible=true
		smg_mag_model.visible=false
	if $"..".using_weapon=="sniper":
		sniper_model.mag_model_node.visible=true
		sniper_mag_model.visible=false
	if $"..".using_weapon=="shotgun":
		pass
	if $"..".using_weapon=="machine_gun":
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos.visible=true
		for av in range(machine_gun_ammos_models.size()-1):
			machine_gun_ammos_models[av].visible=true


func reloading_ammos_anim_event():
	$"..".reloading_ammos_anim_event()

@onready var ui_animation_tree=$CanvasLayer/AnimationPlayer_ui/AnimationTree_ui
@onready var ammos_ui=$CanvasLayer/screen/ammos_panel/ammos/board/Ammo5/ammos
@onready var health_ui=$CanvasLayer/screen/health_panel/health

@onready var ECG_anim=$CanvasLayer/screen/health_panel/health/ui2/ECG

@onready var rifle_crosshair_visible=$CanvasLayer/screen/rifle_crosshair/rifle_crosshair_2d
@onready var pistol_crosshair_visible=$CanvasLayer/screen/pistol_crosshair/pistol_crosshair_2d
@onready var smg_crosshair_visible=$CanvasLayer/screen/smg_crosshair/smg_crosshair_2d
@onready var shotgun_crosshair_visible=$CanvasLayer/screen/shotgun_crosshair/shot_gun_crosshair
@onready var machine_gun_crosshair_visible=$CanvasLayer/screen/machine_gun_crosshair/machine_gun_crosshair2
@onready var aiming_shoot_hit_crosshair=$CanvasLayer/screen/aiming_shoot_hit/hit2

@onready var rifle_weapon_icon=$CanvasLayer/screen/ammos_panel/ammos/weapons/RifleTW
@onready var pistol_weapon_icon=$CanvasLayer/screen/ammos_panel/ammos/weapons/PistolTW
@onready var smg_weapon_icon=$CanvasLayer/screen/ammos_panel/ammos/weapons/SmgTW
@onready var sniper_weapon_icon=$CanvasLayer/screen/ammos_panel/ammos/weapons/SniperTW
@onready var shotgun_weapon_icon=$CanvasLayer/screen/ammos_panel/ammos/weapons/ShotgunTW
@onready var machine_gun_weapon_icon=$CanvasLayer/screen/ammos_panel/ammos/weapons/MachineGunTW

@onready var pause_menu_ui=$CanvasLayer/screen/pause_menu
func start_game_ui_event():
	ui_animation_tree["parameters/health_ammo/transition_request"]="step2"
	

func player_can_move():
	$"..".player_can_move()

func crosshair_shoot_anim_event():
	$"..".crosshair_shoot_anim_event()
func crosshair_hit_anim_event():
	$"..".crosshair_hit_anim_event()

func saturation_event_player():
	if $"..".scene_root.has_method("scene_saturation_event"):
		$"..".scene_root.scene_saturation_event()

func game_pause_anim_event():
	pass

func game_continue_anim_event():
	pass


func _on_class_1_mouse_entered() -> void:
	$CanvasLayer/screen/weapons_change_class_1/MarginContainer/VBoxContainer/class1.modulate=Color(0,0.7,0.9)


func _on_class_1_mouse_exited() -> void:
	$CanvasLayer/screen/weapons_change_class_1/MarginContainer/VBoxContainer/class1.modulate=Color(1,1,1,1)


func _on_class_1_gui_input(event: InputEvent) -> void:
	if weapon_change_ui.visible==true:
		if event is InputEventMouseButton and event.pressed:
				match event.button_index:
					MOUSE_BUTTON_LEFT:
						player_master.set_weapon_type("rifle_man")
						$CanvasLayer/screen/alert_change_weapon.visible=true


func _on_class_2_mouse_entered() -> void:
	$CanvasLayer/screen/weapons_change_class_1/MarginContainer/VBoxContainer/class2.modulate=Color(0,0.7,0.9)


func _on_class_2_mouse_exited() -> void:
	$CanvasLayer/screen/weapons_change_class_1/MarginContainer/VBoxContainer/class2.modulate=Color(1,1,1,1)


func _on_class_2_gui_input(event: InputEvent) -> void:
	if weapon_change_ui.visible==true:
		if event is InputEventMouseButton and event.pressed:
				match event.button_index:
					MOUSE_BUTTON_LEFT:
						player_master.set_weapon_type("smg_man")
						$CanvasLayer/screen/alert_change_weapon.visible=true


func _on_class_3_mouse_entered() -> void:
	$CanvasLayer/screen/weapons_change_class_1/MarginContainer/VBoxContainer/class3.modulate=Color(0,0.7,0.9)


func _on_class_3_mouse_exited() -> void:
	$CanvasLayer/screen/weapons_change_class_1/MarginContainer/VBoxContainer/class3.modulate=Color(1,1,1,1)


func _on_class_3_gui_input(event: InputEvent) -> void:
	if weapon_change_ui.visible==true:
		if event is InputEventMouseButton and event.pressed:
				match event.button_index:
					MOUSE_BUTTON_LEFT:
						player_master.set_weapon_type("shotgun_man")
						$CanvasLayer/screen/alert_change_weapon.visible=true


func _on_class_4_mouse_entered() -> void:
	$CanvasLayer/screen/weapons_change_class_1/MarginContainer/VBoxContainer/class4.modulate=Color(0,0.7,0.9)


func _on_class_4_mouse_exited() -> void:
	$CanvasLayer/screen/weapons_change_class_1/MarginContainer/VBoxContainer/class4.modulate=Color(1,1,1,1)


func _on_class_4_gui_input(event: InputEvent) -> void:
	if weapon_change_ui.visible==true:
		if event is InputEventMouseButton and event.pressed:
				match event.button_index:
					MOUSE_BUTTON_LEFT:
						player_master.set_weapon_type("sniper_man")
						$CanvasLayer/screen/alert_change_weapon.visible=true


func _on_class_5_mouse_entered() -> void:
	$CanvasLayer/screen/weapons_change_class_1/MarginContainer/VBoxContainer/class5.modulate=Color(0,0.7,0.9)


func _on_class_5_mouse_exited() -> void:
	$CanvasLayer/screen/weapons_change_class_1/MarginContainer/VBoxContainer/class5.modulate=Color(1,1,1,1)


func _on_class_5_gui_input(event: InputEvent) -> void:
	if weapon_change_ui.visible==true:
		if event is InputEventMouseButton and event.pressed:
				match event.button_index:
					MOUSE_BUTTON_LEFT:
						player_master.set_weapon_type("machine_gun_man")
						$CanvasLayer/screen/alert_change_weapon.visible=true


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
