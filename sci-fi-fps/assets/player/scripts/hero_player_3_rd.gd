extends CharacterBody3D
@export_enum("1st","3rd") var view_mode_player: int
var control_lock=false
var player_models=[]
var using_weapon="rifle"
@export var player_health=100
@export var user_name:String
@export var charactor_color:String
@export var TDM_team:String
var player_die=false
var game_pause=false
@onready var anim_tree_3rd=$AnimationPlayer/AnimationTree
var hand_state_3rd_anim=null
var hand_state_3rd_anim2=null

var anim_tree_1st=null
var hand_state_1st_anim=null
var hand_state_1st_anim2=null

var first_ready=false
@onready var scene_root=$"../../.."


@onready var rifle_model=$Skeleton/Skeleton3D/right_hand/rifle
@onready var pistol_model=$Skeleton/Skeleton3D/right_hand/pistol
@onready var smg_model=$Skeleton/Skeleton3D/right_hand/smg
@onready var sniper_model=$Skeleton/Skeleton3D/right_hand/sniper
@onready var shotgun_model=$Skeleton/Skeleton3D/right_hand/shotgun
@onready var machine_gun_model=$Skeleton/Skeleton3D/right_hand/machine_gun

@onready var sword_model=$Skeleton/Skeleton3D/right_hand/sword

@onready var grenade_fire_model=$Skeleton/Skeleton3D/right_hand/grenade_fire
@onready var grenade_smoke_model=$Skeleton/Skeleton3D/right_hand/grenade_smoke
@onready var grenade_flash_model=$Skeleton/Skeleton3D/right_hand/grenade_flash

@onready var rifle_mag_model=$Skeleton/Skeleton3D/left_hand/rifle1_mag
@onready var pistol_mag_model=$Skeleton/Skeleton3D/left_hand/pistol1_mag
@onready var smg_mag_model=$Skeleton/Skeleton3D/left_hand/smg1_mag
@onready var sniper_mag_model=$Skeleton/Skeleton3D/left_hand/sniper1_mag
@onready var shotgun_mag_model=$Skeleton/Skeleton3D/thumb_left/shotgun_ammo_model_3rd
@onready var machine_gun_mag_model=$Skeleton/Skeleton3D/left_hand/machine_gun_mag_3rd


@onready var arms_white_material=preload("res://assets/player/charactor_color_materials/white/arms_white.tres")
@onready var body1_white_material=preload("res://assets/player/charactor_color_materials/white/body1_white.tres")
@onready var body1_2_white_material=preload("res://assets/player/charactor_color_materials/white/body1-2_white.tres")
@onready var body2_white_material=preload("res://assets/player/charactor_color_materials/white/body2_white.tres")
@onready var hand_white_material=preload("res://assets/player/charactor_color_materials/white/hand_white.tres")
@onready var head1_white_material=preload("res://assets/player/charactor_color_materials/white/head_1_white.tres")
@onready var head2_white_material=preload("res://assets/player/charactor_color_materials/white/head_2_white.tres")
@onready var head3_white_material=preload("res://assets/player/charactor_color_materials/white/head_3_white.tres")
@onready var hip_white_material=preload("res://assets/player/charactor_color_materials/white/hip_white.tres")
@onready var leg_down_white_material=preload("res://assets/player/charactor_color_materials/white/leg_down_white.tres")
@onready var leg_up_white_material=preload("res://assets/player/charactor_color_materials/white/leg_up_white.tres")
@onready var shoes_white_material=preload("res://assets/player/charactor_color_materials/white/shoes_white.tres")
@onready var shouder_white_material=preload("res://assets/player/charactor_color_materials/white/shouder_white.tres")
@onready var skin_body_white_material=preload("res://assets/player/charactor_color_materials/white/skin_body_white.tres")


@onready var arms_blue_material=preload("res://assets/player/charactor_color_materials/blue/arms_blue.tres")
@onready var body1_blue_material=preload("res://assets/player/charactor_color_materials/blue/body1_blue.tres")
@onready var body1_2_blue_material=preload("res://assets/player/charactor_color_materials/blue/blue_1-2_blue.tres")
@onready var body2_blue_material=preload("res://assets/player/charactor_color_materials/blue/body2_blue.tres")
@onready var hand_blue_material=preload("res://assets/player/charactor_color_materials/blue/hand_blue.tres")
@onready var head1_blue_material=preload("res://assets/player/charactor_color_materials/blue/head_1_blue.tres")
@onready var head2_blue_material=preload("res://assets/player/charactor_color_materials/blue/head_2_blue.tres")
@onready var head3_blue_material=preload("res://assets/player/charactor_color_materials/blue/head_3_blue.tres")
@onready var hip_blue_material=preload("res://assets/player/charactor_color_materials/blue/hip_blue.tres")
@onready var leg_down_blue_material=preload("res://assets/player/charactor_color_materials/blue/leg_down_blue.tres")
@onready var leg_up_blue_material=preload("res://assets/player/charactor_color_materials/blue/leg_up_blue.tres")
@onready var shoes_blue_material=preload("res://assets/player/charactor_color_materials/blue/shoes_blue.tres")
@onready var shouder_blue_material=preload("res://assets/player/charactor_color_materials/blue/shouder_blue.tres")
@onready var skin_body_blue_material=preload("res://assets/player/charactor_color_materials/blue/skin_body_bluetres.tres")


@onready var arms_red_material=preload("res://assets/player/charactor_color_materials/red/arms_red.tres")
@onready var body1_red_material=preload("res://assets/player/charactor_color_materials/red/body1_red.tres")
@onready var body1_2_red_material=preload("res://assets/player/charactor_color_materials/red/body1-2_red.tres")
@onready var body2_red_material=preload("res://assets/player/charactor_color_materials/red/body2_red.tres")
@onready var hand_red_material=preload("res://assets/player/charactor_color_materials/red/hand_red.tres")
@onready var head1_red_material=preload("res://assets/player/charactor_color_materials/red/head_1_red.tres")
@onready var head2_red_material=preload("res://assets/player/charactor_color_materials/red/head_2_red.tres")
@onready var head3_red_material=preload("res://assets/player/charactor_color_materials/red/head_3_red.tres")
@onready var hip_red_material=preload("res://assets/player/charactor_color_materials/red/hip_red.tres")
@onready var leg_down_red_material=preload("res://assets/player/charactor_color_materials/red/leg_down_red.tres")
@onready var leg_up_red_material=preload("res://assets/player/charactor_color_materials/red/leg_up_red.tres")
@onready var shoes_red_material=preload("res://assets/player/charactor_color_materials/red/shoes_red.tres")
@onready var shouder_red_material=preload("res://assets/player/charactor_color_materials/red/shouder_red.tres")
@onready var skin_body_red_material=preload("res://assets/player/charactor_color_materials/red/skin_body_red.tres")


func _ready() -> void:
	mouse_speed_main=UserData.mouse_seveitivity_data
	if charactor_color=="white":
		$Skeleton/Skeleton3D/armor_arms.set_surface_override_material(0,arms_white_material)
		$Skeleton/Skeleton3D/armor_body.set_surface_override_material(0,body1_white_material)
		$Skeleton/Skeleton3D/armor_body.set_surface_override_material(1,body1_2_white_material)
		$Skeleton/Skeleton3D/armor_body_2.set_surface_override_material(0,body2_white_material)
		$Skeleton/Skeleton3D/armor_hand.set_surface_override_material(0,hand_white_material)
		$Skeleton/Skeleton3D/armor_head.set_surface_override_material(0,head1_white_material)
		$Skeleton/Skeleton3D/armor_head.set_surface_override_material(1,head2_white_material)
		$Skeleton/Skeleton3D/armor_head.set_surface_override_material(2,head3_white_material)
		$Skeleton/Skeleton3D/armor_hip.set_surface_override_material(0,hip_white_material)
		$Skeleton/Skeleton3D/armor_leg_down.set_surface_override_material(0,leg_down_white_material)
		$Skeleton/Skeleton3D/armor_leg_up.set_surface_override_material(0,leg_up_white_material)
		$Skeleton/Skeleton3D/armor_shoes.set_surface_override_material(0,shoes_white_material)
		$Skeleton/Skeleton3D/armor_shouder.set_surface_override_material(0,shouder_white_material)
		$Skeleton/Skeleton3D/skin_body.set_surface_override_material(0,skin_body_white_material)
		
		
		$hero_anim_1st_all_weapons.arms_mod.set_surface_override_material(0,arms_white_material)
		$hero_anim_1st_all_weapons.hand_mod.set_surface_override_material(0,hand_white_material)
		$hero_anim_1st_all_weapons.shouder_mod.set_surface_override_material(0,shouder_white_material)
		$hero_anim_1st_all_weapons.body_mod.set_surface_override_material(0,skin_body_white_material)
	if charactor_color=="blue":
		$Skeleton/Skeleton3D/armor_arms.set_surface_override_material(0,arms_blue_material)
		$Skeleton/Skeleton3D/armor_body.set_surface_override_material(0,body1_blue_material)
		$Skeleton/Skeleton3D/armor_body.set_surface_override_material(1,body1_2_blue_material)
		$Skeleton/Skeleton3D/armor_body_2.set_surface_override_material(0,body2_blue_material)
		$Skeleton/Skeleton3D/armor_hand.set_surface_override_material(0,hand_blue_material)
		$Skeleton/Skeleton3D/armor_head.set_surface_override_material(0,head1_blue_material)
		$Skeleton/Skeleton3D/armor_head.set_surface_override_material(1,head2_blue_material)
		$Skeleton/Skeleton3D/armor_head.set_surface_override_material(2,head3_blue_material)
		$Skeleton/Skeleton3D/armor_hip.set_surface_override_material(0,hip_blue_material)
		$Skeleton/Skeleton3D/armor_leg_down.set_surface_override_material(0,leg_down_blue_material)
		$Skeleton/Skeleton3D/armor_leg_up.set_surface_override_material(0,leg_up_blue_material)
		$Skeleton/Skeleton3D/armor_shoes.set_surface_override_material(0,shoes_blue_material)
		$Skeleton/Skeleton3D/armor_shouder.set_surface_override_material(0,shouder_blue_material)
		$Skeleton/Skeleton3D/skin_body.set_surface_override_material(0,skin_body_blue_material)
		
		
		$hero_anim_1st_all_weapons.arms_mod.set_surface_override_material(0,arms_blue_material)
		$hero_anim_1st_all_weapons.hand_mod.set_surface_override_material(0,hand_blue_material)
		$hero_anim_1st_all_weapons.shouder_mod.set_surface_override_material(0,shouder_blue_material)
		$hero_anim_1st_all_weapons.body_mod.set_surface_override_material(0,skin_body_blue_material)
	if charactor_color=="red":
		$Skeleton/Skeleton3D/armor_arms.set_surface_override_material(0,arms_red_material)
		$Skeleton/Skeleton3D/armor_body.set_surface_override_material(0,body1_red_material)
		$Skeleton/Skeleton3D/armor_body.set_surface_override_material(1,body1_2_red_material)
		$Skeleton/Skeleton3D/armor_body_2.set_surface_override_material(0,body2_red_material)
		$Skeleton/Skeleton3D/armor_hand.set_surface_override_material(0,hand_red_material)
		$Skeleton/Skeleton3D/armor_head.set_surface_override_material(0,head1_red_material)
		$Skeleton/Skeleton3D/armor_head.set_surface_override_material(1,head2_red_material)
		$Skeleton/Skeleton3D/armor_head.set_surface_override_material(2,head3_red_material)
		$Skeleton/Skeleton3D/armor_hip.set_surface_override_material(0,hip_red_material)
		$Skeleton/Skeleton3D/armor_leg_down.set_surface_override_material(0,leg_down_red_material)
		$Skeleton/Skeleton3D/armor_leg_up.set_surface_override_material(0,leg_up_red_material)
		$Skeleton/Skeleton3D/armor_shoes.set_surface_override_material(0,shoes_red_material)
		$Skeleton/Skeleton3D/armor_shouder.set_surface_override_material(0,shouder_red_material)
		$Skeleton/Skeleton3D/skin_body.set_surface_override_material(0,skin_body_red_material)
		
		
		$hero_anim_1st_all_weapons.arms_mod.set_surface_override_material(0,arms_red_material)
		$hero_anim_1st_all_weapons.hand_mod.set_surface_override_material(0,hand_red_material)
		$hero_anim_1st_all_weapons.shouder_mod.set_surface_override_material(0,shouder_red_material)
		$hero_anim_1st_all_weapons.body_mod.set_surface_override_material(0,skin_body_red_material)
		
	
	#using_weapon=["rifle","pistol","smg","sniper","shotgun","machine_gun"].pick_random()
	if player_type=="rifle_man":
		using_weapon="rifle"
	if player_type=="smg_man":
		using_weapon="smg"
	if player_type=="shotgun_man":
		using_weapon="shotgun"
	if player_type=="sniper_man":
		using_weapon="sniper"
	if player_type=="machine_gun_man":
		using_weapon="machine_gun"
	
	set_floor_snap_length(10)
	rifle_model.player_master=self
	pistol_model.player_master=self
	smg_model.player_master=self
	sniper_model.player_master=self
	shotgun_model.player_master=self
	machine_gun_model.player_master=self
	
	sword_model.player_master=self
	
	grenade_fire_model.player_master=self
	grenade_smoke_model.player_master=self
	grenade_flash_model.player_master=self
	
	rifle_mag_model.player_master=self
	pistol_mag_model.player_master=self
	smg_mag_model.player_master=self
	sniper_mag_model.player_master=self
	shotgun_mag_model.player_master=self
	machine_gun_mag_model.player_master=self
	
	anim_tree_1st=$hero_anim_1st_all_weapons.player_1st_animation_tree
	hand_state_1st_anim=$hero_anim_1st_all_weapons.player_1st_animation_tree["parameters/StateMachine/playback"]
	hand_state_1st_anim2=$hero_anim_1st_all_weapons.player_1st_animation_tree["parameters/move/1/playback"]
	
	hand_state_3rd_anim=anim_tree_3rd["parameters/StateMachine/playback"]
	hand_state_3rd_anim2=anim_tree_3rd["parameters/move/0/playback"]
	
	player_models.append($Skeleton/Skeleton3D/armor_arms)
	player_models.append($Skeleton/Skeleton3D/armor_body)
	player_models.append($Skeleton/Skeleton3D/armor_body_2)
	player_models.append($Skeleton/Skeleton3D/armor_hand)
	player_models.append($Skeleton/Skeleton3D/armor_head)
	player_models.append($Skeleton/Skeleton3D/armor_hip)
	player_models.append($Skeleton/Skeleton3D/armor_leg_down)
	player_models.append($Skeleton/Skeleton3D/armor_leg_up)
	player_models.append($Skeleton/Skeleton3D/armor_shoes)
	player_models.append($Skeleton/Skeleton3D/armor_shouder)
	player_models.append($Skeleton/Skeleton3D/skin_body)
	if view_mode_player==0:
		for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(3)
		$hero_anim_1st_all_weapons.camera_main.current=false
		$SpringArm3D/Camera3D_3rd.current=false
		$hero_anim_1st_all_weapons.sub_viewport_ui.visible=true
	if view_mode_player==1:
		for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(1)
		$hero_anim_1st_all_weapons.camera_main.current=false
		$SpringArm3D/Camera3D_3rd.current=true
		$hero_anim_1st_all_weapons.sub_viewport_ui.visible=false
	
	if first_ready==false:
		hand_state_1st_anim.start(using_weapon+"_first_ready")
		hand_state_3rd_anim.start(using_weapon+"_first_ready")
	else:
		hand_state_1st_anim.start(using_weapon+"_equip")
		hand_state_3rd_anim.start(using_weapon+"_equip")
func _physics_process(delta: float) -> void:
	
	
		#if Engine.time_scale==1:
			#Engine.time_scale=0.1
			#AudioServer.playback_speed_scale=0.1
			#return
		#if Engine.time_scale==0.1:
			#Engine.time_scale=1
			#AudioServer.playback_speed_scale=1
			#return
	
	if scene_root.game_over==true:
		control_lock=false
	
	player_input()
	player_state_control()
	player_move()
	player_animation()
	player_animation_3rd_model()
	player_weapons()
	player_ui_control()
	player_die_state()
	
	player_idle_state()#prop
	player_sword_attack()
	player_grenade_attack()
	FFA_game_over_kill()
	game_over_func()
	
#-------------------鼠标旋转-------------------------

var mouse_speed=0

var mouse_speed_main=0.08
var mouse_speed_max=0
var mouse_speed_min=0
var mouse_speed_wheel_num=0

var sniper_fov_main=30
var sniper_fov_max=75
var sniper_fov_min=10
var sniper_fov_wheel_num=5

var sniper_min_speed=0
var sniper_max_speed=0
#(75-10)/13
var wheel_n=13
func _input(event: InputEvent) -> void:
	if control_lock&&Input.is_action_pressed("change_weapon_class")==false:
		mouse_speed_max=(sniper_fov_max*mouse_speed_main)/sniper_fov_main
		mouse_speed_min=(sniper_fov_min*mouse_speed_main)/sniper_fov_main
		mouse_speed_wheel_num=(sniper_fov_wheel_num*mouse_speed_main)/sniper_fov_main
		if using_weapon=="sniper":
			if $hero_anim_1st_all_weapons.sniper_camera.current==true:
				if Input.is_action_just_pressed("mouse_wheel_down"):
					if $hero_anim_1st_all_weapons.sniper_camera.fov<sniper_fov_max:
						$hero_anim_1st_all_weapons.sniper_camera.fov+=sniper_fov_wheel_num
					else:
						$hero_anim_1st_all_weapons.sniper_camera.fov=sniper_fov_max
					if mouse_speed<mouse_speed_max:
						mouse_speed+=mouse_speed_wheel_num
					else:
						mouse_speed=mouse_speed_max
				if Input.is_action_just_pressed("mouse_wheel_up"):
					if $hero_anim_1st_all_weapons.sniper_camera.fov>sniper_fov_min:
						$hero_anim_1st_all_weapons.sniper_camera.fov-=sniper_fov_wheel_num
					else:
						$hero_anim_1st_all_weapons.sniper_camera.fov=sniper_fov_min
					if mouse_speed>mouse_speed_min:
						mouse_speed-=mouse_speed_wheel_num
					else:
						mouse_speed=mouse_speed_min
			else:
				$hero_anim_1st_all_weapons.sniper_camera.fov=sniper_fov_main
				mouse_speed=mouse_speed_main
		else:
			$hero_anim_1st_all_weapons.sniper_camera.fov=sniper_fov_main
			mouse_speed=mouse_speed_main
	if Input.is_action_pressed("change_weapon_class")==false:
		Input.set_mouse_mode(2)
	if control_lock:
		if player_die==false:
			if event is InputEventMouseMotion:
				self.rotation_degrees.y-=event.relative.x*mouse_speed
				$hero_anim_1st_all_weapons.rotation_degrees.x+=event.relative.y*mouse_speed
				$hero_anim_1st_all_weapons.rotation_degrees.x=clamp($hero_anim_1st_all_weapons.rotation_degrees.x,-70,70)
				$recoil_force_handle.rotation_degrees=$hero_anim_1st_all_weapons.rotation_degrees
		else:
			if event is InputEventMouseMotion:
				$SpringArm3D.rotation_degrees.y-=event.relative.x*mouse_speed
		
	
#-------------------鼠标旋转-------------------------
var player_state=""
var player_start=false

var sniper_aiming=false
func player_state_control():
	if player_health>0:
		if not self.is_on_floor():
			player_state="jump"
			if m_left>0:
				player_state="idle_fire"
		else:
			player_state="idle"
			if d_vec!=Vector2(0,0):
				if m_right>0&&using_weapon_current_ammos>0:
					player_state="aiming_moving"
				else:
					player_state="idle_moving"
					
			if k_run>0:
				if d_vec==Vector2(0,1):
					if m_right==0:
						player_state="run"
			if m_left>0&&using_weapon_current_ammos>0:
				if m_right>0&&using_weapon_current_ammos>0:
					player_state="aiming_fire"
				else:
					player_state="idle_fire"
			else:
				if d_vec==Vector2(0,0):
					if m_right>0&&using_weapon_current_ammos>0:
						player_state="aiming"
	else:
		player_state="die"
		player_die=true


	if Input.is_action_just_pressed("reloading"):
		if hand_state_1st_anim.get_current_node()==(using_weapon+"_idle"):
			if hand_state_1st_anim.get_current_node()!=(using_weapon+"_reloading_1"):
				if $hero_anim_1st_all_weapons.player_1st_animation_tree["parameters/StateMachine/playback"].get_fading_from_node()=="":
					if using_weapon_current_ammos<using_weapon_current_max_ammos&&using_weapon_spare_ammos>0:
						player_state="reloading"

	if using_weapon=="sniper":#5.7667
		if $hero_anim_1st_all_weapons.player_1st_animation_tree["parameters/StateMachine/playback"].get_current_node()==using_weapon+"_aiming":
			if $hero_anim_1st_all_weapons.player_1st_animation_tree["parameters/StateMachine/playback"].get_fading_from_node()=="":
				sniper_aiming=true
			else:
				sniper_aiming=false
		else:
			if  $hero_anim_1st_all_weapons.player_1st_animation_tree["parameters/StateMachine/playback"].get_current_node()==using_weapon+"_aiming_shoot":
				pass
			else:
				sniper_aiming=false
	

		if $hero_anim_1st_all_weapons.player_1st_animation_tree["parameters/StateMachine/playback"].get_current_node()==using_weapon+"_aiming_shoot":
			if Input.is_action_pressed("shoot"):
				Input.action_release("shoot")
			if $hero_anim_1st_all_weapons.player_1st_animation_tree["parameters/StateMachine/playback"].get_current_play_position()>=5.75:
				sniper_aiming=false
			else:
				sniper_aiming=true
		else: 
			if $hero_anim_1st_all_weapons.player_1st_animation_tree["parameters/StateMachine/playback"].get_current_node()==using_weapon+"_aiming":
				pass
			else:
				sniper_aiming=false
var vel_x=Vector3()
var vel_z=Vector3()
var vel=Vector3()

var move_speed=5
var move_speed_main=5
var walk_speed=2.5
var run_speed=15
var jump_height=8
var jump_speed=8
var jump_to_ground=false
var run_to_idle_time_1st=1.25
var run_to_idle_time_3rd=1.25

var start_collision=false
func player_move():
	if scene_root.game_over:
		anim_tree_3rd["parameters/move/blend_position"]=anim_tree_3rd["parameters/move/blend_position"].lerp(Vector2(0,0),0.3)
		anim_tree_3rd["parameters/run/blend_amount"]=Vector2(anim_tree_3rd["parameters/run/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	#for i in get_slide_collision_count():
	#	var collision = get_slide_collision(i)
	#	if collision.get_collider().get_collision_mask()!=2:
	#		set_collision_mask_value(2,true)
	if control_lock:
		#---jump---
		if not self.is_on_floor():
			self.velocity.y+=get_gravity().y*get_physics_process_delta_time()
			self.move_and_slide()
			velocity.x=((vel_x+vel_z).normalized()*jump_speed).x
			velocity.z=((vel_x+vel_z).normalized()*jump_speed).z
			velocity.x=Vector2(velocity.x,velocity.z).lerp(Vector2(0,0),0.5).x
			velocity.z=Vector2(velocity.x,velocity.z).lerp(Vector2(0,0),0.5).y
		else:
			if jump_to_ground==true:
					$hero_anim_1st_all_weapons.jump_audio_node.move_audio_anim_event()
					jump_to_ground=false
			if Input.is_action_just_pressed("jump"):
				if k_run==0:
					if player_state!="aiming_moving"||player_state!="aiming":
						velocity.y=jump_height
						$hero_anim_1st_all_weapons.jump_audio_node.move_audio_anim_event()
						jump_to_ground=true
		#---jump---
		
		#-----moving-----
			if self.is_on_floor():
				vel_x=-d_vec.x*(self.get_global_transform().basis.x.normalized())
				vel_z=d_vec.y*(self.get_global_transform().basis.z.normalized())
				vel=(vel_x+vel_z).normalized()*move_speed
				self.velocity.x=vel.x
				self.velocity.z=vel.z
				self.move_and_slide()

			if player_state=="idle_moving"||player_state=="idle":
				move_speed=move_speed_main
			if player_state=="aiming_moving"||player_state=="aiming":
				move_speed=walk_speed
			if player_state=="jump":
				move_speed=jump_speed
			if hand_state_1st_anim.get_current_node()==(using_weapon+"_reloading_1"):
				move_speed=walk_speed
			if player_state=="idle_fire"|| player_state=="aiming_fire":
				move_speed=walk_speed
			if hand_state_1st_anim.get_current_node()==using_weapon+"_idle_to_run":
				move_speed=run_speed
		if move_speed==walk_speed:
			anim_tree_1st["parameters/move/0/TimeScale_move/scale"]=Vector2(anim_tree_1st["parameters/move/0/TimeScale_move/scale"],0).lerp(Vector2(0.5,0),0.3).x
			anim_tree_3rd["parameters/TimeScale_move/scale"]=Vector2(anim_tree_3rd["parameters/TimeScale_move/scale"],0).lerp(Vector2(0.5,0),0.3).x
		if move_speed==move_speed_main||move_speed==run_speed:
			anim_tree_1st["parameters/move/0/TimeScale_move/scale"]=Vector2(anim_tree_1st["parameters/move/0/TimeScale_move/scale"],0).lerp(Vector2(1,0),0.3).x
			anim_tree_3rd["parameters/TimeScale_move/scale"]=Vector2(anim_tree_3rd["parameters/TimeScale_move/scale"],0).lerp(Vector2(1,0),0.3).x
	else:
		velocity.x=0
		velocity.z=0
		anim_tree_3rd["parameters/move/blend_position"]=anim_tree_3rd["parameters/move/blend_position"].lerp(Vector2(0,0),0.3)
		anim_tree_3rd["parameters/run/blend_amount"]=Vector2(anim_tree_3rd["parameters/run/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		velocity.y+=get_gravity().y*get_physics_process_delta_time()
		move_and_slide()
		
func player_animation():
	if using_weapon=="rifle":
		anim_tree_1st["parameters/move/0/move/transition_request"]="rifle"
		anim_tree_1st["parameters/Transition_run/transition_request"]="rifle"
		anim_tree_1st["parameters/Transition_jump/transition_request"]="rifle"
		run_to_idle_time_1st=1.25
		run_to_idle_time_3rd=2.0833
	if using_weapon=="pistol":
		anim_tree_1st["parameters/move/0/move/transition_request"]="pistol"
		anim_tree_1st["parameters/Transition_run/transition_request"]="pistol"
		anim_tree_1st["parameters/Transition_jump/transition_request"]="pistol"
		run_to_idle_time_1st=1.25
		run_to_idle_time_3rd=2.0833
	if using_weapon=="smg":
		anim_tree_1st["parameters/move/0/move/transition_request"]="smg"
		anim_tree_1st["parameters/Transition_run/transition_request"]="smg"
		anim_tree_1st["parameters/Transition_jump/transition_request"]="smg"
		run_to_idle_time_1st=1.25
		run_to_idle_time_3rd=2.0833
	if using_weapon=="sniper":
		anim_tree_1st["parameters/move/0/move/transition_request"]="sniper"
		anim_tree_1st["parameters/Transition_run/transition_request"]="sniper"
		anim_tree_1st["parameters/Transition_jump/transition_request"]="sniper"
		run_to_idle_time_1st=1.25
		run_to_idle_time_3rd=2.0417
	if using_weapon=="shotgun":
		anim_tree_1st["parameters/move/0/move/transition_request"]="shotgun"
		anim_tree_1st["parameters/Transition_run/transition_request"]="shotgun"
		anim_tree_1st["parameters/Transition_jump/transition_request"]="shotgun"
		run_to_idle_time_1st=2.0833
		run_to_idle_time_3rd=2.0833
	if using_weapon=="machine_gun":
		anim_tree_1st["parameters/move/0/move/transition_request"]="machine_gun"
		anim_tree_1st["parameters/Transition_run/transition_request"]="machine_gun"
		anim_tree_1st["parameters/Transition_jump/transition_request"]="machine_gun"
		run_to_idle_time_1st=2.0833
		run_to_idle_time_3rd=2.0833
	
	if control_lock:
		if player_state=="aiming":
			if hand_state_1st_anim.get_current_node()!=(using_weapon+"_aiming")||hand_state_1st_anim2.get_current_node()!=(using_weapon+"_aiming"):
				if is_on_floor():
					hand_state_1st_anim.travel(using_weapon+"_aiming")
					hand_state_1st_anim2.travel(using_weapon+"_aiming")
				else:
					hand_state_1st_anim.travel(using_weapon+"_idle")
					hand_state_1st_anim2.travel(using_weapon+"_idle")
		

		
	if player_state=="idle":
		if hand_state_1st_anim.get_current_node()!=(using_weapon+"_idle")||hand_state_1st_anim2.get_current_node()!=(using_weapon+"_idle"):
			hand_state_1st_anim.travel(using_weapon+"_idle")
			hand_state_1st_anim2.travel(using_weapon+"_idle")
			if player_start==false:
				player_start=true
	if player_state=="idle_moving":
		if hand_state_1st_anim.get_current_node()!=(using_weapon+"_idle")||hand_state_1st_anim2.get_current_node()!=(using_weapon+"_idle"):
			hand_state_1st_anim.travel(using_weapon+"_idle")
			hand_state_1st_anim2.travel(using_weapon+"_idle")
		
		anim_tree_1st["parameters/move/blend_position"]=(Vector2(anim_tree_1st["parameters/move/blend_position"],0).lerp(Vector2(1,0),0.3)).x
	else:
		anim_tree_1st["parameters/move/blend_position"]=(Vector2(anim_tree_1st["parameters/move/blend_position"],0).lerp(Vector2(0,0),0.3)).x

	if player_state=="aiming_moving":
		if hand_state_1st_anim.get_current_node()!=(using_weapon+"_aiming")||hand_state_1st_anim2.get_current_node()!=(using_weapon+"_aiming"):
			if is_on_floor():
				hand_state_1st_anim.travel(using_weapon+"_aiming")
				hand_state_1st_anim2.travel(using_weapon+"_aiming")
			else:
				hand_state_1st_anim.travel(using_weapon+"_idle")
				hand_state_1st_anim2.travel(using_weapon+"_idle")
		anim_tree_1st["parameters/move/blend_position"]=(Vector2(anim_tree_1st["parameters/move/blend_position"],0).lerp(Vector2(0,0),0.3)).x
	
	if player_state=="jump":
		anim_tree_1st["parameters/run/blend_amount"]=(Vector2(anim_tree_1st["parameters/run/blend_amount"],0).lerp(Vector2(0,0),0.3)).x
		hand_state_1st_anim.travel(using_weapon+"_idle")
		hand_state_1st_anim2.travel(using_weapon+"_idle")
		if hand_state_1st_anim.get_current_node()==(using_weapon+"_aiming")||hand_state_1st_anim2.get_current_node()==(using_weapon+"_aiming"):
			hand_state_1st_anim.travel(using_weapon+"_idle")
			hand_state_1st_anim2.travel(using_weapon+"_idle")
		if player_start==true:
			anim_tree_1st["parameters/jump/blend_amount"]=(Vector2(anim_tree_1st["parameters/jump/blend_amount"],0).lerp(Vector2(1,0),0.05)).x
		else:
			anim_tree_1st["parameters/jump/blend_amount"]=(Vector2(anim_tree_1st["parameters/jump/blend_amount"],0).lerp(Vector2(0,0),0.3)).x
	else:
		anim_tree_1st["parameters/jump/blend_amount"]=(Vector2(anim_tree_1st["parameters/jump/blend_amount"],0).lerp(Vector2(0,0),0.3)).x
		

	if player_state=="run":#1.25
		if hand_state_1st_anim.get_current_node()!=(using_weapon+"_idle_to_run"):
			hand_state_1st_anim.travel(using_weapon+"_idle_to_run")
		else:
			if hand_state_1st_anim.get_current_play_position()>=run_to_idle_time_1st:
				anim_tree_1st["parameters/run/blend_amount"]=(Vector2(anim_tree_1st["parameters/run/blend_amount"],0).lerp(Vector2(1,0),0.3)).x
				#anim_tree_1st["parameters/run/blend_amount"]=1
				
	else:
		#anim_tree_1st["parameters/run/blend_amount"]=(Vector2(anim_tree_1st["parameters/run/blend_amount"],0).lerp(Vector2(0,0),0.3)).x
		anim_tree_1st["parameters/run/blend_amount"]=0

	if control_lock:
		if $hero_anim_1st_all_weapons.weapon_change_ui.visible==false:
			if full_automatic_weapon:
				if player_state=="idle_fire":
					if hand_state_1st_anim.get_current_node()!=(using_weapon+"_idle_shoot")&&using_weapon_current_ammos>0:
						hand_state_1st_anim.travel(using_weapon+"_idle_shoot")
					else:
						hand_state_1st_anim.travel(using_weapon+"_idle")
				if player_state=="aiming_fire":
					if hand_state_1st_anim.get_current_node()!=(using_weapon+"_aiming_shoot")&&using_weapon_current_ammos>0:
						hand_state_1st_anim.travel(using_weapon+"_aiming_shoot")
					else:
						hand_state_1st_anim.travel(using_weapon+"_aiming")
		
			if semi_automatic_weapon:
				if player_state=="idle_fire":
					if semi_automatic_weapon_shot:
						anim_tree_1st["parameters/move/blend_position"]=(Vector2(anim_tree_1st["parameters/move/blend_position"],0).lerp(Vector2(1,0),0.3)).x
					else:
						anim_tree_1st["parameters/move/blend_position"]=(Vector2(anim_tree_1st["parameters/move/blend_position"],0).lerp(Vector2(0,0),0.3)).x
					
					if hand_state_1st_anim.get_current_node()!=(using_weapon+"_idle_shoot")&&using_weapon_current_ammos>0:
						if semi_automatic_weapon_shot==false:
							hand_state_1st_anim.travel(using_weapon+"_idle_shoot")
							semi_automatic_weapon_shot=true
							#Input.action_release("shoot")
					else:
						hand_state_1st_anim.travel(using_weapon+"_idle")
				elif player_state=="aiming_fire":
					if hand_state_1st_anim.get_current_node()!=(using_weapon+"_aiming_shoot")&&using_weapon_current_ammos>0:
						if semi_automatic_weapon_shot==false:
							hand_state_1st_anim.travel(using_weapon+"_aiming_shoot")
							semi_automatic_weapon_shot=true
							Input.action_release("shoot")
					else:
						hand_state_1st_anim.travel(using_weapon+"_aiming")
				else:
					semi_automatic_weapon_shot=false
	
	if control_lock:
		if player_state=="reloading":
			if hand_state_1st_anim.get_current_node()!=(using_weapon+"_reloading_1"):
				hand_state_1st_anim.travel(using_weapon+"_reloading_1")

var arm_rot_y=Vector3()
func player_animation_3rd_model():
	arm_rot_y=$hero_anim_1st_all_weapons.rotation_degrees.x/70
	#------spine_idle------
	if using_weapon=="rifle":
		anim_tree_3rd["parameters/StateMachine/rifle_idle/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_idle/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/rifle_idle/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_idle/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	if using_weapon=="pistol":
		anim_tree_3rd["parameters/StateMachine/pistol_idle/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_idle/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/pistol_idle/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_idle/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	if using_weapon=="smg":
		anim_tree_3rd["parameters/StateMachine/smg_idle/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_idle/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/smg_idle/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_idle/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	if using_weapon=="sniper":
		anim_tree_3rd["parameters/StateMachine/sniper_idle/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_idle/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/sniper_idle/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_idle/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	if using_weapon=="shotgun":
		anim_tree_3rd["parameters/StateMachine/shotgun_idle/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_idle/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/shotgun_idle/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_idle/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	if using_weapon=="machine_gun":
		anim_tree_3rd["parameters/StateMachine/machine_gun_idle/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_idle/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/machine_gun_idle/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_idle/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	#------spine_idle------
	
	#------spine_aiming------
	if using_weapon=="rifle":
		anim_tree_3rd["parameters/StateMachine/rifle_aiming/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_aiming/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/rifle_aiming/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_aiming/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	if using_weapon=="pistol":
		anim_tree_3rd["parameters/StateMachine/pistol_aiming/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_aiming/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/pistol_aiming/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_aiming/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	if using_weapon=="smg":
		anim_tree_3rd["parameters/StateMachine/smg_aiming/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_aiming/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/smg_aiming/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_aiming/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	if using_weapon=="sniper":
		anim_tree_3rd["parameters/StateMachine/sniper_aiming/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_aiming/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/sniper_aiming/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_aiming/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	if using_weapon=="shotgun":
		anim_tree_3rd["parameters/StateMachine/shotgun_aiming/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_aiming/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/shotgun_aiming/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_aiming/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	if using_weapon=="machine_gun":
		anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	#------spine_aiming------
	
	
	#------spine_sword_y------
	if hand_state_3rd_anim.get_current_node()=="sword_attack":
		anim_tree_3rd["parameters/StateMachine/sword_attack/y1/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/y1/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
		anim_tree_3rd["parameters/StateMachine/sword_attack/y2/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/y2/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/sword_attack/y1/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/y1/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		anim_tree_3rd["parameters/StateMachine/sword_attack/y2/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/y2/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	#------spine_sword_y------
	
	#------spine_grenade_y------
	if hand_state_3rd_anim.get_current_node()=="grenade_throw":
		anim_tree_3rd["parameters/StateMachine/grenade_throw/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/grenade_throw/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/grenade_throw/y/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/grenade_throw/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	#------spine_grenade_y------
	
	#------spine_idle_x------
	if is_on_floor():
		if using_weapon=="rifle":
			if d_vec.y>0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif  d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif  d_vec.y<0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif  d_vec.y==0:
				anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		if using_weapon=="pistol":
			if d_vec.y>0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif  d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif  d_vec.y<0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif d_vec.y==0:
				anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	
		if using_weapon=="smg":
			if d_vec.y>0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif  d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif  d_vec.y<0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif d_vec.y==0:
				anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		if using_weapon=="sniper":
			if d_vec.y>0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif  d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif  d_vec.y<0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif d_vec.y==0:
				anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			
		if using_weapon=="shotgun":
			if d_vec.y>0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif  d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif  d_vec.y<0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif d_vec.y==0:
				anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		if using_weapon=="machine_gun":
			if d_vec.y>0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif  d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif  d_vec.y<0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif d_vec.y==0:
				anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_idle/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	#------spine_idle_x------
	
	
	#------spine_aiming_x------
	if is_on_floor():
		if using_weapon=="rifle":
			if d_vec.y>0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif  d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif  d_vec.y<0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif d_vec.y==0:
				anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	
		if using_weapon=="pistol":
			if d_vec.y>0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif  d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif  d_vec.y<0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif d_vec.y==0:
				anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	
		if using_weapon=="smg":
			if d_vec.y>0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif  d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif  d_vec.y<0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif d_vec.y==0:
				anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	
		if using_weapon=="sniper":
			if d_vec.y>0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif  d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif  d_vec.y<0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif d_vec.y==0:
				anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	
		if using_weapon=="shotgun":
			if d_vec.y>0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif  d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif  d_vec.y<0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif d_vec.y==0:
				anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	
		if using_weapon=="machine_gun":
			if d_vec.y>0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif  d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
				
			elif  d_vec.y<0:
				if d_vec.x>0:
					anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				elif d_vec.x<0:
					anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				elif d_vec.x==0:
					anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			elif d_vec.y==0:
				anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/rifle_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/pistol_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/smg_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sniper_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/shotgun_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/machine_gun_aiming/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	#------spine_aiming_x------
	
	#------spine_sword_x------
	if hand_state_3rd_anim.get_current_node()=="sword_attack":
		if d_vec.y>0:
			if d_vec.x>0:
				anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
			elif  d_vec.x<0:
				anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
			elif d_vec.x==0:
				anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"],0).lerp(Vector2(0,0),0.3).x
				anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
			
		elif  d_vec.y<0:
			if d_vec.x>0:
				anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"],0).lerp(Vector2(1,0),0.3).x
				anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
			elif d_vec.x<0:
				anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
				anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
			elif d_vec.x==0:
				anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"],0).lerp(Vector2(0,0),0.3).x
				anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
		elif d_vec.y==0:
			anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"],0).lerp(Vector2(0,0),0.3).x
			anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x1/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/sword_attack/x2/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
	#------spine_sword_x------
	
	#------spine_grenade_x------
	if hand_state_3rd_anim.get_current_node()=="grenade_throw":
		if d_vec.y>0:
			if d_vec.x>0:
				anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
			elif  d_vec.x<0:
				anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
			elif d_vec.x==0:
				anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
				
		elif  d_vec.y<0:
			if d_vec.x>0:
				anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"],0).lerp(Vector2(1,0),0.3).x
			elif d_vec.x<0:
				anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"],0).lerp(Vector2(-1,0),0.3).x
			elif d_vec.x==0:
				anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		elif d_vec.y==0:
			anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	else:
		anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"]=Vector2(anim_tree_3rd["parameters/StateMachine/grenade_throw/x/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	#------spine_grenade_x------
	
	#------weapon_state_control------
	if using_weapon=="rifle":
		anim_tree_3rd["parameters/Transition_run/transition_request"]="rifle"
	if using_weapon=="pistol":
		anim_tree_3rd["parameters/Transition_run/transition_request"]="pistol"
	if using_weapon=="smg":
		anim_tree_3rd["parameters/Transition_run/transition_request"]="smg"
	if using_weapon=="sniper":
		anim_tree_3rd["parameters/Transition_run/transition_request"]="sniper"
	if using_weapon=="shotgun":
		anim_tree_3rd["parameters/Transition_run/transition_request"]="shotgun"
	if using_weapon=="machine_gun":
		anim_tree_3rd["parameters/Transition_run/transition_request"]="machine_gun"
	#------weapon_state_control------
	
	if hand_state_1st_anim.get_current_node()==(using_weapon+"_idle")||hand_state_1st_anim2.get_current_node()==(using_weapon+"_idle"):
		hand_state_3rd_anim.travel(using_weapon+"_idle")
		hand_state_3rd_anim2.travel(using_weapon+"_idle")
	if hand_state_1st_anim.get_current_node()==(using_weapon+"_aiming")||hand_state_1st_anim2.get_current_node()==(using_weapon+"_aiming"):
		hand_state_3rd_anim.travel(using_weapon+"_aiming")
		hand_state_3rd_anim2.travel(using_weapon+"_aiming")
	if hand_state_1st_anim.get_current_node()==(using_weapon+"_reloading_1"):
		if hand_state_3rd_anim.get_current_node()!=(using_weapon+"_reloading_1"):
			hand_state_3rd_anim.travel(using_weapon+"_reloading_1")
	
	
	if d_vec!=Vector2(0,0):
		anim_tree_3rd["parameters/move/blend_position"]=anim_tree_3rd["parameters/move/blend_position"].lerp(d_vec,0.3)
	else:
		anim_tree_3rd["parameters/move/blend_position"]=anim_tree_3rd["parameters/move/blend_position"].lerp(Vector2(0,0),0.3)
	
	if player_state=="run":#1.25
		if hand_state_1st_anim.get_current_node()==(using_weapon+"_idle_to_run"):
			anim_tree_3rd["parameters/run/blend_amount"]=(Vector2(anim_tree_3rd["parameters/run/blend_amount"],0).lerp(Vector2(1,0),0.3)).x
		else:
			anim_tree_3rd["parameters/run/blend_amount"]=(Vector2(anim_tree_3rd["parameters/run/blend_amount"],0).lerp(Vector2(0,0),0.3)).x
	else:
		anim_tree_3rd["parameters/run/blend_amount"]=(Vector2(anim_tree_3rd["parameters/run/blend_amount"],0).lerp(Vector2(0,0),0.3)).x
	#	if hand_state_3rd_anim.get_current_node()!=(using_weapon+"_idle_to_run"):
	#		hand_state_3rd_anim.travel(using_weapon+"_idle_to_run")
	#	else:
	#		if hand_state_3rd_anim.get_current_play_position()>=run_to_idle_time_3rd:
	#			anim_tree_3rd["parameters/run/blend_amount"]=(Vector2(anim_tree_3rd["parameters/run/blend_amount"],0).lerp(Vector2(1,0),0.3)).x
	#			#anim_tree_1st["parameters/run/blend_amount"]=1
	#			
	#else:
	#	#anim_tree_1st["parameters/run/blend_amount"]=(Vector2(anim_tree_1st["parameters/run/blend_amount"],0).lerp(Vector2(0,0),0.3)).x
	#	anim_tree_3rd["parameters/run/blend_amount"]=0
	
	if not is_on_floor():
		if player_start==true:
			anim_tree_3rd["parameters/jump/blend_amount"]=(Vector2(anim_tree_3rd["parameters/jump/blend_amount"],0).lerp(Vector2(1,0),0.1)).x
		else:
			anim_tree_3rd["parameters/jump/blend_amount"]=(Vector2(anim_tree_3rd["parameters/jump/blend_amount"],0).lerp(Vector2(0,0),0.3)).x
	else:
		anim_tree_3rd["parameters/jump/blend_amount"]=(Vector2(anim_tree_3rd["parameters/jump/blend_amount"],0).lerp(Vector2(0,0),0.3)).x
	
	
	
	if using_weapon=="sniper":
		if hand_state_1st_anim.get_current_node()==(using_weapon+"_aiming_shoot"):
			if hand_state_1st_anim.get_current_play_position()>=5.8667:
				if hand_state_3rd_anim.get_current_node()!=using_weapon+"_reloading_2":
					hand_state_3rd_anim.travel(using_weapon+"_reloading_2")
		if hand_state_1st_anim.get_current_node()==(using_weapon+"_idle_shoot"):
			if hand_state_1st_anim.get_current_play_position()>=4.2:
				if hand_state_3rd_anim.get_current_node()!=using_weapon+"_reloading_2":
					hand_state_3rd_anim.travel(using_weapon+"_reloading_2")
	if using_weapon=="shotgun":
		if hand_state_1st_anim.get_current_node()==(using_weapon+"_aiming_shoot"):
			if hand_state_1st_anim.get_current_play_position()>=4.1667:
				if hand_state_3rd_anim.get_current_node()!=using_weapon+"_reloading_2":
					hand_state_3rd_anim.travel(using_weapon+"_reloading_2")
		if hand_state_1st_anim.get_current_node()==(using_weapon+"_idle_shoot"):
			if hand_state_1st_anim.get_current_play_position()>=4.1667:
				if hand_state_3rd_anim.get_current_node()!=using_weapon+"_reloading_2":
					hand_state_3rd_anim.travel(using_weapon+"_reloading_2")
	
	

var full_automatic_weapon=false
var semi_automatic_weapon=false
var semi_automatic_weapon_shot=false


var rifle_current_ammos=30
var rifle_current_max_ammos=30
var rifle_ammos_needed=0
var rifle_spare_ammos=360

var pistol_current_ammos=12
var pistol_current_max_ammos=12
var pistol_ammos_needed=0
var pistol_spare_ammos=120

var smg_current_ammos=60
var smg_current_max_ammos=60
var smg_ammos_needed=0
var smg_spare_ammos=1200

var sniper_current_ammos=4
var sniper_current_max_ammos=4
var sniper_ammos_needed=0
var sniper_spare_ammos=32

var shotgun_current_ammos=6
var shotgun_current_max_ammos=6
var shotgun_ammos_needed=0
var shotgun_spare_ammos=120

var machine_gun_current_ammos=100
var machine_gun_current_max_ammos=100
var machine_gun_ammos_needed=0
var machine_gun_spare_ammos=1200

var using_weapon_current_ammos=0
var using_weapon_current_max_ammos=0
var using_weapon_ammos_needed=0
var using_weapon_spare_ammos=0

@export var player_type=""
var next_res_type=""
func set_weapon_type(next_type):
	if next_res_type!=next_type:
		next_res_type=next_type

func player_weapons():
	if using_weapon_current_ammos<=0:
		if $hero_anim_1st_all_weapons.player_1st_animation_tree["parameters/StateMachine/playback"].get_current_node()==using_weapon+"_idle":
			Input.action_press("reloading")
			Input.action_release("reloading")
	if control_lock:
		
		if Input.is_action_pressed("change_weapon_class"):
			Input.set_mouse_mode(0)
			$hero_anim_1st_all_weapons.weapon_change_ui.visible=true
			mouse_speed=0
		else:
			$hero_anim_1st_all_weapons.weapon_change_ui.visible=false
		
		if hand_state_1st_anim.get_current_node()==using_weapon+"_idle":
			if player_type=="rifle_man":
				if Input.is_action_just_pressed("weapon1"):
					if player_state=="idle_moving"||player_state=="idle":
						if using_weapon!="rifle":
							using_weapon="rifle"
				if Input.is_action_just_pressed("weapon2"):
					if player_state=="idle_moving"||player_state=="idle":
						if using_weapon!="pistol":
							using_weapon="pistol"
			if player_type=="smg_man":
				if Input.is_action_just_pressed("weapon1"):
					if player_state=="idle_moving"||player_state=="idle":
						if using_weapon!="smg":
							using_weapon="smg"
				if Input.is_action_just_pressed("weapon2"):
					if player_state=="idle_moving"||player_state=="idle":
						if using_weapon!="pistol":
							using_weapon="pistol"
			if player_type=="shotgun_man":
				if Input.is_action_just_pressed("weapon1"):
					if player_state=="idle_moving"||player_state=="idle":
						if using_weapon!="shotgun":
							using_weapon="shotgun"
				if Input.is_action_just_pressed("weapon2"):
					if player_state=="idle_moving"||player_state=="idle":
						if using_weapon!="pistol":
							using_weapon="pistol"
			if player_type=="sniper_man":
				if Input.is_action_just_pressed("weapon1"):
					if player_state=="idle_moving"||player_state=="idle":
						if using_weapon!="sniper":
							using_weapon="sniper"
				if Input.is_action_just_pressed("weapon2"):
					if player_state=="idle_moving"||player_state=="idle":
						if using_weapon!="pistol":
							using_weapon="pistol"
			if player_type=="machine_gun_man":
				if Input.is_action_just_pressed("weapon1"):
					if player_state=="idle_moving"||player_state=="idle":
						if using_weapon!="machine_gun":
							using_weapon="machine_gun"
				if Input.is_action_just_pressed("weapon2"):
					if player_state=="idle_moving"||player_state=="idle":
						if using_weapon!="pistol":
							using_weapon="pistol"
			#if Input.is_action_just_pressed("weapon1"):
				#if player_state=="idle_moving"||player_state=="idle":
					#if using_weapon!="rifle":
						#using_weapon="rifle"
			#if Input.is_action_just_pressed("weapon2"):
				#if player_state=="idle_moving"||player_state=="idle":
					#if using_weapon!="pistol":
						#using_weapon="pistol"
			#if Input.is_action_just_pressed("weapon3"):
				#if player_state=="idle_moving"||player_state=="idle":
					#if using_weapon!="smg":
						#using_weapon="smg"
			#if Input.is_action_just_pressed("weapon4"):
				#if player_state=="idle_moving"||player_state=="idle":
					#if using_weapon!="sniper":
						#using_weapon="sniper"
			#if Input.is_action_just_pressed("weapon5"):
				#if player_state=="idle_moving"||player_state=="idle":
					#if using_weapon!="shotgun":
						#using_weapon="shotgun"
			#if Input.is_action_just_pressed("weapon6"):
				#if player_state=="idle_moving"||player_state=="idle":
					#if using_weapon!="machine_gun":
						#using_weapon="machine_gun"
						
						
	#---------ammos-------------
	if using_weapon=="rifle":
		using_weapon_current_ammos=rifle_current_ammos
		using_weapon_spare_ammos=rifle_spare_ammos
		using_weapon_current_max_ammos=rifle_current_max_ammos
		#$hero_anim_1st_all_weapons.ammos_label_ui.text=str(rifle_current_ammos)+"/"+str(rifle_spare_ammos)
	if using_weapon=="pistol":
		using_weapon_current_ammos=pistol_current_ammos
		using_weapon_spare_ammos=pistol_spare_ammos
		using_weapon_current_max_ammos=pistol_current_max_ammos
		#$hero_anim_1st_all_weapons.ammos_label_ui.text=str(pistol_current_ammos)+"/"+str(pistol_spare_ammos)
	if using_weapon=="smg":
		using_weapon_current_ammos=smg_current_ammos
		using_weapon_spare_ammos=smg_spare_ammos
		using_weapon_current_max_ammos=smg_current_max_ammos
		#$hero_anim_1st_all_weapons.ammos_label_ui.text=str(smg_current_ammos)+"/"+str(smg_spare_ammos)
	if using_weapon=="sniper":
		using_weapon_current_ammos=sniper_current_ammos
		using_weapon_spare_ammos=sniper_spare_ammos
		using_weapon_current_max_ammos=sniper_current_max_ammos
		#$hero_anim_1st_all_weapons.ammos_label_ui.text=str(sniper_current_ammos)+"/"+str(sniper_spare_ammos)
	if using_weapon=="shotgun":
		using_weapon_current_ammos=shotgun_current_ammos
		using_weapon_spare_ammos=shotgun_spare_ammos
		using_weapon_current_max_ammos=shotgun_current_max_ammos
		#$hero_anim_1st_all_weapons.ammos_label_ui.text=str(shotgun_current_ammos)+"/"+str(shotgun_spare_ammos)
	if using_weapon=="machine_gun":
		using_weapon_current_ammos=machine_gun_current_ammos
		using_weapon_spare_ammos=machine_gun_spare_ammos
		using_weapon_current_max_ammos=machine_gun_current_max_ammos
		#$hero_anim_1st_all_weapons.ammos_label_ui.text=str(machine_gun_current_ammos)+"/"+str(machine_gun_spare_ammos)
	
	rifle_ammos_needed=rifle_current_max_ammos-rifle_current_ammos
	pistol_ammos_needed=pistol_current_max_ammos-pistol_current_ammos
	smg_ammos_needed=smg_current_max_ammos-smg_current_ammos
	sniper_ammos_needed=sniper_current_max_ammos-sniper_current_ammos
	shotgun_ammos_needed=shotgun_current_max_ammos-shotgun_current_ammos
	machine_gun_ammos_needed=machine_gun_current_max_ammos-machine_gun_current_ammos
	using_weapon_ammos_needed=using_weapon_current_max_ammos-using_weapon_current_ammos
	
	if hand_state_1st_anim.get_current_node()!=using_weapon+"_reloading_1":
		if shotgun_spare_ammos>=6:
			if shotgun_ammos_needed==1:
				anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="1"
				anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="1"
			if shotgun_ammos_needed==2:
				anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="2"
				anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="2"
			if shotgun_ammos_needed==3:
				anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="3"
				anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="3"
			if shotgun_ammos_needed==4:
				anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="4"
				anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="4"
			if shotgun_ammos_needed==5:
				anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="5"
				anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="5"
			if shotgun_ammos_needed==6:
				anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="6"
				anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="6"
		else:
			if shotgun_ammos_needed==1:
				if shotgun_spare_ammos==1:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="1"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="1"
			
			if shotgun_ammos_needed==2:
				if shotgun_spare_ammos==1:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="1"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="1"
				if shotgun_spare_ammos==2:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="2"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="2"

			if shotgun_ammos_needed==3:
				if shotgun_spare_ammos==1:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="1"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="1"
				if shotgun_spare_ammos==2:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="2"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="2"
				if shotgun_spare_ammos==3:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="3"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="3"

			if shotgun_ammos_needed==4:
				if shotgun_spare_ammos==1:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="1"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="1"
				if shotgun_spare_ammos==2:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="2"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="2"
				if shotgun_spare_ammos==3:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="3"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="3"
				if shotgun_spare_ammos==4:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="4"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="4"
	
			if shotgun_ammos_needed==5:
				if shotgun_spare_ammos==1:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="1"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="1"
				if shotgun_spare_ammos==2:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="2"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="2"
				if shotgun_spare_ammos==3:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="3"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="3"
				if shotgun_spare_ammos==4:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="4"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="4"
				if shotgun_spare_ammos==5:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="5"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="5"
	
			if shotgun_ammos_needed==6:
				if shotgun_spare_ammos==1:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="1"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="1"
				if shotgun_spare_ammos==2:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="2"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="2"
				if shotgun_spare_ammos==3:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="3"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="3"
				if shotgun_spare_ammos==4:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="4"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="4"
				if shotgun_spare_ammos==5:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="5"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="5"
				if shotgun_spare_ammos==6:
					anim_tree_1st["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="6"
					anim_tree_3rd["parameters/StateMachine/shotgun_reloading_1/Transition/transition_request"]="6"
	#---------ammos-------------
	
	
	if using_weapon=="rifle":
		full_automatic_weapon=true
		semi_automatic_weapon=false
		if Input.is_action_pressed("aiming"):
			#$hero_anim_1st_all_weapons.rifle_crosshair_ui.visible=false
			pass
		else:
			#$hero_anim_1st_all_weapons.rifle_crosshair_ui.visible=true
			pass
		#$hero_anim_1st_all_weapons.rifle_icon_ui.visible=true
		
		#$hero_anim_1st_all_weapons.pistol_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.pistol_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.smg_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.smg_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.sniper_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.shotgun_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.shotgun_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.machine_gun_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.machine_gun_icon_ui.visible=false
		
	if using_weapon=="pistol":
		full_automatic_weapon=false
		semi_automatic_weapon=true
		#$hero_anim_1st_all_weapons.rifle_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.rifle_icon_ui.visible=false
		if Input.is_action_pressed("aiming"):
			#$hero_anim_1st_all_weapons.pistol_crosshair_ui.visible=false
			pass
		else:
			#$hero_anim_1st_all_weapons.pistol_crosshair_ui.visible=true
			pass
		#$hero_anim_1st_all_weapons.pistol_icon_ui.visible=true
		
		#$hero_anim_1st_all_weapons.smg_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.smg_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.sniper_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.shotgun_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.shotgun_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.machine_gun_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.machine_gun_icon_ui.visible=false
	if using_weapon=="smg":
		full_automatic_weapon=true
		semi_automatic_weapon=false
		#$hero_anim_1st_all_weapons.rifle_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.rifle_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.pistol_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.pistol_icon_ui.visible=false
		if Input.is_action_pressed("aiming"):
			#$hero_anim_1st_all_weapons.smg_crosshair_ui.visible=false
			pass
		else:
			#$hero_anim_1st_all_weapons.smg_crosshair_ui.visible=true
			pass
		#$hero_anim_1st_all_weapons.smg_icon_ui.visible=true
		
		#$hero_anim_1st_all_weapons.sniper_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.shotgun_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.shotgun_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.machine_gun_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.machine_gun_icon_ui.visible=false
	if using_weapon=="sniper":
		full_automatic_weapon=false
		semi_automatic_weapon=true
		#$hero_anim_1st_all_weapons.rifle_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.rifle_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.pistol_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.pistol_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.smg_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.smg_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.sniper_icon_ui.visible=true
		
		#$hero_anim_1st_all_weapons.shotgun_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.shotgun_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.machine_gun_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.machine_gun_icon_ui.visible=false
	if using_weapon=="shotgun":
		full_automatic_weapon=false
		semi_automatic_weapon=true
		#$hero_anim_1st_all_weapons.rifle_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.rifle_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.pistol_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.pistol_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.smg_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.smg_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.sniper_icon_ui.visible=false
		if Input.is_action_pressed("aiming"):
			#$hero_anim_1st_all_weapons.shotgun_crosshair_ui.visible=false
			pass
		else:
			#$hero_anim_1st_all_weapons.shotgun_crosshair_ui.visible=true
			pass
		#$hero_anim_1st_all_weapons.shotgun_icon_ui.visible=true
		
		#$hero_anim_1st_all_weapons.machine_gun_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.machine_gun_icon_ui.visible=false
	if using_weapon=="machine_gun":
		full_automatic_weapon=true
		semi_automatic_weapon=false
		#$hero_anim_1st_all_weapons.rifle_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.rifle_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.pistol_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.pistol_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.smg_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.smg_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.sniper_icon_ui.visible=false
		
		#$hero_anim_1st_all_weapons.shotgun_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.shotgun_icon_ui.visible=false
		if Input.is_action_pressed("aiming"):
			#$hero_anim_1st_all_weapons.machine_gun_crosshair_ui.visible=false
			pass
		else:
			#$hero_anim_1st_all_weapons.machine_gun_crosshair_ui.visible=true
			pass
		#$hero_anim_1st_all_weapons.machine_gun_icon_ui.visible=true
	#---------后坐力--------
	$hero_anim_1st_all_weapons.rotation_degrees.x=$hero_anim_1st_all_weapons.rotation_degrees.lerp($recoil_force_handle.rotation_degrees,0.3).x
	$hero_anim_1st_all_weapons.rotation_degrees.x=clamp($hero_anim_1st_all_weapons.rotation_degrees.x,-70,70)
	#---------后坐力--------
	
	#---------机瞄相机移动--------
	#if (hand_state_1st_anim.get_current_node()==(using_weapon+"_aiming")||hand_state_1st_anim2.get_current_node()==(using_weapon+"_aiming"))&&hand_state_1st_anim.get_current_node()==(using_weapon+"_aiming_shoot"):
	if (player_state=="aiming"||player_state=="aiming_moving")||(player_state=="aiming_fire"):
		$hero_anim_1st_all_weapons.camera_main.position=$hero_anim_1st_all_weapons.camera_main.position.lerp($hero_anim_1st_all_weapons.camera_aiming_pos_node.position,0.2)
	else:
		$hero_anim_1st_all_weapons.camera_main.position=$hero_anim_1st_all_weapons.camera_main.position.lerp($hero_anim_1st_all_weapons.camera_idle_pos_node.position,0.2)
	#---------机瞄相机移动--------
	if view_mode_player==0:
		if sniper_aiming:
			$hero_anim_1st_all_weapons.camera_main.current=false
			$hero_anim_1st_all_weapons.sniper_camera.current=true
			$hero_anim_1st_all_weapons.sub_camera_main.current=false
			$hero_anim_1st_all_weapons.sub_sniper_camera_main.current=true
			$hero_anim_1st_all_weapons.sniper_zoom_ui.visible=true
		else:
			$hero_anim_1st_all_weapons.camera_main.current=true
			$hero_anim_1st_all_weapons.sniper_camera.current=false
			$hero_anim_1st_all_weapons.sub_camera_main.current=true
			$hero_anim_1st_all_weapons.sub_sniper_camera_main.current=false
			$hero_anim_1st_all_weapons.sniper_zoom_ui.visible=false
#@onready var blue_health_ui=preload("res://assets/my_UI/blue.png")
#@onready var yellow_health_ui=preload("res://assets/my_UI/yellow.png")
#@onready var health_label_ui_res=preload("res://assets/my_UI/player_1st_health_label_settings_res.tres")

var print_A_kills_B_lock=true
func player_die_state():
	if player_health>0:
		#$hero_anim_1st_all_weapons.health_label_ui.text=str(player_health)
		pass
	elif  player_health<=0:
		#$hero_anim_1st_all_weapons.health_label_ui.text="0"
		pass
	if player_health<=40:
		#$hero_anim_1st_all_weapons.anim_player_tree_ui["parameters/Transition/transition_request"]="player_hurt"
		#$hero_anim_1st_all_weapons.health_ui_BG_ui.texture=yellow_health_ui
		#health_label_ui_res.font_color=Color(1.0,0.553,0.0,1.0)
		pass
	elif  player_health>40:
		pass
		#$hero_anim_1st_all_weapons.anim_player_tree_ui["parameters/Transition/transition_request"]="null"
		#$hero_anim_1st_all_weapons.health_ui_BG_ui.texture=blue_health_ui
		#health_label_ui_res.font_color=Color(0.0,1.0,0.953,1.0)
	
	if player_die:
		$Skeleton/Skeleton3D/PhysicalBoneSimulator3D.physical_bones_start_simulation()
		anim_tree_3rd.active=false
		#1stcamera
		$hero_anim_1st_all_weapons.camera_main.current=false
		$hero_anim_1st_all_weapons.sniper_camera.current=false
		$hero_anim_1st_all_weapons.sub_camera_main.current=false
		$hero_anim_1st_all_weapons.sub_sniper_camera_main.current=false
		$hero_anim_1st_all_weapons.sniper_zoom_ui.visible=false
		
		#1stcamera
		
		#3rdcamera
		$SpringArm3D/Camera3D_3rd.current=true
		#3rdcamera
		
		#visual_instance
		for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(1)
		#$hero_anim_1st_all_weapons.sub_viewport_ui.visible=false
		$hero_anim_1st_all_weapons.visible=false
		
		rifle_model.die_cast_shadows()
		pistol_model.die_cast_shadows()
		smg_model.die_cast_shadows()
		sniper_model.die_cast_shadows()
		shotgun_model.die_cast_shadows()
		machine_gun_model.die_cast_shadows()
		
		sword_model.die_cast_shadows()
		
		grenade_fire_model.die_cast_shadows()
		grenade_smoke_model.die_cast_shadows()
		grenade_flash_model.die_cast_shadows()
		
		rifle_model.sight_node.die_cast_shadows()
		smg_model.die_cast_shadows()
		$Skeleton/Skeleton3D/right_hand/sniper/sniper1_bullet_set.die_cast_shadows()
		$Skeleton/Skeleton3D/right_hand/shotgun/shotgun_handle_3rd.die_cast_shadows()
		
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D2/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D3/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D4/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D5/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D6/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D7/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D8/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D9/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D10/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D11/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D12/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D13/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D14/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D15/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D16/ammo.cast_shadow=1
		$Skeleton/Skeleton3D/right_hand/machine_gun/Path3D_machine_gun_ammos/PathFollow3D17/ammo.cast_shadow=1
		#visual_instance
		
		#move
		move_speed=0
		move_speed_main=0
		walk_speed=0
		jump_height=0
		jump_speed=0
		#move
		
		#ui
		#$hero_anim_1st_all_weapons.rifle_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.pistol_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.smg_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.shotgun_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.machine_gun_crosshair_ui.visible=false
		#$hero_anim_1st_all_weapons.ammos_label_ui.visible=false
		#$hero_anim_1st_all_weapons.sub_viewport_ui.visible=false
		
		
		#$hero_anim_1st_all_weapons.rifle_icon_ui.visible=false
		#$hero_anim_1st_all_weapons.pistol_icon_ui.visible=false
		#$hero_anim_1st_all_weapons.smg_icon_ui.visible=false
		#$hero_anim_1st_all_weapons.sniper_icon_ui.visible=false
		#$hero_anim_1st_all_weapons.shotgun_icon_ui.visible=false
		#$hero_anim_1st_all_weapons.machine_gun_icon_ui.visible=false
		#$hero_anim_1st_all_weapons.weapons_panel_ui.visible=false
		$hero_anim_1st_all_weapons.rifle_crosshair_visible.visible=false
		$hero_anim_1st_all_weapons.pistol_crosshair_visible.visible=false
		$hero_anim_1st_all_weapons.smg_crosshair_visible.visible=false
		$hero_anim_1st_all_weapons.shotgun_crosshair_visible.visible=false
		$hero_anim_1st_all_weapons.machine_gun_crosshair_visible.visible=false
		#ui
		
		#physics
		$".".set_collision_layer_value(2,false)
		$".".set_collision_mask_value(2,false)
		#physics
		
		$Skeleton/Skeleton3D/hip_bone_pos/Area3D.set_collision_layer_value(6,false)
		$Skeleton/Skeleton3D/spine_bone_pos/Area3D.set_collision_layer_value(6,false)
		$Skeleton/Skeleton3D/leg1_L_bone_pos/Area3D.set_collision_layer_value(6,false)
		$Skeleton/Skeleton3D/leg2_L_bone_pos/Area3D.set_collision_layer_value(6,false)
		$Skeleton/Skeleton3D/foot_L_bone_pos/Area3D.set_collision_layer_value(6,false)
		$Skeleton/Skeleton3D/leg1_R_bone_pos/Area3D.set_collision_layer_value(6,false)
		$Skeleton/Skeleton3D/leg2_R_bone_pos/Area3D.set_collision_layer_value(6,false)
		$Skeleton/Skeleton3D/foot_R_bone_pos/Area3D.set_collision_layer_value(6,false)
		$Skeleton/Skeleton3D/head_bone_pos/Area3D.set_collision_layer_value(6,false)
		$Skeleton/Skeleton3D/shouder_L_bone_pos/Area3D.set_collision_layer_value(6,false)
		$Skeleton/Skeleton3D/arm_L_bone_pos/Area3D.set_collision_layer_value(6,false)
		$Skeleton/Skeleton3D/hand_L_bone_pos/Area3D.set_collision_layer_value(6,false)
		$Skeleton/Skeleton3D/shouder_R_bone_pos/Area3D.set_collision_layer_value(6,false)
		$Skeleton/Skeleton3D/arm_R_bone_pos/Area3D.set_collision_layer_value(6,false)
		$Skeleton/Skeleton3D/hand_R_bone_pos/Area3D.set_collision_layer_value(6,false)
		
		
		for p in range(scene_root.players.size()):
			if scene_root.players[p]==self:
				scene_root.players.remove_at(p)
				break
		die_time+=get_physics_process_delta_time()
		if die_time>=die_time_main:
			call_deferred("player_respawn")
			pass
		#console
		if scene_root.has_method("print_A_kills_B"):
			if murderer!=self:
				if print_A_kills_B_lock==true:
					scene_root.call_deferred("print_A_kills_B",murderer,self)
					print_A_kills_B_lock=false
var die_time=0
var die_time_main=5
var bullets=[]
var respawn_act=true
@export var player_point_id:int
func player_respawn():
	#$hero_anim_1st_all_weapons.blood_screen_ui.visible=false
	#$hero_anim_1st_all_weapons.health_label_ui.visible=false
	$hero_anim_1st_all_weapons.pause_menu_ui.visible=false
	$hero_anim_1st_all_weapons.ui_animation_tree["parameters/blood_screen/blend_amount"]=0
	if respawn_act:
		if scene_root.mode=="free_for_all":
			var player_new=load("res://assets/player/prefab/hero_player_3rd.tscn")
			var t=scene_root.ai_nav_points_lib_id.pick_random()
			var pn=player_new.instantiate()
			if(scene_root.ai_nav_points_lib[str(t)])==true:
				
			
			
				pn.charactor_color=charactor_color
				pn.player_point_id=player_point_id
				if next_res_type==player_type:
					pn.player_type=player_type
				else:
					if next_res_type!="":
						pn.player_type=next_res_type
					else:
						pn.player_type=player_type
				pn.first_ready=true
				
				
				scene_root.players_points[player_point_id-1].add_child(pn)
				scene_root.players.append(pn)
				if scene_root.game_start==true:
					pn.control_lock=true
					pn.start_game_ui_event()
				
			
				
				pn.global_position=scene_root.ai_nav_points[t-1].global_position
				pn.global_rotation_degrees=scene_root.ai_nav_points[t-1].global_rotation_degrees
				pn.player_kill_score_FFA=player_kill_score_FFA
				scene_root.user_player=pn
				if pn.user_name!=self.user_name:
					pn.user_name=self.user_name
				
				
				
				if bullets.size()>0:
					for b in range(bullets.size()):
						if b==bullets.size()-1:
							if is_instance_valid(bullets[b]):
								bullets[b].player_master=pn
								queue_free()
							else:
								queue_free()
						else:
							if is_instance_valid(bullets[b]):
								bullets[b].player_master=pn
				else:
					queue_free()
				die_time=0
				respawn_act=false
			else:
				t=scene_root.ai_nav_points_lib_id.pick_random()
				return
		if scene_root.mode=="team_death_match":
			var t_blue=scene_root.ai_blue_points_lib_id.pick_random()
			var t_red=scene_root.ai_red_points_lib_id.pick_random()
			var player_new=load("res://assets/player/prefab/hero_player_3rd.tscn")
			var pn=player_new.instantiate()
			if self.TDM_team=="blue":
				if(scene_root.ai_blue_points_lib[str(t_blue)])==true:
					
					pn.charactor_color=charactor_color
					pn.player_point_id=player_point_id
					
					if next_res_type==player_type:
						pn.player_type=player_type
					else:
						if next_res_type!="":
							pn.player_type=next_res_type
						else:
							pn.player_type=player_type
					pn.first_ready=true
					
					
					scene_root.players_points[player_point_id-1].add_child(pn)
					scene_root.players.append(pn)
					if scene_root.game_start==true:
						pn.control_lock=true
						pn.start_game_ui_event()
					
					pn.TDM_team="blue"
					
					pn.global_position=scene_root.players_blue_points[t_blue-1].global_position
					pn.global_rotation_degrees=scene_root.players_blue_points[t_blue-1].global_rotation_degrees
					scene_root.user_player=pn
					if pn.user_name!=self.user_name:
						pn.user_name=self.user_name
					
					
					if bullets.size()>0:
						for b in range(bullets.size()):
							if b==bullets.size()-1:
								if is_instance_valid(bullets[b]):
									bullets[b].player_master=pn
									queue_free()
								else:
									queue_free()
							else:
								if is_instance_valid(bullets[b]):
									bullets[b].player_master=pn
					else:
						queue_free()
					die_time=0
					respawn_act=false
				else:
					t_blue=scene_root.ai_blue_points_lib_id.pick_random()
					return
					
			if self.TDM_team=="red":
				if(scene_root.ai_red_points_lib[str(t_red)])==true:
					pn.charactor_color=charactor_color
					pn.player_point_id=player_point_id
					
					if next_res_type==player_type:
						pn.player_type=player_type
					else:
						if next_res_type!="":
							pn.player_type=next_res_type
						else:
							pn.player_type=player_type
					pn.first_ready=true
					
					
					scene_root.players_points[player_point_id-1].add_child(pn)
					scene_root.players.append(pn)
					if scene_root.game_start==true:
						pn.control_lock=true
						pn.start_game_ui_event()
					
					pn.TDM_team="red"
					pn.global_position=scene_root.players_red_points[t_red-1].global_position
					pn.global_rotation_degrees=scene_root.players_blue_points[t_red-1].global_rotation_degrees
					scene_root.user_player=pn
					if pn.user_name!=self.user_name:
						pn.user_name=self.user_name
					
					
					if bullets.size()>0:
						for b in range(bullets.size()):
							if b==bullets.size()-1:
								if is_instance_valid(bullets[b]):
									bullets[b].player_master=pn
									queue_free()
								else:
									queue_free()
							else:
								if is_instance_valid(bullets[b]):
									bullets[b].player_master=pn
					else:
						queue_free()
					die_time=0
					respawn_act=false
				else:
					t_red=scene_root.ai_red_points_lib_id.pick_random()
					return
var k_up=0
var k_down=0
var k_left=0
var k_right=0
var d_vec=Vector2()
var k_run=0
var m_left=0
var m_right=0
func player_input():
	if control_lock:
		if Input.is_action_pressed("move_forward"):
			k_up=1
		else:
			k_up=0
		if Input.is_action_pressed("move_back"):
			k_down=1
		else:
			k_down=0
		if Input.is_action_pressed("move_left"):
			k_left=1
		else:
			k_left=0
		if Input.is_action_pressed("move_right"):
			k_right=1
		else:
			k_right=0
		if Input.is_action_pressed("shoot"):
			m_left=1
		else:
			m_left=0
		if Input.is_action_pressed("aiming"):
			m_right=1
		else:
			m_right=0
		if Input.is_action_pressed("run"):
			k_run=1
		else:
			k_run=0
		d_vec=Vector2(k_right-k_left,k_up-k_down)
	else:
		k_up=0
		k_down=0
		k_left=0
		k_right=0
		d_vec=Vector2()
		k_run=0
		m_left=0
		m_right=0

var rifle_bullet_speed=200
var pistol_bullet_speed=200
var smg_bullet_speed=200
var sniper_bullet_speed=300
var shotgun_bullet_speed=200
var machine_gun_bullet_speed=200
func gun_shoot_anim_event():
	if using_weapon=="rifle":
		rifle_current_ammos-=1
		#camera_bullet
		var player_camera_bullet=preload("res://player_camera_bullet.tscn")
		var pcb=player_camera_bullet.instantiate()
		pcb.position=$hero_anim_1st_all_weapons.camera_main.global_position
		pcb.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		pcb.bullet_speed=rifle_bullet_speed
		pcb.player_master=self
		pcb.weapon_type="rifle"
		scene_root.add_child(pcb)
		bullets.append(pcb)
		#camera_bullet
		
		#bullet_trail
		var player_bullet_trail=preload("res://player_bullet_trail.tscn")
		var pbt=player_bullet_trail.instantiate()
		pbt.position=$hero_anim_1st_all_weapons.camera_main.global_position
		pbt.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		pcb.sub_objects.append(pbt)
		scene_root.add_child(pbt)
		#bullet_trail
		
		#shoot_bullet_mesh
		var rifle_bullet_mesh=preload("res://assets/player/prefab/rifle_ammos_1st.tscn")
		var rbm=rifle_bullet_mesh.instantiate()
		rbm.position=$hero_anim_1st_all_weapons.rifle_model.shoot_point_node.global_position
		rbm.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		rbm.speed=rifle_bullet_speed
		pcb.sub_objects.append(rbm)
		rbm.trail=pbt
		scene_root.add_child(rbm)
		#shoot_bullet_mesh
		
		#shoot_point_fire
		var rifle_fire=preload("res://assets/particles/rifle_shoot_fire.tscn")
		var rf=rifle_fire.instantiate()
		rf.position=$hero_anim_1st_all_weapons.rifle_model.shoot_point_node.global_position
		rf.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		rf.pos=$hero_anim_1st_all_weapons.rifle_model.shoot_point_node.global_position
		rf.rot=$hero_anim_1st_all_weapons.global_rotation_degrees
		rf.shoot_point_pos=$hero_anim_1st_all_weapons.rifle_model.shoot_point_node
		scene_root.add_child(rf)
		#shoot_point_fire
		
		#shoot_point_fire_3rd
		var rifle_fire_3rd=preload("res://assets/particles/rifle_shoot_fire_3rd.tscn")
		var rf_3rd=rifle_fire_3rd.instantiate()
		rf_3rd.position=rifle_model.shoot_point_node.global_position
		rf_3rd.rotation_degrees=rifle_model.shoot_point_node.global_rotation_degrees
		rf_3rd.pos=rifle_model.shoot_point_node.global_position
		rf_3rd.rot=rifle_model.shoot_point_node.global_rotation_degrees
		rf_3rd.shoot_point_pos=rifle_model.shoot_point_node
		scene_root.add_child(rf_3rd)
		#shoot_point_fire_3rd
		
		#shoot_fire_audio
		var rifle_fire_audio=preload("res://assets/audios/rifle_shoot_audio.tscn")
		var rfa=rifle_fire_audio.instantiate()
		rfa.position=$hero_anim_1st_all_weapons.rifle_model.shoot_point_node.global_position
		rfa.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		scene_root.add_child(rfa)
		#shoot_fire_audio
		
		
		
	if using_weapon=="pistol":
		pistol_current_ammos-=1
		#camera_bullet
		var player_camera_bullet=preload("res://player_camera_bullet.tscn")
		var pcb=player_camera_bullet.instantiate()
		pcb.position=$hero_anim_1st_all_weapons.camera_main.global_position
		pcb.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		pcb.bullet_speed=pistol_bullet_speed
		pcb.player_master=self
		pcb.weapon_type="pistol"
		scene_root.add_child(pcb)
		bullets.append(pcb)
		#camera_bullet
		
		#bullet_trail
		var player_bullet_trail=preload("res://player_bullet_trail.tscn")
		var pbt=player_bullet_trail.instantiate()
		pbt.position=$hero_anim_1st_all_weapons.camera_main.global_position
		pbt.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		pcb.sub_objects.append(pbt)
		scene_root.add_child(pbt)
		#bullet_trail
		
		#shoot_bullet_mesh
		var pistol_bullet_mesh=preload("res://assets/player/prefab/pistol_ammos_1st.tscn")
		var pbm=pistol_bullet_mesh.instantiate()
		pbm.position=$hero_anim_1st_all_weapons.pistol_model.shoot_point_node.global_position
		pbm.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		pbm.speed=pistol_bullet_speed
		pcb.sub_objects.append(pbm)
		pbm.trail=pbt
		scene_root.add_child(pbm)
		#shoot_bullet_mesh
		
		#shoot_point_fire
		var pistol_fire=preload("res://assets/particles/pistol_shoot_fire.tscn")
		var pf=pistol_fire.instantiate()
		pf.position=$hero_anim_1st_all_weapons.pistol_model.shoot_point_node.global_position
		pf.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		pf.pos=$hero_anim_1st_all_weapons.pistol_model.shoot_point_node.global_position
		pf.rot=$hero_anim_1st_all_weapons.global_rotation_degrees
		pf.shoot_point_pos=$hero_anim_1st_all_weapons.pistol_model.shoot_point_node
		scene_root.add_child(pf)
		#shoot_point_fire
		
		#shoot_point_fire_3rd
		var pistol_fire_3rd=preload("res://assets/particles/pistol_shoot_fire_3rd.tscn")
		var pf_3rd=pistol_fire_3rd.instantiate()
		pf_3rd.position=pistol_model.shoot_point_node.global_position
		pf_3rd.rotation_degrees=pistol_model.shoot_point_node.global_rotation_degrees
		pf_3rd.pos=pistol_model.shoot_point_node.global_position
		pf_3rd.rot=pistol_model.shoot_point_node.global_rotation_degrees
		pf_3rd.shoot_point_pos=pistol_model.shoot_point_node
		scene_root.add_child(pf_3rd)
		#shoot_point_fire_3rd
		
		#shoot_fire_audio
		var pistol_fire_audio=preload("res://assets/audios/pistol_shoot_audio.tscn")
		var pfa=pistol_fire_audio.instantiate()
		pfa.position=$hero_anim_1st_all_weapons.pistol_model.shoot_point_node.global_position
		pfa.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		scene_root.add_child(pfa)
		#shoot_fire_audio
	if using_weapon=="smg":
		smg_current_ammos-=1
		#camera_bullet
		var player_camera_bullet=preload("res://player_camera_bullet.tscn")
		var pcb=player_camera_bullet.instantiate()
		pcb.position=$hero_anim_1st_all_weapons.camera_main.global_position
		pcb.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		pcb.bullet_speed=smg_bullet_speed
		pcb.player_master=self
		pcb.weapon_type="smg"
		scene_root.add_child(pcb)
		bullets.append(pcb)
		#camera_bullet
		
		#bullet_trail
		var player_bullet_trail=preload("res://player_bullet_trail.tscn")
		var pbt=player_bullet_trail.instantiate()
		pbt.position=$hero_anim_1st_all_weapons.camera_main.global_position
		pbt.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		pcb.sub_objects.append(pbt)
		scene_root.add_child(pbt)
		#bullet_trail
		
		#shoot_bullet_mesh
		var smg_bullet_mesh=preload("res://assets/player/prefab/smg_ammo_1st.tscn")
		var sbm=smg_bullet_mesh.instantiate()
		sbm.position=$hero_anim_1st_all_weapons.smg_model.shoot_point_node.global_position
		sbm.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		sbm.speed=smg_bullet_speed
		pcb.sub_objects.append(sbm)
		sbm.trail=pbt
		scene_root.add_child(sbm)
		#shoot_bullet_mesh
		
		#shoot_point_fire
		var smg_fire=preload("res://assets/particles/smg_shoot_fire.tscn")
		var sf=smg_fire.instantiate()
		sf.position=$hero_anim_1st_all_weapons.smg_model.shoot_point_node.global_position
		sf.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		sf.pos=$hero_anim_1st_all_weapons.smg_model.shoot_point_node.global_position
		sf.rot=$hero_anim_1st_all_weapons.global_rotation_degrees
		sf.shoot_point_pos=$hero_anim_1st_all_weapons.smg_model.shoot_point_node
		scene_root.add_child(sf)
		#shoot_point_fire
		
		#shoot_point_fire_3rd
		var smg_fire_3rd=preload("res://assets/particles/smg_shoot_fire_3rd.tscn")
		var sf_3rd=smg_fire_3rd.instantiate()
		sf_3rd.position=smg_model.shoot_point_node.global_position
		sf_3rd.rotation_degrees=smg_model.shoot_point_node.global_rotation_degrees
		sf_3rd.pos=smg_model.shoot_point_node.global_position
		sf_3rd.rot=smg_model.shoot_point_node.global_rotation_degrees
		sf_3rd.shoot_point_pos=smg_model.shoot_point_node
		scene_root.add_child(sf_3rd)
		#shoot_point_fire_3rd
		
		#shoot_fire_audio
		var smg_fire_audio=preload("res://assets/audios/smg_shoot_audio.tscn")
		var sfa=smg_fire_audio.instantiate()
		sfa.position=$hero_anim_1st_all_weapons.smg_model.shoot_point_node.global_position
		sfa.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		scene_root.add_child(sfa)
		#shoot_fire_audio
	if using_weapon=="sniper":
		sniper_current_ammos-=1
		#camera_bullet
		var player_camera_bullet=preload("res://player_camera_bullet.tscn")
		var pcb=player_camera_bullet.instantiate()
		pcb.position=$hero_anim_1st_all_weapons.camera_main.global_position
		pcb.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		pcb.bullet_speed=sniper_bullet_speed
		pcb.player_master=self
		pcb.weapon_type="sniper"
		scene_root.add_child(pcb)
		bullets.append(pcb)
		#camera_bullet
		
		#bullet_trail
		var player_bullet_trail=preload("res://player_bullet_trail.tscn")
		var pbt=player_bullet_trail.instantiate()
		pbt.position=$hero_anim_1st_all_weapons.camera_main.global_position
		pbt.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		pcb.sub_objects.append(pbt)
		scene_root.add_child(pbt)
		#bullet_trail
		
		#shoot_bullet_mesh
		var sniper_bullet_mesh=preload("res://assets/player/prefab/sniper_ammo_1st.tscn")
		var ssbm=sniper_bullet_mesh.instantiate()
		ssbm.position=$hero_anim_1st_all_weapons.sniper_model.shoot_point_node.global_position
		ssbm.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		ssbm.speed=sniper_bullet_speed
		pcb.sub_objects.append(ssbm)
		ssbm.trail=pbt
		scene_root.add_child(ssbm)
		#shoot_bullet_mesh
		
		#shoot_point_fire
		var sniper_fire=preload("res://assets/particles/sniper_shoot_fire.tscn")
		var ssf=sniper_fire.instantiate()
		ssf.position=$hero_anim_1st_all_weapons.sniper_model.shoot_point_node.global_position
		ssf.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		ssf.pos=$hero_anim_1st_all_weapons.sniper_model.shoot_point_node.global_position
		ssf.rot=$hero_anim_1st_all_weapons.global_rotation_degrees
		ssf.shoot_point_pos=$hero_anim_1st_all_weapons.sniper_model.shoot_point_node
		scene_root.add_child(ssf)
		#shoot_point_fire
		
		#shoot_point_fire_3rd
		var sniper_fire_3rd=preload("res://assets/particles/sniper_shoot_fire_3rd.tscn")
		var ssf_3rd=sniper_fire_3rd.instantiate()
		ssf_3rd.position=sniper_model.shoot_point_node.global_position
		ssf_3rd.rotation_degrees=sniper_model.shoot_point_node.global_rotation_degrees
		ssf_3rd.pos=sniper_model.shoot_point_node.global_position
		ssf_3rd.rot=sniper_model.shoot_point_node.global_rotation_degrees
		ssf_3rd.shoot_point_pos=sniper_model.shoot_point_node
		scene_root.add_child(ssf_3rd)
		#shoot_point_fire_3rd
		
		#shoot_fire_audio
		var sniper_fire_audio=preload("res://assets/audios/sniper_shoot_audio.tscn")
		var ssfa=sniper_fire_audio.instantiate()
		ssfa.position=$hero_anim_1st_all_weapons.sniper_model.shoot_point_node.global_position
		ssfa.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		scene_root.add_child(ssfa)
		#shoot_fire_audio
	
	if using_weapon=="shotgun":
		shotgun_current_ammos-=1
		#camera_bullet
		var player_camera_bullet=preload("res://player_camera_bullet.tscn")
		var pcb=player_camera_bullet.instantiate()
		pcb.position=$hero_anim_1st_all_weapons.camera_main.global_position
		pcb.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		pcb.bullet_speed=shotgun_bullet_speed
		pcb.player_master=self
		pcb.weapon_type="shotgun"
		scene_root.add_child(pcb)
		bullets.append(pcb)
		#camera_bullet
		
		#bullet_trail
		var player_bullet_trail=preload("res://player_bullet_trail.tscn")
		var pbt=player_bullet_trail.instantiate()
		pbt.position=$hero_anim_1st_all_weapons.camera_main.global_position
		pbt.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		pcb.sub_objects.append(pbt)
		scene_root.add_child(pbt)
		#bullet_trail
		
		#shoot_bullet_mesh
		var shotgun_bullet_mesh=preload("res://assets/player/prefab/shotgun_ammos_1_st.tscn")
		var stbm=shotgun_bullet_mesh.instantiate()
		stbm.position=$hero_anim_1st_all_weapons.shotgun_model.shoot_point_node.global_position
		stbm.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		#stbm.speed=shotgun_bullet_speed
		pcb.sub_objects.append(stbm)
		stbm.trail=pbt
		scene_root.add_child(stbm)
		#shoot_bullet_mesh
		
		#shoot_point_fire
		var shotgun_fire=preload("res://assets/particles/shotgun_shoot_fire.tscn")
		var stf=shotgun_fire.instantiate()
		stf.position=$hero_anim_1st_all_weapons.shotgun_model.shoot_point_node.global_position
		stf.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		stf.pos=$hero_anim_1st_all_weapons.shotgun_model.shoot_point_node.global_position
		stf.rot=$hero_anim_1st_all_weapons.global_rotation_degrees
		stf.shoot_point_pos=$hero_anim_1st_all_weapons.shotgun_model.shoot_point_node
		scene_root.add_child(stf)
		#shoot_point_fire
		
		#shoot_point_fire_3rd
		var shotgun_fire_3rd=preload("res://assets/particles/shotgun_shoot_fire_3rd.tscn")
		var stf_3rd=shotgun_fire_3rd.instantiate()
		stf_3rd.position=shotgun_model.shoot_point_node.global_position
		stf_3rd.rotation_degrees=shotgun_model.shoot_point_node.global_rotation_degrees
		stf_3rd.pos=shotgun_model.shoot_point_node.global_position
		stf_3rd.rot=shotgun_model.shoot_point_node.global_rotation_degrees
		stf_3rd.shoot_point_pos=shotgun_model.shoot_point_node
		scene_root.add_child(stf_3rd)
		#shoot_point_fire_3rd
		
		#shoot_fire_audio
		var shotgun_fire_audio=preload("res://assets/audios/shotgun_shoot_audio.tscn")
		var stfa=shotgun_fire_audio.instantiate()
		stfa.position=$hero_anim_1st_all_weapons.shotgun_model.shoot_point_node.global_position
		stfa.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		scene_root.add_child(stfa)
		#shoot_fire_audio
	
	if using_weapon=="machine_gun":
		machine_gun_current_ammos-=1
		#camera_bullet
		var player_camera_bullet=preload("res://player_camera_bullet.tscn")
		var pcb=player_camera_bullet.instantiate()
		pcb.position=$hero_anim_1st_all_weapons.camera_main.global_position
		pcb.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		pcb.bullet_speed=machine_gun_bullet_speed
		pcb.player_master=self
		pcb.weapon_type="machine_gun"
		scene_root.add_child(pcb)
		bullets.append(pcb)
		#camera_bullet
		
		#bullet_trail
		var player_bullet_trail=preload("res://player_bullet_trail.tscn")
		var pbt=player_bullet_trail.instantiate()
		pbt.position=$hero_anim_1st_all_weapons.camera_main.global_position
		pbt.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		pcb.sub_objects.append(pbt)
		scene_root.add_child(pbt)
		#bullet_trail
		
		#shoot_bullet_mesh
		var machine_gun_bullet_mesh=preload("res://assets/player/prefab/machine_gun_ammo_1st.tscn")
		var mbm=machine_gun_bullet_mesh.instantiate()
		mbm.position=$hero_anim_1st_all_weapons.machine_gun_model.shoot_point_node.global_position
		mbm.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		mbm.speed=sniper_bullet_speed
		pcb.sub_objects.append(mbm)
		mbm.trail=pbt
		scene_root.add_child(mbm)
		#shoot_bullet_mesh
		
		#shoot_point_fire
		var machine_gun_fire=preload("res://assets/particles/machine_gun_shoot_fire.tscn")
		var mf=machine_gun_fire.instantiate()
		mf.position=$hero_anim_1st_all_weapons.machine_gun_model.shoot_point_node.global_position
		mf.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		mf.pos=$hero_anim_1st_all_weapons.machine_gun_model.shoot_point_node.global_position
		mf.rot=$hero_anim_1st_all_weapons.global_rotation_degrees
		mf.shoot_point_pos=$hero_anim_1st_all_weapons.machine_gun_model.shoot_point_node
		scene_root.add_child(mf)
		#shoot_point_fire
		
		#shoot_point_fire_3rd
		var machine_gun_fire_3rd=preload("res://assets/particles/machine_gun_shoot_fire_3rd.tscn")
		var mf_3rd=machine_gun_fire_3rd.instantiate()
		mf_3rd.position=machine_gun_model.shoot_point_node.global_position
		mf_3rd.rotation_degrees=machine_gun_model.shoot_point_node.global_rotation_degrees
		mf_3rd.pos=machine_gun_model.shoot_point_node.global_position
		mf_3rd.rot=machine_gun_model.shoot_point_node.global_rotation_degrees
		mf_3rd.shoot_point_pos=machine_gun_model.shoot_point_node
		scene_root.add_child(mf_3rd)
		#shoot_point_fire_3rd
		
		#shoot_fire_audio
		var machine_gun_fire_audio=preload("res://assets/audios/machine_gun_shoot_audio.tscn")
		var mfa=machine_gun_fire_audio.instantiate()
		mfa.position=$hero_anim_1st_all_weapons.machine_gun_model.shoot_point_node.global_position
		mfa.rotation_degrees=$hero_anim_1st_all_weapons.global_rotation_degrees
		scene_root.add_child(mfa)
		#shoot_fire_audio


var force_rifle=5
var force_rot_rifle=Vector3()
var force_M_pos_rifle=Vector3()

var force_pistol=8
var force_rot_pistol=Vector3()
var force_M_pos_pistol=Vector3()

var force_smg=7
var force_rot_smg=Vector3()
var force_M_pos_smg=Vector3()

var force_sniper=30
var force_rot_sniper=Vector3()
var force_M_pos_sniper=Vector3()

var force_shotgun=25
var force_rot_shotgun=Vector3()
var force_M_pos_shotgun=Vector3()

var force_machine_gun=8
var force_rot_machine_gun=Vector3()
var force_M_pos_machine_gun=Vector3()
func recoil_idle_force_on():
	if using_weapon=="rifle":
		force_M_pos_rifle=$hero_anim_1st_all_weapons.rotation_degrees
		force_rot_rifle.x=randf_range(0,force_rifle)
		force_rot_rifle.y=randf_range(-force_rifle/2,force_rifle/2)
		$".".rotation_degrees.y+=(force_rot_rifle.y*10)*get_physics_process_delta_time()
		$recoil_force_handle.rotation_degrees.x-=force_rot_rifle.x
		$recoil_force_handle.rotation_degrees.y-=force_rot_rifle.y
	if using_weapon=="pistol":
		force_M_pos_pistol=$hero_anim_1st_all_weapons.rotation_degrees
		force_rot_pistol.x=randf_range(0,force_pistol)
		force_rot_pistol.y=randf_range(-force_pistol/2,force_pistol/2)
		$".".rotation_degrees.y+=(force_rot_pistol.y*10)*get_physics_process_delta_time()
		$recoil_force_handle.rotation_degrees.x-=force_rot_pistol.x
		$recoil_force_handle.rotation_degrees.y-=force_rot_pistol.y
	if using_weapon=="smg":
		force_M_pos_smg=$hero_anim_1st_all_weapons.rotation_degrees
		force_rot_smg.x=randf_range(0,force_smg)
		force_rot_smg.y=randf_range(-force_smg/2,force_smg/2)
		$".".rotation_degrees.y+=(force_rot_smg.y*10)*get_physics_process_delta_time()
		$recoil_force_handle.rotation_degrees.x-=force_rot_smg.x
		$recoil_force_handle.rotation_degrees.y-=force_rot_smg.y
	if using_weapon=="sniper":
		force_M_pos_sniper=$hero_anim_1st_all_weapons.rotation_degrees
		force_rot_sniper.x=randf_range(0,force_sniper)
		force_rot_sniper.y=randf_range(-force_sniper/2,force_sniper/2)
		$".".rotation_degrees.y+=(force_rot_sniper.y*3)*get_physics_process_delta_time()
		$recoil_force_handle.rotation_degrees.x-=force_rot_sniper.x
		$recoil_force_handle.rotation_degrees.y-=force_rot_sniper.y
	if using_weapon=="shotgun":
		force_M_pos_shotgun=$hero_anim_1st_all_weapons.rotation_degrees
		force_rot_shotgun.x=randf_range(0,force_shotgun)
		force_rot_shotgun.y=randf_range(-force_shotgun/2,force_shotgun/2)
		$".".rotation_degrees.y+=(force_rot_shotgun.y*3)*get_physics_process_delta_time()
		$recoil_force_handle.rotation_degrees.x-=force_rot_shotgun.x
		$recoil_force_handle.rotation_degrees.y-=force_rot_shotgun.y
	if using_weapon=="machine_gun":
		force_M_pos_machine_gun=$hero_anim_1st_all_weapons.rotation_degrees
		force_rot_machine_gun.x=randf_range(0,force_machine_gun)
		force_rot_machine_gun.y=randf_range(-force_machine_gun/2,force_machine_gun/2)
		$".".rotation_degrees.y+=(force_rot_machine_gun.y*3)*get_physics_process_delta_time()
		$recoil_force_handle.rotation_degrees.x-=force_rot_machine_gun.x
		$recoil_force_handle.rotation_degrees.y-=force_rot_machine_gun.y

func recoil_aiming_force_on():
	if using_weapon=="rifle":
		force_M_pos_rifle=$hero_anim_1st_all_weapons.rotation_degrees
		force_rot_rifle.x=randf_range(0,force_rifle/4)
		force_rot_rifle.y=randf_range(-force_rifle/3,force_rifle/3)
		$".".rotation_degrees.y+=(force_rot_rifle.y*10)*get_physics_process_delta_time()
		$recoil_force_handle.rotation_degrees.x-=force_rot_rifle.x
		$recoil_force_handle.rotation_degrees.y-=force_rot_rifle.y
	if using_weapon=="pistol":
		force_M_pos_pistol=$hero_anim_1st_all_weapons.rotation_degrees
		force_rot_pistol.x=randf_range(0,force_pistol/4)
		force_rot_pistol.y=randf_range(-force_pistol/3,force_pistol/3)
		$".".rotation_degrees.y+=(force_rot_pistol.y*10)*get_physics_process_delta_time()
		$recoil_force_handle.rotation_degrees.x-=force_rot_pistol.x
		$recoil_force_handle.rotation_degrees.y-=force_rot_pistol.y
	if using_weapon=="smg":
		force_M_pos_smg=$hero_anim_1st_all_weapons.rotation_degrees
		force_rot_smg.x=randf_range(0,force_smg/4)
		force_rot_smg.y=randf_range(-force_smg/3,force_smg/3)
		$".".rotation_degrees.y+=(force_rot_smg.y*10)*get_physics_process_delta_time()
		$recoil_force_handle.rotation_degrees.x-=force_rot_smg.x
		$recoil_force_handle.rotation_degrees.y-=force_rot_smg.y
	if using_weapon=="sniper":
		force_M_pos_sniper=$hero_anim_1st_all_weapons.rotation_degrees
		force_rot_sniper.x=randf_range(0,force_sniper/4)
		force_rot_sniper.y=randf_range(-force_sniper/3,force_sniper/3)
		$".".rotation_degrees.y+=(force_rot_sniper.y*3)*get_physics_process_delta_time()
		$recoil_force_handle.rotation_degrees.x-=force_rot_sniper.x
		$recoil_force_handle.rotation_degrees.y-=force_rot_sniper.y
	if using_weapon=="shotgun":
		force_M_pos_shotgun=$hero_anim_1st_all_weapons.rotation_degrees
		force_rot_shotgun.x=randf_range(0,force_shotgun/4)
		force_rot_shotgun.y=randf_range(-force_shotgun/3,force_shotgun/3)
		$".".rotation_degrees.y+=(force_rot_shotgun.y*3)*get_physics_process_delta_time()
		$recoil_force_handle.rotation_degrees.x-=force_rot_shotgun.x
		$recoil_force_handle.rotation_degrees.y-=force_rot_shotgun.y
	if using_weapon=="machine_gun":
		force_M_pos_machine_gun=$hero_anim_1st_all_weapons.rotation_degrees
		force_rot_machine_gun.x=randf_range(0,force_machine_gun/4)
		force_rot_machine_gun.y=randf_range(-force_machine_gun/3,force_machine_gun/3)
		$".".rotation_degrees.y+=(force_rot_machine_gun.y*3)*get_physics_process_delta_time()
		$recoil_force_handle.rotation_degrees.x-=force_rot_machine_gun.x
		$recoil_force_handle.rotation_degrees.y-=force_rot_machine_gun.y
	
func recoil_force_off():
	if using_weapon=="rifle":
		force_rot_rifle=Vector3()
		$recoil_force_handle.rotation_degrees=force_M_pos_rifle
	if using_weapon=="pistol":
		force_rot_pistol=Vector3()
		$recoil_force_handle.rotation_degrees=force_M_pos_pistol
	if using_weapon=="smg":
		force_rot_smg=Vector3()
		$recoil_force_handle.rotation_degrees=force_M_pos_smg
	if using_weapon=="sniper":
		force_rot_sniper=Vector3()
		$recoil_force_handle.rotation_degrees=force_M_pos_sniper
	if using_weapon=="shotgun":
		force_rot_shotgun=Vector3()
		$recoil_force_handle.rotation_degrees=force_M_pos_shotgun
	if using_weapon=="machine_gun":
		force_rot_machine_gun=Vector3()
		$recoil_force_handle.rotation_degrees=force_M_pos_machine_gun


func bullet_exp_event(bullet_pos,air_wall_bool):
	if air_wall_bool==false:
		if using_weapon=="rifle":
			var rifle_bullet_exp=preload("res://assets/particles/bullet_exp/rifle_bullet_exp.tscn")
			var rbe=rifle_bullet_exp.instantiate()
			rbe.position=bullet_pos
			scene_root.add_child(rbe)
			
			var rifle_bullet_exp_audio=preload("res://assets/audios/rifle_bullet_exp_audio.tscn")
			var rbea=rifle_bullet_exp_audio.instantiate()
			rbea.position=bullet_pos
			scene_root.add_child(rbea)
		if using_weapon=="pistol":
			var pistol_bullet_exp=preload("res://assets/particles/bullet_exp/pistol_bullet_exp.tscn")
			var pbe=pistol_bullet_exp.instantiate()
			pbe.position=bullet_pos
			scene_root.add_child(pbe)
			
			var pistol_bullet_exp_audio=preload("res://assets/audios/pistol_bullet_exp_audio.tscn")
			var pbea=pistol_bullet_exp_audio.instantiate()
			pbea.position=bullet_pos
			scene_root.add_child(pbea)
		if using_weapon=="smg":
			var smg_bullet_exp=preload("res://assets/particles/bullet_exp/smg_bullet_exp.tscn")
			var sbe=smg_bullet_exp.instantiate()
			sbe.position=bullet_pos
			scene_root.add_child(sbe)
			
			var smg_bullet_exp_audio=preload("res://assets/audios/smg_bullet_exp_audio.tscn")
			var sbea=smg_bullet_exp_audio.instantiate()
			sbea.position=bullet_pos
			scene_root.add_child(sbea)
		if using_weapon=="sniper":
			var sniper_bullet_exp=preload("res://assets/particles/bullet_exp/sniper_bullet_exp.tscn")
			var ssbe=sniper_bullet_exp.instantiate()
			ssbe.position=bullet_pos
			scene_root.add_child(ssbe)
			
			var sniper_bullet_exp_audio=preload("res://assets/audios/sniper_bullet_exp_audio.tscn")
			var ssbea=sniper_bullet_exp_audio.instantiate()
			ssbea.position=bullet_pos
			scene_root.add_child(ssbea)
		
		if using_weapon=="shotgun":
			var shotgun_bullet_exp=preload("res://assets/particles/bullet_exp/shotgun_bullet_exp.tscn")
			var stbe=shotgun_bullet_exp.instantiate()
			stbe.position=bullet_pos
			scene_root.add_child(stbe)
			
			var shotgun_bullet_exp_audio=preload("res://assets/audios/shotgun_bullet_exp_audio.tscn")
			var stbea=shotgun_bullet_exp_audio.instantiate()
			stbea.position=bullet_pos
			scene_root.add_child(stbea)
		
		if using_weapon=="machine_gun":
			var machine_gun_bullet_exp=preload("res://assets/particles/bullet_exp/machine_gun_bullet_exp.tscn")
			var mbe=machine_gun_bullet_exp.instantiate()
			mbe.position=bullet_pos
			scene_root.add_child(mbe)
			
			var machine_gun_bullet_exp_audio=preload("res://assets/audios/machine_gun_bullet_exp_audio.tscn")
			var mbea=machine_gun_bullet_exp_audio.instantiate()
			mbea.position=bullet_pos
			scene_root.add_child(mbea)
			


func reloading_ammos_anim_event():
	if player_die==false:
		if using_weapon=="rifle":
			if rifle_spare_ammos>=rifle_ammos_needed:
				rifle_spare_ammos-=rifle_ammos_needed
				rifle_current_ammos+=rifle_ammos_needed
			else:
				rifle_current_ammos+=rifle_spare_ammos
				rifle_spare_ammos=0
		if using_weapon=="pistol":
			if pistol_spare_ammos>=pistol_ammos_needed:
				pistol_spare_ammos-=pistol_ammos_needed
				pistol_current_ammos+=pistol_ammos_needed
			else:
				pistol_current_ammos+=pistol_spare_ammos
				pistol_spare_ammos=0
		if using_weapon=="smg":
			if smg_spare_ammos>=smg_ammos_needed:
				smg_spare_ammos-=smg_ammos_needed
				smg_current_ammos+=smg_ammos_needed
			else:
				smg_current_ammos+=smg_spare_ammos
				smg_spare_ammos=0
		if using_weapon=="sniper":
			if sniper_spare_ammos>=sniper_ammos_needed:
				sniper_spare_ammos-=sniper_ammos_needed
				sniper_current_ammos+=sniper_ammos_needed
			else:
				sniper_current_ammos+=sniper_spare_ammos
				sniper_spare_ammos=0
		if using_weapon=="shotgun":
			if shotgun_spare_ammos>=0:
				shotgun_spare_ammos-=1
				shotgun_current_ammos+=1
		if using_weapon=="machine_gun":
			if machine_gun_spare_ammos>=machine_gun_ammos_needed:
				machine_gun_spare_ammos-=machine_gun_ammos_needed
				machine_gun_current_ammos+=machine_gun_ammos_needed
			else:
				machine_gun_current_ammos+=machine_gun_spare_ammos
				machine_gun_spare_ammos=0

func player_3rd_reloading_anim_event_off():
	if using_weapon=="rifle":
		rifle_model.weapon_mag_3rd.visible=false
	if using_weapon=="pistol":
		pistol_model.weapon_mag_3rd.visible=false
	if using_weapon=="smg":
		smg_model.weapon_mag_3rd.visible=false
	if using_weapon=="sniper":
		sniper_model.weapon_mag_3rd.visible=false
	if using_weapon=="shotgun":
		shotgun_model.weapon_mag_3rd.visible=false
	if using_weapon=="machine_gun":
		machine_gun_model.weapon_mag_3rd.visible=false
func player_3rd_reloading_anim_event_on():
	if using_weapon=="rifle":
		rifle_model.weapon_mag_3rd.visible=true
	if using_weapon=="pistol":
		pistol_model.weapon_mag_3rd.visible=true
	if using_weapon=="smg":
		smg_model.weapon_mag_3rd.visible=true
	if using_weapon=="sniper":
		sniper_model.weapon_mag_3rd.visible=true
	if using_weapon=="shotgun":
		shotgun_model.weapon_mag_3rd.visible=true
	if using_weapon=="machine_gun":
		machine_gun_model.weapon_mag_3rd.visible=true

@onready var hip_bone_pos_node=$Skeleton/Skeleton3D/hip_bone_pos/Area3D
@onready var spine_bone_pos_node=$Skeleton/Skeleton3D/spine_bone_pos/Area3D
@onready var leg1_l_bone_pos_node=$Skeleton/Skeleton3D/leg1_L_bone_pos/Area3D
@onready var leg2_l_bone_pos_node=$Skeleton/Skeleton3D/leg2_L_bone_pos/Area3D
@onready var foot_l_bone_pos_node=$Skeleton/Skeleton3D/foot_L_bone_pos/Area3D
@onready var leg1_r_bone_pos_node=$Skeleton/Skeleton3D/leg1_R_bone_pos/Area3D
@onready var leg2_r_bone_pos_node=$Skeleton/Skeleton3D/leg2_R_bone_pos/Area3D
@onready var foot_r_bone_pos_node=$Skeleton/Skeleton3D/foot_R_bone_pos/Area3D
@onready var head_bone_pos_node=$Skeleton/Skeleton3D/head_bone_pos/Area3D
@onready var shouder_l_bone_pos_node=$Skeleton/Skeleton3D/shouder_L_bone_pos/Area3D
@onready var arm_l_bone_pos_node=$Skeleton/Skeleton3D/arm_L_bone_pos/Area3D
@onready var hand_l_bone_pos_node=$Skeleton/Skeleton3D/hand_L_bone_pos/Area3D
@onready var shouder_r_bone_pos_node=$Skeleton/Skeleton3D/shouder_R_bone_pos/Area3D
@onready var arm_r_bone_pos_node=$Skeleton/Skeleton3D/arm_R_bone_pos/Area3D
@onready var hand_r_bone_pos_node=$Skeleton/Skeleton3D/hand_R_bone_pos/Area3D
func player_3rd_hit_blood_event(bullet_pos,weapon):
	crosshair_hit_anim_event()
	if weapon=="rifle":
		var blood_scene=preload("res://assets/particles/player_blood.tscn")
		var bs=blood_scene.instantiate()
		bs.position=bullet_pos
		scene_root.add_child(bs)
		
		var blood_hit_audio=preload("res://assets/audios/rifle_blood_audio.tscn")
		var bha=blood_hit_audio.instantiate()
		bha.position=bullet_pos
		scene_root.add_child(bha)
	if weapon=="pistol":
		var blood_scene=preload("res://assets/particles/player_blood.tscn")
		var bs=blood_scene.instantiate()
		bs.position=bullet_pos
		scene_root.add_child(bs)
		
		var blood_hit_audio=preload("res://assets/audios/pistol_blood_audio.tscn")
		var bha=blood_hit_audio.instantiate()
		bha.position=bullet_pos
		scene_root.add_child(bha)
	if weapon=="smg":
		var blood_scene=preload("res://assets/particles/player_blood.tscn")
		var bs=blood_scene.instantiate()
		bs.position=bullet_pos
		scene_root.add_child(bs)
		
		var blood_hit_audio=preload("res://assets/audios/smg_blood_audio.tscn")
		var bha=blood_hit_audio.instantiate()
		bha.position=bullet_pos
		scene_root.add_child(bha)
	if weapon=="sniper":
		var blood_scene=preload("res://assets/particles/player_blood.tscn")
		var bs=blood_scene.instantiate()
		bs.position=bullet_pos
		scene_root.add_child(bs)
		
		var blood_hit_audio=preload("res://assets/audios/sniper_blood_audio.tscn")
		var bha=blood_hit_audio.instantiate()
		bha.position=bullet_pos
		scene_root.add_child(bha)
	if weapon=="shotgun":
		var blood_scene=preload("res://assets/particles/player_blood.tscn")
		var bs=blood_scene.instantiate()
		bs.position=bullet_pos
		scene_root.add_child(bs)
		
		var blood_hit_audio=preload("res://assets/audios/shotgun_blood_audio.tscn")
		var bha=blood_hit_audio.instantiate()
		bha.position=bullet_pos
		scene_root.add_child(bha)
	if weapon=="machine_gun":
		var blood_scene=preload("res://assets/particles/player_blood.tscn")
		var bs=blood_scene.instantiate()
		bs.position=bullet_pos
		scene_root.add_child(bs)
		
		var blood_hit_audio=preload("res://assets/audios/machine_gun_blood_audio.tscn")
		var bha=blood_hit_audio.instantiate()
		bha.position=bullet_pos
		scene_root.add_child(bha)

func bullet_hit_water_event(bullet_pos):
	var wave_scene=preload("res://assets/scenes/snow_basin/water/water_wave_instance.tscn")
	var ws=wave_scene.instantiate()
	ws.position=bullet_pos
	scene_root.add_child(ws)
	
	var wave_audio=preload("res://assets/scenes/snow_basin/audio/splash(water-splashes)/splash_audio.tscn")
	var wa=wave_audio.instantiate()
	ws.position=bullet_pos
	scene_root.add_child(wa)

var enemy_pos=Vector3()

var murderer=null
func hit_loss_health_event(weapon_damage):
	player_health-=weapon_damage
	hit_from_enemy_bullet_anim_event()
	pass

func start_game_ui_event():
	$hero_anim_1st_all_weapons.start_game_ui_event()

func player_can_move():
	scene_root.game_start=true
	control_lock=true

func player_ui_control():
	if kills_event_start:
		kills_event_timer+=get_physics_process_delta_time()
		if kills_event_timer>kills_event_time_interval:
			kills_event_start=false
			kills_event_timer=0
			kills_event_id=0
			
	$hero_anim_1st_all_weapons.ammos_ui.text=str(using_weapon_current_ammos)+"/"+str(using_weapon_spare_ammos)
	if player_health>=65:
		$hero_anim_1st_all_weapons.ECG_anim.play("green")
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/blood_screen/blend_amount"]=0
	if player_health>30&&player_health<65:
		$hero_anim_1st_all_weapons.ECG_anim.play("yellow")
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/blood_screen/blend_amount"]=0
	if player_health<=30:
		$hero_anim_1st_all_weapons.ECG_anim.play("red")
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/blood_screen/blend_amount"]=1
	
	if using_weapon=="rifle":
		$hero_anim_1st_all_weapons.rifle_weapon_icon.visible=true
		$hero_anim_1st_all_weapons.pistol_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.smg_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.sniper_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.shotgun_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.machine_gun_weapon_icon.visible=false
	if using_weapon=="pistol":
		$hero_anim_1st_all_weapons.rifle_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.pistol_weapon_icon.visible=true
		$hero_anim_1st_all_weapons.smg_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.sniper_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.shotgun_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.machine_gun_weapon_icon.visible=false
	if using_weapon=="smg":
		$hero_anim_1st_all_weapons.rifle_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.pistol_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.smg_weapon_icon.visible=true
		$hero_anim_1st_all_weapons.sniper_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.shotgun_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.machine_gun_weapon_icon.visible=false
	if using_weapon=="sniper":
		$hero_anim_1st_all_weapons.rifle_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.pistol_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.smg_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.sniper_weapon_icon.visible=true
		$hero_anim_1st_all_weapons.shotgun_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.machine_gun_weapon_icon.visible=false
	if using_weapon=="shotgun":
		$hero_anim_1st_all_weapons.rifle_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.pistol_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.smg_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.sniper_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.shotgun_weapon_icon.visible=true
		$hero_anim_1st_all_weapons.machine_gun_weapon_icon.visible=false
	if using_weapon=="machine_gun":
		$hero_anim_1st_all_weapons.rifle_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.pistol_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.smg_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.sniper_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.shotgun_weapon_icon.visible=false
		$hero_anim_1st_all_weapons.machine_gun_weapon_icon.visible=true
	
	#if Input.is_action_pressed("scoreboard"):
		#if scene_root.mode=="team_death_match":
			#$hero_anim_1st_all_weapons.scoreboard_TDM.visible=true
			#$hero_anim_1st_all_weapons.scoreboard_FFA.visible=false
		#if scene_root.mode=="free_for_all":
			#$hero_anim_1st_all_weapons.scoreboard_TDM.visible=false
			#$hero_anim_1st_all_weapons.scoreboard_FFA.visible=true
	#else:
		#$hero_anim_1st_all_weapons.scoreboard_TDM.visible=false
		#$hero_anim_1st_all_weapons.scoreboard_FFA.visible=false
	
	if scene_root.game_start:
		if Input.is_action_just_pressed("quit_game"):
			if get_tree().paused==false:
				$hero_anim_1st_all_weapons.pause_menu_ui.visible=true
				$hero_anim_1st_all_weapons.ui_animation_tree["parameters/pause_state/transition_request"]="pause"
				get_tree().paused=true
				Input.set_mouse_mode(0)
		
		if using_weapon=="rifle":
			$hero_anim_1st_all_weapons.ui_animation_tree["parameters/cross_hair_control/transition_request"]="rifle"
		if using_weapon=="pistol":
			$hero_anim_1st_all_weapons.ui_animation_tree["parameters/cross_hair_control/transition_request"]="pistol"
		if using_weapon=="smg":
			$hero_anim_1st_all_weapons.ui_animation_tree["parameters/cross_hair_control/transition_request"]="smg"
		if using_weapon=="sniper":
			$hero_anim_1st_all_weapons.ui_animation_tree["parameters/cross_hair_control/transition_request"]="sniper"
		if using_weapon=="shotgun":
			$hero_anim_1st_all_weapons.ui_animation_tree["parameters/cross_hair_control/transition_request"]="shotgun"
		if using_weapon=="machine_gun":
			$hero_anim_1st_all_weapons.ui_animation_tree["parameters/cross_hair_control/transition_request"]="machine_gun"
	if scene_root.mode=="team_death_match":
		$hero_anim_1st_all_weapons.TDM_ui.visible=true
		$hero_anim_1st_all_weapons.FFA_ui.visible=false
		$hero_anim_1st_all_weapons.blue_score_node_ui.text=str(scene_root.blue_team_score)
		$hero_anim_1st_all_weapons.red_score_node_ui.text=str(scene_root.red_team_score)
	if scene_root.mode=="free_for_all":
		$hero_anim_1st_all_weapons.TDM_ui.visible=false
		$hero_anim_1st_all_weapons.FFA_ui.visible=true
		$hero_anim_1st_all_weapons.player_score_node_ui.text=str(player_kill_score_FFA)
	
	$hero_anim_1st_all_weapons.game_time_ui.text=str(scene_root.game_time_min[1])+" "+":"+" "+str(scene_root.game_time_sec[0])+str(scene_root.game_time_sec[1])
	
	if m_right:
		$hero_anim_1st_all_weapons.rifle_crosshair_visible.visible=false
		$hero_anim_1st_all_weapons.pistol_crosshair_visible.visible=false
		$hero_anim_1st_all_weapons.smg_crosshair_visible.visible=false
		$hero_anim_1st_all_weapons.shotgun_crosshair_visible.visible=false
		$hero_anim_1st_all_weapons.machine_gun_crosshair_visible.visible=false
		$hero_anim_1st_all_weapons.aiming_shoot_hit_crosshair.visible=true
	else:
		$hero_anim_1st_all_weapons.rifle_crosshair_visible.visible=true
		$hero_anim_1st_all_weapons.pistol_crosshair_visible.visible=true
		$hero_anim_1st_all_weapons.smg_crosshair_visible.visible=true
		$hero_anim_1st_all_weapons.shotgun_crosshair_visible.visible=true
		$hero_anim_1st_all_weapons.machine_gun_crosshair_visible.visible=true
		$hero_anim_1st_all_weapons.aiming_shoot_hit_crosshair.visible=false
	

func crosshair_shoot_anim_event():
	if using_weapon=="rifle":
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/rifle_crosshair/OneShot_shoot/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
	if using_weapon=="pistol":
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/pistol_crosshair/OneShot_shoot/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
	if using_weapon=="smg":
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/smg_crosshair/OneShot_shoot/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
	if using_weapon=="sniper":
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/sniper_crosshair/OneShot_shoot/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
	if using_weapon=="shotgun":
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/shotgun_crosshair/OneShot_shoot/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
	if using_weapon=="machine_gun":
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/machine_gun_crosshair/OneShot_shoot/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE

func crosshair_hit_anim_event():
	if $hero_anim_1st_all_weapons.ui_animation_tree["parameters/aiming_shoot_hit_crosshair/active"]==false:
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/aiming_shoot_hit_crosshair/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
	if using_weapon=="rifle":
		if $hero_anim_1st_all_weapons.ui_animation_tree["parameters/rifle_crosshair/OneShot_hit/active"]==false:
			$hero_anim_1st_all_weapons.ui_animation_tree["parameters/rifle_crosshair/OneShot_hit/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
	if using_weapon=="pistol":
		if $hero_anim_1st_all_weapons.ui_animation_tree["parameters/pistol_crosshair/OneShot_hit/active"]==false:
			$hero_anim_1st_all_weapons.ui_animation_tree["parameters/pistol_crosshair/OneShot_hit/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
	if using_weapon=="smg":
		if $hero_anim_1st_all_weapons.ui_animation_tree["parameters/smg_crosshair/OneShot_hit/active"]==false:
			$hero_anim_1st_all_weapons.ui_animation_tree["parameters/smg_crosshair/OneShot_hit/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
	if using_weapon=="sniper":
		if $hero_anim_1st_all_weapons.ui_animation_tree["parameters/sniper_crosshair/OneShot_hit/active"]==false:
			$hero_anim_1st_all_weapons.ui_animation_tree["parameters/sniper_crosshair/OneShot_hit/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
	if using_weapon=="shotgun":
		if $hero_anim_1st_all_weapons.ui_animation_tree["parameters/shotgun_crosshair/OneShot_hit/active"]==false:
			$hero_anim_1st_all_weapons.ui_animation_tree["parameters/shotgun_crosshair/OneShot_hit/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
	if using_weapon=="machine_gun":
		if $hero_anim_1st_all_weapons.ui_animation_tree["parameters/machine_gun_crosshair/OneShot_hit/active"]==false:
			$hero_anim_1st_all_weapons.ui_animation_tree["parameters/machine_gun_crosshair/OneShot_hit/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE

func hit_from_enemy_bullet_anim_event():
	if $hero_anim_1st_all_weapons.ui_animation_tree["parameters/hit/active"]==false:
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/hit/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE


func get_first_blood_event():
	kills_event_start=true
	$hero_anim_1st_all_weapons.ui_animation_tree["parameters/kills/transition_request"]="first_blood"
	$hero_anim_1st_all_weapons.ui_animation_tree["parameters/kill_star/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
	kills_event_id+=1
	return
var kills_event_timer=0
var kills_event_start=false
var kills_event_id=0

var kills_event_time_interval=3
func kills_anim_event():
	kills_event_start=true
	kills_event_timer=0
	
	if kills_event_id==0:
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/kills/transition_request"]="first_kill"
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/kill_star/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
		kills_event_id+=1
		return
	if kills_event_id==1:
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/kills/transition_request"]="double_kill"
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/kill_star/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
		kills_event_id+=1
		return
	if kills_event_id==2:
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/kills/transition_request"]="triple_kill"
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/kill_star/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
		kills_event_id+=1
		return
	if kills_event_id==3:
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/kills/transition_request"]="ultra_kill"
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/kill_star/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
		kills_event_id+=1
		return
	if kills_event_id==4:
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/kills/transition_request"]="rampage"
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/kill_star/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
		kills_event_id+=1
		return
	if kills_event_id>=5:
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/kills/transition_request"]="holy_shit"
		$hero_anim_1st_all_weapons.ui_animation_tree["parameters/kill_star/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
		kills_event_id+=1
		return

var GOF_bool=false
func game_over_func():
	if scene_root.game_over==true:
		if scene_root.mode=="team_death_match":
			if TDM_team==scene_root.win_team:
				$hero_anim_1st_all_weapons.victory_icon.visible=true
				$hero_anim_1st_all_weapons.draw_icon.visible=false
				$hero_anim_1st_all_weapons.defeat_icon.visible=false
				if $hero_anim_1st_all_weapons.ui_animation_tree["parameters/game_over/active"]==false:
					if GOF_bool==false:
						$hero_anim_1st_all_weapons.ui_animation_tree["parameters/game_over/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
						GOF_bool=true
			else:
				if scene_root.win_team=="draw":
					$hero_anim_1st_all_weapons.victory_icon.visible=false
					$hero_anim_1st_all_weapons.draw_icon.visible=true
					$hero_anim_1st_all_weapons.defeat_icon.visible=false
					if $hero_anim_1st_all_weapons.ui_animation_tree["parameters/game_over/active"]==false:
						if GOF_bool==false:
							$hero_anim_1st_all_weapons.ui_animation_tree["parameters/game_over/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
							GOF_bool=true
				else:
					$hero_anim_1st_all_weapons.victory_icon.visible=false
					$hero_anim_1st_all_weapons.draw_icon.visible=false
					$hero_anim_1st_all_weapons.defeat_icon.visible=true
					if $hero_anim_1st_all_weapons.ui_animation_tree["parameters/game_over/active"]==false:
						if GOF_bool==false:
							$hero_anim_1st_all_weapons.ui_animation_tree["parameters/game_over/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
							GOF_bool=true
							
		if scene_root.mode=="free_for_all":
			$hero_anim_1st_all_weapons.game_over_icon.visible=true
			if GOF_bool==false:
				$hero_anim_1st_all_weapons.ui_animation_tree["parameters/game_over/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
				GOF_bool=true


var player_kill_score_FFA=0
func FFA_game_over_kill():
	if player_kill_score_FFA>=Main_Menu_Global.setting_max_kills_i:
		scene_root.kill_score_control(self)
		
func rifle_reload1_audio_event():
	pass
func rifle_reload2_audio_event():
	pass
func pistol_reload1_audio_event():
	pass
func pistol_reload2_audio_event():
	pass
func smg_reload1_audio_event():
	pass
func smg_reload2_audio_event():
	pass
func sniper_reload1_audio_event():
	pass
func sniper_reload2_audio_event():
	pass
func sniper_reload_rock_audio_event():
	pass
func shotgun_reload_rock_audio_event():
	pass
func shotgun_reload_audio_event():
	pass
func machine_gun_reload1_audio_event():
	pass
func machine_gun_reload2_audio_event():
	pass
func machine_gun_reload3_audio_event():
	pass
func machine_gun_reload4_audio_event():
	pass

func print_killing_tips(text):
	$hero_anim_1st_all_weapons.print_killing_tips(text)


var can_throw_grenade=false
var can_close_combat=false
func player_idle_state():
	#print($hero_anim_1st_all_weapons.player_1st_animation_tree["parameters/StateMachine/playback"].get_current_node(),"  ","1st")
	#print(anim_tree_3rd["parameters/StateMachine/playback"].get_current_node(),"  ","3rd")
	
	
	#print(can_throw_grenade,"  ","can_throw_grenade")
	#print(can_close_combat,"  ","can_close_combat")
	if (hand_state_1st_anim.get_current_node()==using_weapon+"_idle"&&hand_state_3rd_anim.get_current_node()==using_weapon+"_idle")&&(hand_state_1st_anim.get_fading_from_node()==""&&hand_state_3rd_anim.get_fading_from_node()==""):
		can_throw_grenade=true
		can_close_combat=true
	else:
		can_throw_grenade=false
		can_close_combat=false

func player_sword_attack():
	var sword_action_id=[0,1]
	if hand_state_1st_anim.get_current_node()=="sword_attack":
		if hand_state_3rd_anim.get_current_node()!="sword_attack":
			hand_state_3rd_anim.travel("sword_attack")
			
	if Input.is_action_just_pressed("sword_attack"):
		if can_close_combat&&control_lock:
			hand_state_1st_anim.travel("sword_attack")
			hand_state_3rd_anim.travel("sword_attack")
			if sword_action_id.pick_random()==0:
				$hero_anim_1st_all_weapons.player_1st_animation_tree["parameters/StateMachine/sword_attack/Transition/transition_request"]="sword_attack1"
				anim_tree_3rd["parameters/StateMachine/sword_attack/Transition/transition_request"]="sword_attack1"
			if sword_action_id.pick_random()==1:
				$hero_anim_1st_all_weapons.player_1st_animation_tree["parameters/StateMachine/sword_attack/Transition/transition_request"]="sword_attack2"
				anim_tree_3rd["parameters/StateMachine/sword_attack/Transition/transition_request"]="sword_attack2"

var using_grenade="fire" #fire,smoke,flash
var using_grenade_id=0

var player_grenade_nums_fire=4
var player_grenade_nums_smoke=4
var player_grenade_nums_flash=4
var using_grenade_nums=0
func player_grenade_attack():
	if $hero_anim_1st_all_weapons.sniper_camera.current==false:
		if hand_state_1st_anim.get_current_node()!="grenade_throw":
			if Input.is_action_just_pressed("mouse_wheel_up"):
				if using_grenade_id<2:
					using_grenade_id+=1
				else:
					using_grenade_id=0
			if Input.is_action_just_pressed("mouse_wheel_down"):
				if using_grenade_id>0:
					using_grenade_id-=1
				else:
					using_grenade_id=2
		if using_grenade_id==0:
			using_grenade="fire"
			using_grenade_nums=player_grenade_nums_fire
		elif using_grenade_id==1:
			using_grenade="smoke"
			using_grenade_nums=player_grenade_nums_smoke
		elif using_grenade_id==2:
			using_grenade="flash"
			using_grenade_nums=player_grenade_nums_flash
		
	if hand_state_1st_anim.get_current_node()=="grenade_throw":
		if hand_state_3rd_anim.get_current_node()!="grenade_throw":
			hand_state_3rd_anim.travel("grenade_throw")
	if Input.is_action_just_released("throw_grenade"):
		if using_grenade_nums>0:
			if can_throw_grenade&&control_lock:
				hand_state_1st_anim.travel("grenade_throw")
				hand_state_3rd_anim.travel("grenade_throw")
				if using_grenade=="fire":
					player_grenade_nums_fire-=1
				if using_grenade=="smoke":
					player_grenade_nums_smoke-=1
				if using_grenade=="flash":
					player_grenade_nums_flash-=1
		else:
			print("no grenade")
	
	if flash_my_eyes_bool:
		flash_timer+=get_physics_process_delta_time()
	if flash_timer>5:
		$hero_anim_1st_all_weapons.white_screen.modulate=$hero_anim_1st_all_weapons.white_screen.modulate.lerp(Color("00000000"),0.005)

func grenade_throw_1st_anim_event():
	if player_die==false&&control_lock:
		var throw_force=20
		var grenade_rig=preload("res://assets/player/prefab/grenade_rig.tscn")
		var gr=grenade_rig.instantiate()
		gr.scene_root=scene_root
		gr.position=$hero_anim_1st_all_weapons.grenade_throw_pos_node.global_position
		gr.using_grenade=using_grenade
		gr.player_master=self
		if gr is RigidBody3D:
			gr.apply_impulse($hero_anim_1st_all_weapons.grenade_throw_pos_node.global_transform.basis.z*throw_force)
			gr.rotation_degrees=$hero_anim_1st_all_weapons.grenade_throw_pos_node.global_rotation_degrees
		scene_root.add_child(gr)
		#$hero_anim_1st_all_weapons.grenade_throw_pos_node

var flash_my_eyes_bool=false
var flash_timer=0
func flash_my_eyes():
	flash_timer=0
	flash_my_eyes_bool=false
	$hero_anim_1st_all_weapons.white_screen.modulate=Color("ffffffff")
	flash_my_eyes_bool=true

func sword_attack_anim_event():
	var audio_id=[0,1,2]
	var a_id=audio_id.pick_random()
	if a_id==0:
		var sword_attack_audio=preload("res://assets/audios/sword_attack_audio.tscn")
		var saa=sword_attack_audio.instantiate()
		saa.get_children()[0].autoplay=true
		$hero_anim_1st_all_weapons.add_child(saa)
	elif a_id==1:
		var sword_attack_audio=preload("res://assets/audios/sword_attack_audio.tscn")
		var saa=sword_attack_audio.instantiate()
		saa.get_children()[1].autoplay=true
		$hero_anim_1st_all_weapons.add_child(saa)
	elif a_id==2:
		var sword_attack_audio=preload("res://assets/audios/sword_attack_audio.tscn")
		var saa=sword_attack_audio.instantiate()
		saa.get_children()[2].autoplay=true
		$hero_anim_1st_all_weapons.add_child(saa)
func sword_attack1_anim_event():
	if $hero_anim_1st_all_weapons.sword_trigger.has_overlapping_bodies():
		for st in $hero_anim_1st_all_weapons.sword_trigger.get_overlapping_bodies():
			if st!=self:
				if scene_root.mode=="team_death_match":
					if st.TDM_team!=TDM_team:
						st.hit_loss_health_event(100)
						st.murderer=self
						var sword_kill_audio=preload("res://assets/audios/sword_kill_enemy_audio.tscn")
						var ska=sword_kill_audio.instantiate()
						ska.position=$hero_anim_1st_all_weapons.global_position
						scene_root.add_child(ska)
				if scene_root.mode=="free_for_all":
					st.hit_loss_health_event(100)
					st.murderer=self
					var sword_kill_audio=preload("res://assets/audios/sword_kill_enemy_audio.tscn")
					var ska=sword_kill_audio.instantiate()
					ska.position=$hero_anim_1st_all_weapons.global_position
					scene_root.add_child(ska)
