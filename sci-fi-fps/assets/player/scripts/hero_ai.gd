extends CharacterBody3D
var player_models=[]
var player_die=false
@export var player_health=100
var control_lock=false
@onready var scene_root=$"../../.."
@onready var agent_node=$NavigationAgent3D

@export var charactor_color:String
@export var TDM_team:String

@export var user_name:String


@onready var animation_tree_node=$AnimationPlayer/AnimationTree
var hand_state_anim=null
var hand_state_anim2=null
var first_ready=false
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

var can_use_sword_list=[0,1]
var can_use_sword=0
func _ready() -> void:
	can_use_sword=can_use_sword_list.pick_random()
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
	
	var want_running_random=randi_range(0,1)
	if want_running_random==0:
		want_running=false
	else:
		want_running=true
	
	
	
	set_floor_snap_length(10)
	shoot_point_ray_cast_node.add_exception(self)
	ai_search_enemy_node.add_exception(self)
	
	shoot_point_ray_cast_node.add_exception(hip_bone_pos_node)
	ai_search_enemy_node.add_exception(hip_bone_pos_node)
	
	shoot_point_ray_cast_node.add_exception(spine_bone_pos_node)
	ai_search_enemy_node.add_exception(spine_bone_pos_node)
	
	shoot_point_ray_cast_node.add_exception(leg1_l_bone_pos_node)
	ai_search_enemy_node.add_exception(leg1_l_bone_pos_node)
	
	shoot_point_ray_cast_node.add_exception(leg2_l_bone_pos_node)
	ai_search_enemy_node.add_exception(leg2_l_bone_pos_node)
	
	shoot_point_ray_cast_node.add_exception(foot_l_bone_pos_node)
	ai_search_enemy_node.add_exception(foot_l_bone_pos_node)
	
	shoot_point_ray_cast_node.add_exception(leg1_r_bone_pos_node)
	ai_search_enemy_node.add_exception(leg1_r_bone_pos_node)
	
	shoot_point_ray_cast_node.add_exception(leg2_r_bone_pos_node)
	ai_search_enemy_node.add_exception(leg2_r_bone_pos_node)
	
	shoot_point_ray_cast_node.add_exception(foot_r_bone_pos_node)
	ai_search_enemy_node.add_exception(foot_r_bone_pos_node)
	
	shoot_point_ray_cast_node.add_exception(head_bone_pos_node)
	ai_search_enemy_node.add_exception(head_bone_pos_node)
	
	shoot_point_ray_cast_node.add_exception(shouder_l_bone_pos_node)
	ai_search_enemy_node.add_exception(shouder_l_bone_pos_node)
	
	shoot_point_ray_cast_node.add_exception(arm_l_bone_pos_node)
	ai_search_enemy_node.add_exception(arm_l_bone_pos_node)
	
	shoot_point_ray_cast_node.add_exception(hand_l_bone_pos_node)
	ai_search_enemy_node.add_exception(hand_l_bone_pos_node)
	
	shoot_point_ray_cast_node.add_exception(shouder_r_bone_pos_node)
	ai_search_enemy_node.add_exception(shouder_r_bone_pos_node)
	
	shoot_point_ray_cast_node.add_exception(arm_r_bone_pos_node)
	ai_search_enemy_node.add_exception(arm_r_bone_pos_node)
	
	shoot_point_ray_cast_node.add_exception(hand_r_bone_pos_node)
	ai_search_enemy_node.add_exception(hand_r_bone_pos_node)
	
	
	hand_state_anim=animation_tree_node["parameters/StateMachine/playback"]
	hand_state_anim2=animation_tree_node["parameters/move/0/playback"]
	
	rifle_model.player_master=self
	pistol_model.player_master=self
	smg_model.player_master=self
	sniper_model.player_master=self
	shotgun_model.player_master=self
	machine_gun_model.player_master=self
	
	rifle_mag_model.player_master=self
	pistol_mag_model.player_master=self
	smg_mag_model.player_master=self
	sniper_mag_model.player_master=self
	shotgun_mag_model.player_master=self
	machine_gun_mag_model.player_master=self
	
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
	
	for pm in range(player_models.size()):
			player_models[pm].set_cast_shadows_setting(1)
	
	
	# rifle pistol smg sniper shotgun machine_gun
	using_weapon=["rifle","pistol","smg","sniper","shotgun","machine_gun"].pick_random()
	
	if first_ready==false:
		hand_state_anim.start(using_weapon+"_first_ready")
	else:
		hand_state_anim.start(using_weapon+"_equip")
func _physics_process(delta: float) -> void:
	
	if scene_root.game_over==true:
		control_lock=false
	if scene_root.game_start&&scene_root.game_over==false:
		control_lock=true
	player_move()
	player_animation()
	player_navigation_control()
	player_weapons()
	player_set_enemy()
	if can_use_sword==1:
		ai_sword_attack()
	player_grenade_attack()
	player_dazzle()
	player_blinding()
	
	FFA_game_over_kill()
	player_die_state()
	if bot_diffoculty=="":
		player_difficulty_control()

var move_speed=5
var move_speed_main=5
var walk_speed=2.5
var run_speed=15
var jump_height=12
var jump_speed=8
var jump_to_ground=false
var run_to_idle_time_1st=1.25
var run_to_idle_time_3rd=1.25

var rotate_speed=500

var vel=Vector3()


func player_move():
	if scene_root.game_over:
		animation_tree_node["parameters/move/blend_position"]=animation_tree_node["parameters/move/blend_position"].lerp(Vector2(0,0),0.3)
		animation_tree_node["parameters/run/blend_amount"]=Vector2(animation_tree_node["parameters/run/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	#for i in get_slide_collision_count():
	#	var collision = get_slide_collision(i)
	#	if collision.get_collider().get_collision_mask()!=2:
	#		set_collision_mask_value(2,true)
	if control_lock:
		if is_on_floor():
			if agent_node.is_navigation_finished():
				return
			var current_agent_position=global_position
			var next_path_position=agent_node.get_next_path_position()
			if battle_state==false:
				ai_look_node.look_at(next_path_position,Vector3.UP,true)
				ai_look_x.rotation_degrees.y=ai_look_node.rotation_degrees.y
			else:
				if enemy_target!=null:
					ai_look_node.look_at(enemy_target.global_position,Vector3.UP,true)
					ai_look_x.rotation_degrees.y=ai_look_node.rotation_degrees.y

			if abs($Skeleton.rotation_degrees.y-ai_look_x.rotation_degrees.y)<=5:
				$Skeleton.rotation_degrees.y=ai_look_x.rotation_degrees.y
			else:
				if $Skeleton.rotation_degrees.y-ai_look_x.rotation_degrees.y>0:
					if  $Skeleton.rotation_degrees.y-ai_look_x.rotation_degrees.y<=180:
						$Skeleton.rotation_degrees.y-=rotate_speed*get_physics_process_delta_time()
					elif $Skeleton.rotation_degrees.y-ai_look_x.rotation_degrees.y>180:
						$Skeleton.rotation_degrees.y-=360
				elif $Skeleton.rotation_degrees.y-ai_look_x.rotation_degrees.y<0:
					if  $Skeleton.rotation_degrees.y-ai_look_x.rotation_degrees.y>=-180:
						$Skeleton.rotation_degrees.y+=rotate_speed*get_physics_process_delta_time()
					elif $Skeleton.rotation_degrees.y-ai_look_x.rotation_degrees.y<-180:
						$Skeleton.rotation_degrees.y+=360
			velocity=current_agent_position.direction_to(next_path_position)*move_speed
			move_and_slide()
		else:
			velocity.y+=get_gravity().y*get_physics_process_delta_time()
			move_and_slide()
	else:
		velocity.x=0
		velocity.z=0
		animation_tree_node["parameters/move/blend_position"]=animation_tree_node["parameters/move/blend_position"].lerp(Vector2(0,0),0.3)
		animation_tree_node["parameters/run/blend_amount"]=Vector2(animation_tree_node["parameters/run/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		velocity.y+=get_gravity().y*get_physics_process_delta_time()
		move_and_slide()
	if battle_state==true||can_shoot==true:
		move_speed=0
	else:
		if want_running==false:
			move_speed=move_speed_main
		else:
			move_speed=run_speed

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
@onready var shotgun_mag_model=$Skeleton/Skeleton3D/thumb_left/shotgun_ammo_model_3rd
@onready var machine_gun_mag_model=$Skeleton/Skeleton3D/left_hand/machine_gun_mag_3rd

# rifle pistol smg sniper shotgun machine_gun
var using_weapon="rifle"
var want_running=false

var arm_rot_y=0


var rifle_distance_range=[30,50]
var pistol_distance_range=[30,50]
var smg_distance_range=[30,50]
var sniper_distance_range=[30,65]
var shotgun_distance_range=[20,40]
var machine_gun_distance_range=[30,50]

var using_weapon_distance_range=[0,0]




func player_animation():
	if not is_on_floor():
		animation_tree_node["parameters/jump/blend_amount"]=Vector2(animation_tree_node["parameters/jump/blend_amount"],0).lerp(Vector2(1,0),0.3).x
	else:
		animation_tree_node["parameters/jump/blend_amount"]=Vector2(animation_tree_node["parameters/jump/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	if hand_state_anim.get_current_node()!=using_weapon+"_idle":
		hand_state_anim.travel(using_weapon+"_idle")
		hand_state_anim2.travel(using_weapon+"_idle")
	if battle_state==false:
		if not agent_node.is_navigation_finished():
			if control_lock:
				if want_running==false:
					animation_tree_node["parameters/move/blend_position"]=animation_tree_node["parameters/move/blend_position"].lerp(Vector2(0,1),0.3)
					animation_tree_node["parameters/run/blend_amount"]=Vector2(animation_tree_node["parameters/run/blend_amount"],0).lerp(Vector2(0,0),0.3).x
				else:
					animation_tree_node["parameters/move/blend_position"]=animation_tree_node["parameters/move/blend_position"].lerp(Vector2(0,0),0.3)
					animation_tree_node["parameters/run/blend_amount"]=Vector2(animation_tree_node["parameters/run/blend_amount"],0).lerp(Vector2(1,0),0.3).x
			
	else:
		animation_tree_node["parameters/move/blend_position"]=animation_tree_node["parameters/move/blend_position"].lerp(Vector2(0,0),0.3)
		animation_tree_node["parameters/run/blend_amount"]=Vector2(animation_tree_node["parameters/run/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	
	
	arm_rot_y=$arm_handle_AI.rotation_degrees.x/70
	
	
	if using_weapon=="rifle":
		using_weapon_distance_range=rifle_distance_range
		animation_tree_node["parameters/StateMachine/rifle_idle/y/blend_amount"]=Vector2(animation_tree_node["parameters/StateMachine/rifle_idle/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		animation_tree_node["parameters/StateMachine/rifle_idle/y/blend_amount"]=Vector2(animation_tree_node["parameters/StateMachine/rifle_idle/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	
	if using_weapon=="pistol":
		using_weapon_distance_range=pistol_distance_range
		animation_tree_node["parameters/StateMachine/pistol_idle/y/blend_amount"]=Vector2(animation_tree_node["parameters/StateMachine/pistol_idle/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		animation_tree_node["parameters/StateMachine/pistol_idle/y/blend_amount"]=Vector2(animation_tree_node["parameters/StateMachine/pistol_idle/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		
	if using_weapon=="smg":
		using_weapon_distance_range=smg_distance_range
		animation_tree_node["parameters/StateMachine/smg_idle/y/blend_amount"]=Vector2(animation_tree_node["parameters/StateMachine/smg_idle/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		animation_tree_node["parameters/StateMachine/smg_idle/y/blend_amount"]=Vector2(animation_tree_node["parameters/StateMachine/smg_idle/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	
	if using_weapon=="sniper":
		using_weapon_distance_range=sniper_distance_range
		animation_tree_node["parameters/StateMachine/sniper_idle/y/blend_amount"]=Vector2(animation_tree_node["parameters/StateMachine/sniper_idle/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		animation_tree_node["parameters/StateMachine/sniper_idle/y/blend_amount"]=Vector2(animation_tree_node["parameters/StateMachine/sniper_idle/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	
	if using_weapon=="shotgun":
		using_weapon_distance_range=shotgun_distance_range
		animation_tree_node["parameters/StateMachine/shotgun_idle/y/blend_amount"]=Vector2(animation_tree_node["parameters/StateMachine/shotgun_idle/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		animation_tree_node["parameters/StateMachine/shotgun_idle/y/blend_amount"]=Vector2(animation_tree_node["parameters/StateMachine/shotgun_idle/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
		
	if using_weapon=="machine_gun":
		using_weapon_distance_range=machine_gun_distance_range
		animation_tree_node["parameters/StateMachine/machine_gun_idle/y/blend_amount"]=Vector2(animation_tree_node["parameters/StateMachine/machine_gun_idle/y/blend_amount"],0).lerp(Vector2(arm_rot_y,0),0.3).x
	else:
		animation_tree_node["parameters/StateMachine/machine_gun_idle/y/blend_amount"]=Vector2(animation_tree_node["parameters/StateMachine/machine_gun_idle/y/blend_amount"],0).lerp(Vector2(0,0),0.3).x
	if control_lock:
		if can_shoot==true:
			if hand_state_anim.get_current_node()==using_weapon+"_idle":
				if animation_tree_node["parameters/IS/active"]!=true:
					animation_tree_node["parameters/IS/request"]=AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
				
	if using_weapon=="rifle":
		animation_tree_node["parameters/state_shoot_aiming /transition_request"]="rifle"
		animation_tree_node["parameters/state_shoot_idle/transition_request"]="rifle"
		animation_tree_node["parameters/Transition_run/transition_request"]="rifle"
	if using_weapon=="pistol":
		animation_tree_node["parameters/state_shoot_aiming /transition_request"]="pistol"
		animation_tree_node["parameters/state_shoot_idle/transition_request"]="pistol"
		animation_tree_node["parameters/Transition_run/transition_request"]="pistol"
	if using_weapon=="smg":
		animation_tree_node["parameters/state_shoot_aiming /transition_request"]="smg"
		animation_tree_node["parameters/state_shoot_idle/transition_request"]="smg"
		animation_tree_node["parameters/Transition_run/transition_request"]="smg"
	if using_weapon=="sniper":
		animation_tree_node["parameters/state_shoot_aiming /transition_request"]="sniper"
		animation_tree_node["parameters/state_shoot_idle/transition_request"]="sniper"
		animation_tree_node["parameters/Transition_run/transition_request"]="sniper"
	if using_weapon=="shotgun":
		animation_tree_node["parameters/state_shoot_aiming /transition_request"]="shotgun"
		animation_tree_node["parameters/state_shoot_idle/transition_request"]="shotgun"
		animation_tree_node["parameters/Transition_run/transition_request"]="shotgun"
	if using_weapon=="machine_gun":
		animation_tree_node["parameters/state_shoot_aiming /transition_request"]="machine_gun"
		animation_tree_node["parameters/state_shoot_idle/transition_request"]="machine_gun"
		animation_tree_node["parameters/Transition_run/transition_request"]="machine_gun"
	
	if control_lock:
		if can_shoot==false&&using_weapon_current_ammos<=0:
			if using_weapon_current_ammos<using_weapon_current_max_ammos&&using_weapon_spare_ammos>0:
				hand_state_anim.travel(using_weapon+"_reloading_1")
		
	
	
#@onready var nav_points=scene_root.ai_nav_points
#@onready var nav_points_lib=scene_root.ai_nav_points_lib
#@onready var nav_points_lib_size=scene_root.ai_lib_size
var target=null
var target_n=0
func player_navigation_control():
	if control_lock:
		#agent_node.set_target_position(scene_main_node.test_player.global_position)
		if target==null:
			for t in scene_root.ai_nav_points_lib.keys(): #values
				if(scene_root.ai_nav_points_lib[str(t)])==true:
					target=scene_root.ai_nav_points[t-1]
					target_n=t
					#scene_root.ai_nav_points_lib[t]=false
					break
		else:
			agent_node.set_target_position(target.global_position)
		if agent_node.is_navigation_finished():
			if target!=null:
				var rand_lib=randi_range(1,scene_root.ai_lib_size)
				if scene_root.ai_nav_points_lib[rand_lib]==true:
					scene_root.ai_nav_points_lib[target_n]=true
					target_n=0
					target=scene_root.ai_nav_points[rand_lib-1]
				else:
					rand_lib=randi_range(1,scene_root.ai_lib_size)
		

var enemies=[]
var enemy_main=null
var enemy_target=null
var reaction=0
var reaction_time=2
var can_shoot=false
var rotate_y_speed=0.5

var battle_state=false

@onready var shoot_point_ray_cast_node=$arm_handle_AI/search_RayCast3D_shoot_point#检测枪口能不能对准敌人
@onready var ai_search_enemy_node=$AI_search_enemy#全向旋转检测能看到哪些敌人
@onready var ai_look_node=$rot_node#控制摇臂用的
@onready var ai_look_x=$rot_node_x
@export var test:bool
var e=0
var e_switch_timer=0
func player_set_enemy():
	if control_lock:
		e_switch_timer+=get_physics_process_delta_time()
		ai_search_enemy_node.force_raycast_update()
		if battle_state:
			reaction+=get_physics_process_delta_time()
		else:
			reaction=0
		if enemy_main==null:
			if e<=scene_root.players.size()-1:
				if scene_root.players[e]!=self:
					if scene_root.players[e].global_position.distance_to(self.global_position)<using_weapon_distance_range[1]:
						if scene_root.mode=="free_for_all":
							enemy_main=scene_root.players[e]
						if scene_root.mode=="team_death_match":
							if scene_root.players[e].TDM_team!=self.TDM_team:
								enemy_main=scene_root.players[e]
				e+=1
			else:
				e=0
	
		if enemy_main!=null:
			enemy_target=enemy_main
		
			if enemy_main.player_die==true:
				enemy_main=null
				enemy_target=null
				e=0
		if enemy_target!=null:
			ai_search_enemy_node.look_at(enemy_target.global_position,Vector3.UP,true)
			$arm_handle_AI.rotation_degrees.x=$arm_handle_AI.rotation_degrees.lerp(ai_look_node.rotation_degrees,rotate_y_speed).x
			$arm_handle_AI.rotation_degrees.y=$Skeleton.rotation_degrees.y
			if scene_root.mode=="free_for_all":
				if ai_search_enemy_node.is_colliding():
					if ai_search_enemy_node.get_collider().get_collision_layer()==32:
						battle_state=true
					else:
						battle_state=false
						if e_switch_timer>0.5:
							enemy_main=null
							enemy_target=null
							e_switch_timer=0
				else:
						battle_state=false
						enemy_main=null
						enemy_target=null
			
			if scene_root.mode=="team_death_match":
				if ai_search_enemy_node.is_colliding():
					if ai_search_enemy_node.get_collider().get_collision_layer()==32:
						if ai_search_enemy_node.get_collider().player_master.TDM_team!=self.TDM_team:
							battle_state=true
						#else:
							#battle_state=false
					else:
						battle_state=false
						if e_switch_timer>0.5:
							enemy_main=null
							enemy_target=null
							e_switch_timer=0
				else:
						battle_state=false
						enemy_main=null
						enemy_target=null
			if shoot_point_ray_cast_node.is_colliding():
				if shoot_point_ray_cast_node.get_collider().get_collision_layer()==32&&scene_root.mode=="free_for_all":
					if animation_tree_node["parameters/run/blend_amount"]<=0.1:
						if using_weapon_current_ammos>0:
							if reaction>=reaction_time:
								if can_throw==false:
									if dazzle_state==false:
										can_shoot=true
									else:
										can_shoot=false
								else:
									can_shoot=false
							else:
								can_shoot=false
						else:
							can_shoot=false
					else:
						can_shoot=false
				if shoot_point_ray_cast_node.get_collider().get_collision_layer()==32&&scene_root.mode=="team_death_match":
					if shoot_point_ray_cast_node.get_collider().player_master.TDM_team!=self.TDM_team:
						if animation_tree_node["parameters/run/blend_amount"]<=0.1:
							if using_weapon_current_ammos>0:
								if reaction>=reaction_time:
									if can_throw==false:
										can_shoot=true
									else:
										can_shoot=false
								else:
									can_shoot=false
							else:
								can_shoot=false
						else:
							can_shoot=false
					else:
						can_shoot=false
		else:
			battle_state=false
			can_shoot=false

var full_automatic_weapon=false
var semi_automatic_weapon=false
var semi_automatic_weapon_shot=false


var rifle_current_ammos=30
var rifle_current_max_ammos=30
var rifle_ammos_needed=0
#var rifle_spare_ammos=360*10
var rifle_spare_ammos=3600

var pistol_current_ammos=12
var pistol_current_max_ammos=12
var pistol_ammos_needed=0
#var pistol_spare_ammos=120*10
var pistol_spare_ammos=1200

var smg_current_ammos=60
var smg_current_max_ammos=60
var smg_ammos_needed=0
#var smg_spare_ammos=1200*10
var smg_spare_ammos=12000

var sniper_current_ammos=4
var sniper_current_max_ammos=4
var sniper_ammos_needed=0
#var sniper_spare_ammos=32*10
var sniper_spare_ammos=320

var shotgun_current_ammos=6
var shotgun_current_max_ammos=6
var shotgun_ammos_needed=0
#var shotgun_spare_ammos=120*10
var shotgun_spare_ammos=1200

var machine_gun_current_ammos=100
var machine_gun_current_max_ammos=100
var machine_gun_ammos_needed=0
#var machine_gun_spare_ammos=1200*10
var machine_gun_spare_ammos=12000

var using_weapon_current_ammos=0
var using_weapon_current_max_ammos=0
var using_weapon_ammos_needed=0
var using_weapon_spare_ammos=0


var rifle_bullet_speed=200
var pistol_bullet_speed=200
var smg_bullet_speed=200
var sniper_bullet_speed=300
var shotgun_bullet_speed=200
var machine_gun_bullet_speed=200
func player_weapons():
	#---------ammos-------------
	if using_weapon=="rifle":
		using_weapon_current_ammos=rifle_current_ammos
		using_weapon_spare_ammos=rifle_spare_ammos
		using_weapon_current_max_ammos=rifle_current_max_ammos
		using_weapon_ammos_needed=rifle_ammos_needed
	if using_weapon=="pistol":
		using_weapon_current_ammos=pistol_current_ammos
		using_weapon_spare_ammos=pistol_spare_ammos
		using_weapon_current_max_ammos=pistol_current_max_ammos
		using_weapon_ammos_needed=pistol_ammos_needed
	if using_weapon=="smg":
		using_weapon_current_ammos=smg_current_ammos
		using_weapon_spare_ammos=smg_spare_ammos
		using_weapon_current_max_ammos=smg_current_max_ammos
		using_weapon_ammos_needed=smg_ammos_needed
	if using_weapon=="sniper":
		using_weapon_current_ammos=sniper_current_ammos
		using_weapon_spare_ammos=sniper_spare_ammos
		using_weapon_current_max_ammos=sniper_current_max_ammos
		using_weapon_ammos_needed=sniper_ammos_needed
	if using_weapon=="shotgun":
		using_weapon_current_ammos=shotgun_current_ammos
		using_weapon_spare_ammos=shotgun_spare_ammos
		using_weapon_current_max_ammos=shotgun_current_max_ammos
		using_weapon_ammos_needed=shotgun_ammos_needed
	if using_weapon=="machine_gun":
		using_weapon_current_ammos=machine_gun_current_ammos
		using_weapon_spare_ammos=machine_gun_spare_ammos
		using_weapon_current_max_ammos=machine_gun_current_max_ammos
		using_weapon_ammos_needed=machine_gun_ammos_needed
	
	rifle_ammos_needed=rifle_current_max_ammos-rifle_current_ammos
	pistol_ammos_needed=pistol_current_max_ammos-pistol_current_ammos
	smg_ammos_needed=smg_current_max_ammos-smg_current_ammos
	sniper_ammos_needed=sniper_current_max_ammos-sniper_current_ammos
	shotgun_ammos_needed=shotgun_current_max_ammos-shotgun_current_ammos
	machine_gun_ammos_needed=machine_gun_current_max_ammos-machine_gun_current_ammos
	
	



var print_A_kills_B_lock=true
func player_die_state():
	if player_health<=0:
		player_health=0
		player_die=true
		
	if player_die:
		$Skeleton/Skeleton3D/PhysicalBoneSimulator3D.physical_bones_start_simulation()
		animation_tree_node.active=false
		
		#move
		move_speed=0
		move_speed_main=0
		walk_speed=0
		jump_height=0
		jump_speed=0
		#move
		
		#physics
		$".".set_collision_layer_value(2,false)
		$".".set_collision_mask_value(2,false)
		#physics
		
		#shoot
		can_shoot=false
		battle_state=false
		#shoot
	
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
	
	if respawn_act:
		
		if scene_root.mode=="free_for_all":
			var player_new=load("res://assets/player/AI/prefab/hero_AI.tscn")
			var t=scene_root.ai_nav_points_lib_id.pick_random()
			var pn=player_new.instantiate()
			if(scene_root.ai_nav_points_lib[str(t)])==true:
				
			
			
				pn.player_point_id=player_point_id
				pn.charactor_color=charactor_color
				pn.first_ready=true
			
				scene_root.players_points[player_point_id-1].add_child(pn)
				scene_root.players.append(pn)
				if scene_root.game_start==true:
					pn.control_lock=true
				
				pn.global_position=scene_root.ai_nav_points[t-1].global_position
				pn.global_rotation_degrees=scene_root.ai_nav_points[t-1].global_rotation_degrees
				pn.player_kill_score_FFA=player_kill_score_FFA
				pn.throw_timer=throw_timer
				
				
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
		if scene_root.mode=="team_death_match":
			var t_blue=scene_root.ai_blue_points_lib_id.pick_random()
			var t_red=scene_root.ai_red_points_lib_id.pick_random()
			var player_new=load("res://assets/player/AI/prefab/hero_AI.tscn")
			var pn=player_new.instantiate()
			if self.TDM_team=="blue":
				if(scene_root.ai_blue_points_lib[str(t_blue)])==true:
					
					pn.player_point_id=player_point_id
					pn.charactor_color=charactor_color
					pn.first_ready=true
					
					scene_root.players_points[player_point_id-1].add_child(pn)
					scene_root.players.append(pn)
					if scene_root.game_start==true:
						pn.control_lock=true
						
					pn.global_position=scene_root.players_blue_points[t_blue-1].global_position
					pn.global_rotation_degrees=scene_root.players_blue_points[t_blue-1].global_rotation_degrees
					pn.throw_timer=throw_timer
					
					
					pn.TDM_team="blue"
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
			if self.TDM_team=="red":
				if(scene_root.ai_red_points_lib[str(t_red)])==true:
					pn.player_point_id=player_point_id
					pn.charactor_color=charactor_color
					pn.first_ready=true
					
					scene_root.players_points[player_point_id-1].add_child(pn)
					scene_root.players.append(pn)
					if scene_root.game_start==true:
						pn.control_lock=true
						
					pn.global_position=scene_root.players_red_points[t_red-1].global_position
					pn.global_rotation_degrees=scene_root.players_blue_points[t_red-1].global_rotation_degrees
					pn.throw_timer=throw_timer
					
					
					pn.TDM_team="red"
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

func gun_shoot_anim_event():
	if using_weapon=="rifle":
		rifle_current_ammos-=1
		#camera_bullet
		var player_camera_bullet=preload("res://ai_handle_bullet.tscn")
		var pcb=player_camera_bullet.instantiate()
		pcb.position=$arm_handle_AI.global_position
		pcb.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		pcb.bullet_speed=rifle_bullet_speed
		pcb.player_master=self
		pcb.weapon_type="rifle"
		scene_root.add_child(pcb)
		#camera_bullet
		
		#bullet_trail
		var player_bullet_trail=preload("res://ai_bullet_trail.tscn")
		var pbt=player_bullet_trail.instantiate()
		pbt.position=$arm_handle_AI.global_position
		pbt.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		pcb.sub_objects.append(pbt)
		scene_root.add_child(pbt)
		#bullet_trail
		
		#shoot_bullet_mesh
		var rifle_bullet_mesh=preload("res://assets/player/prefab/rifle_ammos_3rd.tscn")
		var rbm=rifle_bullet_mesh.instantiate()
		rbm.position=rifle_model.shoot_point_node.global_position
		rbm.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		rbm.speed=rifle_bullet_speed
		pcb.sub_objects.append(rbm)
		rbm.trail=pbt
		scene_root.add_child(rbm)
		#shoot_bullet_mesh
		
		#shoot_point_fire_3rd
		var rifle_fire_3rd=preload("res://assets/particles/rifle_shoot_fire_ai.tscn")
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
		rfa.position=rifle_model.shoot_point_node.global_position
		rfa.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		scene_root.add_child(rfa)
		#shoot_fire_audio

	if using_weapon=="pistol":
		pistol_current_ammos-=1
		#camera_bullet
		var player_camera_bullet=preload("res://ai_handle_bullet.tscn")
		var pcb=player_camera_bullet.instantiate()
		pcb.position=$arm_handle_AI.global_position
		pcb.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		pcb.bullet_speed=pistol_bullet_speed
		pcb.player_master=self
		pcb.weapon_type="pistol"
		scene_root.add_child(pcb)
		#camera_bullet
		
		#bullet_trail
		var player_bullet_trail=preload("res://ai_bullet_trail.tscn")
		var pbt=player_bullet_trail.instantiate()
		pbt.position=$arm_handle_AI.global_position
		pbt.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		pcb.sub_objects.append(pbt)
		scene_root.add_child(pbt)
		#bullet_trail
		
		#shoot_bullet_mesh
		var pistol_bullet_mesh=preload("res://assets/player/prefab/pistol_ammos_3rd.tscn")
		var pbm=pistol_bullet_mesh.instantiate()
		pbm.position=pistol_model.shoot_point_node.global_position
		pbm.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		pbm.speed=pistol_bullet_speed
		pcb.sub_objects.append(pbm)
		pbm.trail=pbt
		scene_root.add_child(pbm)
		#shoot_bullet_mesh
		
		#shoot_point_fire_3rd
		var pistol_fire_3rd=preload("res://assets/particles/pistol_shoot_fire_ai.tscn")
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
		pfa.position=pistol_model.shoot_point_node.global_position
		pfa.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		scene_root.add_child(pfa)
		#shoot_fire_audio
		
	if using_weapon=="smg":
		smg_current_ammos-=1
		#camera_bullet
		var player_camera_bullet=preload("res://ai_handle_bullet.tscn")
		var smcb=player_camera_bullet.instantiate()
		smcb.position=$arm_handle_AI.global_position
		smcb.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		smcb.bullet_speed=smg_bullet_speed
		smcb.player_master=self
		smcb.weapon_type="smg"
		scene_root.add_child(smcb)
		#camera_bullet
		
		#bullet_trail
		var player_bullet_trail=preload("res://ai_bullet_trail.tscn")
		var pbt=player_bullet_trail.instantiate()
		pbt.position=$arm_handle_AI.global_position
		pbt.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		smcb.sub_objects.append(pbt)
		scene_root.add_child(pbt)
		#bullet_trail
		
		#shoot_bullet_mesh
		var smg_bullet_mesh=preload("res://assets/player/prefab/smg_ammo_3rd.tscn")
		var smbm=smg_bullet_mesh.instantiate()
		smbm.position=smg_model.shoot_point_node.global_position
		smbm.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		smbm.speed=smg_bullet_speed
		smcb.sub_objects.append(smbm)
		smbm.trail=pbt
		scene_root.add_child(smbm)
		#shoot_bullet_mesh
		
		#shoot_point_fire_3rd
		var smg_fire_3rd=preload("res://assets/particles/smg_shoot_fire_ai.tscn")
		var smf_3rd=smg_fire_3rd.instantiate()
		smf_3rd.position=smg_model.shoot_point_node.global_position
		smf_3rd.rotation_degrees=smg_model.shoot_point_node.global_rotation_degrees
		smf_3rd.pos=smg_model.shoot_point_node.global_position
		smf_3rd.rot=smg_model.shoot_point_node.global_rotation_degrees
		smf_3rd.shoot_point_pos=smg_model.shoot_point_node
		scene_root.add_child(smf_3rd)
		#shoot_point_fire_3rd
		
		#shoot_fire_audio
		var smg_fire_audio=preload("res://assets/audios/smg_shoot_audio.tscn")
		var smfa=smg_fire_audio.instantiate()
		smfa.position=smg_model.shoot_point_node.global_position
		smfa.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		scene_root.add_child(smfa)
		#shoot_fire_audio
	
	if using_weapon=="sniper":
		sniper_current_ammos-=1
		#camera_bullet
		var player_camera_bullet=preload("res://ai_handle_bullet.tscn")
		var sncb=player_camera_bullet.instantiate()
		sncb.position=$arm_handle_AI.global_position
		sncb.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		sncb.bullet_speed=sniper_bullet_speed
		sncb.player_master=self
		sncb.weapon_type="sniper"
		scene_root.add_child(sncb)
		#camera_bullet
		
		#bullet_trail
		var player_bullet_trail=preload("res://ai_bullet_trail.tscn")
		var pbt=player_bullet_trail.instantiate()
		pbt.position=$arm_handle_AI.global_position
		pbt.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		sncb.sub_objects.append(pbt)
		scene_root.add_child(pbt)
		#bullet_trail
		
		#shoot_bullet_mesh
		var sniper_bullet_mesh=preload("res://assets/player/prefab/sniper_ammo_3rd.tscn")
		var snbm=sniper_bullet_mesh.instantiate()
		snbm.position=sniper_model.shoot_point_node.global_position
		snbm.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		snbm.speed=sniper_bullet_speed
		sncb.sub_objects.append(snbm)
		snbm.trail=pbt
		scene_root.add_child(snbm)
		#shoot_bullet_mesh
		
		#shoot_point_fire_3rd
		var sniper_fire_3rd=preload("res://assets/particles/sniper_shoot_fire_ai.tscn")
		var snf_3rd=sniper_fire_3rd.instantiate()
		snf_3rd.position=sniper_model.shoot_point_node.global_position
		snf_3rd.rotation_degrees=sniper_model.shoot_point_node.global_rotation_degrees
		snf_3rd.pos=sniper_model.shoot_point_node.global_position
		snf_3rd.rot=sniper_model.shoot_point_node.global_rotation_degrees
		snf_3rd.shoot_point_pos=sniper_model.shoot_point_node
		scene_root.add_child(snf_3rd)
		#shoot_point_fire_3rd
		
		#shoot_fire_audio
		var sniper_fire_audio=preload("res://assets/audios/sniper_shoot_audio.tscn")
		var snfa=sniper_fire_audio.instantiate()
		snfa.position=sniper_model.shoot_point_node.global_position
		snfa.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		scene_root.add_child(snfa)
		#shoot_fire_audio
		
	if using_weapon=="shotgun":
		shotgun_current_ammos-=1
		#camera_bullet
		var player_camera_bullet=preload("res://ai_handle_bullet.tscn")
		var shcb=player_camera_bullet.instantiate()
		shcb.position=$arm_handle_AI.global_position
		shcb.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		shcb.bullet_speed=shotgun_bullet_speed
		shcb.player_master=self
		shcb.weapon_type="shotgun"
		scene_root.add_child(shcb)
		#camera_bullet
		
		#bullet_trail
		var player_bullet_trail=preload("res://ai_bullet_trail.tscn")
		var pbt=player_bullet_trail.instantiate()
		pbt.position=$arm_handle_AI.global_position
		pbt.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		shcb.sub_objects.append(pbt)
		scene_root.add_child(pbt)
		#bullet_trail
		
		#shoot_bullet_mesh
		var shotgun_bullet_mesh=preload("res://assets/player/prefab/shotgun_ammos_3rd.tscn")
		var shbm=shotgun_bullet_mesh.instantiate()
		shbm.position=shotgun_model.shoot_point_node.global_position
		shbm.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		shbm.speed=shotgun_bullet_speed
		shcb.sub_objects.append(shbm)
		shbm.trail=pbt
		scene_root.add_child(shbm)
		#shoot_bullet_mesh
		
		#shoot_point_fire_3rd
		var shotgun_fire_3rd=preload("res://assets/particles/shotgun_shoot_fire_ai.tscn")
		var shf_3rd=shotgun_fire_3rd.instantiate()
		shf_3rd.position=shotgun_model.shoot_point_node.global_position
		shf_3rd.rotation_degrees=shotgun_model.shoot_point_node.global_rotation_degrees
		shf_3rd.pos=shotgun_model.shoot_point_node.global_position
		shf_3rd.rot=shotgun_model.shoot_point_node.global_rotation_degrees
		shf_3rd.shoot_point_pos=shotgun_model.shoot_point_node
		scene_root.add_child(shf_3rd)
		#shoot_point_fire_3rd
		
		#shoot_fire_audio
		var shotgun_fire_audio=preload("res://assets/audios/shotgun_shoot_audio.tscn")
		var shfa=shotgun_fire_audio.instantiate()
		shfa.position=shotgun_model.shoot_point_node.global_position
		shfa.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		scene_root.add_child(shfa)
		#shoot_fire_audio
		
	if using_weapon=="machine_gun":
		machine_gun_current_ammos-=1
		#camera_bullet
		var player_camera_bullet=preload("res://ai_handle_bullet.tscn")
		var mgcb=player_camera_bullet.instantiate()
		mgcb.position=$arm_handle_AI.global_position
		mgcb.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		mgcb.bullet_speed=machine_gun_bullet_speed
		mgcb.player_master=self
		mgcb.weapon_type="machine_gun"
		scene_root.add_child(mgcb)
		#camera_bullet
		
		#bullet_trail
		var player_bullet_trail=preload("res://ai_bullet_trail.tscn")
		var pbt=player_bullet_trail.instantiate()
		pbt.position=$arm_handle_AI.global_position
		pbt.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		mgcb.sub_objects.append(pbt)
		scene_root.add_child(pbt)
		#bullet_trail
		
		#shoot_bullet_mesh
		var machine_gun_bullet_mesh=preload("res://assets/player/prefab/machine_gun_ammo_3rd.tscn")
		var mgbm=machine_gun_bullet_mesh.instantiate()
		mgbm.position=machine_gun_model.shoot_point_node.global_position
		mgbm.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		mgbm.speed=machine_gun_bullet_speed
		mgcb.sub_objects.append(mgbm)
		mgbm.trail=pbt
		scene_root.add_child(mgbm)
		#shoot_bullet_mesh
		
		#shoot_point_fire_3rd
		var machine_gun_fire_3rd=preload("res://assets/particles/machine_gun_shoot_fire_ai.tscn")
		var mgf_3rd=machine_gun_fire_3rd.instantiate()
		mgf_3rd.position=machine_gun_model.shoot_point_node.global_position
		mgf_3rd.rotation_degrees=machine_gun_model.shoot_point_node.global_rotation_degrees
		mgf_3rd.pos=machine_gun_model.shoot_point_node.global_position
		mgf_3rd.rot=machine_gun_model.shoot_point_node.global_rotation_degrees
		mgf_3rd.shoot_point_pos=machine_gun_model.shoot_point_node
		scene_root.add_child(mgf_3rd)
		#shoot_point_fire_3rd
		
		#shoot_fire_audio
		var machine_gun_fire_audio=preload("res://assets/audios/machine_gun_shoot_audio.tscn")
		var mgfa=machine_gun_fire_audio.instantiate()
		mgfa.position=machine_gun_model.shoot_point_node.global_position
		mgfa.rotation_degrees=$arm_handle_AI.global_rotation_degrees
		scene_root.add_child(mgfa)
		#shoot_fire_audio



func gun_handle_set_anim_event():
	if using_weapon=="sniper":
		hand_state_anim.travel("sniper_reloading_2")
	if using_weapon=="shotgun":
		hand_state_anim.travel("shotgun_reloading_2")

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
			
func bullet_hit_water_event(bullet_pos):
	var wave_scene=preload("res://assets/scenes/snow_basin/water/water_wave_instance.tscn")
	var ws=wave_scene.instantiate()
	ws.position=bullet_pos
	scene_root.add_child(ws)
	
	var wave_audio=preload("res://assets/scenes/snow_basin/audio/splash(water-splashes)/splash_audio.tscn")
	var wa=wave_audio.instantiate()
	ws.position=bullet_pos
	scene_root.add_child(wa)

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

func player_3rd_hit_blood_event(bullet_pos,weapon):
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

func hit_from_enemy_bullet_anim_event():
	pass
var murderer=null
func hit_loss_health_event(weapon_damage):
	player_health-=weapon_damage
	pass
func get_first_blood_event():
	pass

#"easy" "medium" "hard"
var bot_diffoculty=""
func player_difficulty_control():
	bot_diffoculty=Main_Menu_Global.setting_difficulty
	if bot_diffoculty=="easy":
		reaction_time=1
		animation_tree_node["parameters/TimeScale/scale"]=animation_tree_node["parameters/TimeScale/scale"]/2.5
		animation_tree_node["parameters/TimeScale 10/scale"]=animation_tree_node["parameters/TimeScale 10/scale"]/2.5
		animation_tree_node["parameters/TimeScale 11/scale"]=animation_tree_node["parameters/TimeScale 11/scale"]/2.5
		animation_tree_node["parameters/TimeScale 12/scale"]=animation_tree_node["parameters/TimeScale 12/scale"]/2.5
		animation_tree_node["parameters/TimeScale 2/scale"]=animation_tree_node["parameters/TimeScale 2/scale"]/2.5
		animation_tree_node["parameters/TimeScale 3/scale"]=animation_tree_node["parameters/TimeScale 3/scale"]/2.5
		animation_tree_node["parameters/TimeScale 4/scale"]=animation_tree_node["parameters/TimeScale 4/scale"]/2.5
		animation_tree_node["parameters/TimeScale 5/scale"]=animation_tree_node["parameters/TimeScale 5/scale"]/2.5
		animation_tree_node["parameters/TimeScale 6/scale"]=animation_tree_node["parameters/TimeScale 6/scale"]/2.5
		animation_tree_node["parameters/TimeScale 7/scale"]=animation_tree_node["parameters/TimeScale 7/scale"]/2.5
		animation_tree_node["parameters/TimeScale 8/scale"]=animation_tree_node["parameters/TimeScale 8/scale"]/2.5
		animation_tree_node["parameters/TimeScale 9/scale"]=animation_tree_node["parameters/TimeScale 9/scale"]/2.5
		
	if bot_diffoculty=="medium":
		reaction_time=0.5
		animation_tree_node["parameters/TimeScale/scale"]=animation_tree_node["parameters/TimeScale/scale"]/1.5
		animation_tree_node["parameters/TimeScale 10/scale"]=animation_tree_node["parameters/TimeScale 10/scale"]/1.5
		animation_tree_node["parameters/TimeScale 11/scale"]=animation_tree_node["parameters/TimeScale 11/scale"]/1.5
		animation_tree_node["parameters/TimeScale 12/scale"]=animation_tree_node["parameters/TimeScale 12/scale"]/1.5
		animation_tree_node["parameters/TimeScale 2/scale"]=animation_tree_node["parameters/TimeScale 2/scale"]/1.5
		animation_tree_node["parameters/TimeScale 3/scale"]=animation_tree_node["parameters/TimeScale 3/scale"]/1.5
		animation_tree_node["parameters/TimeScale 4/scale"]=animation_tree_node["parameters/TimeScale 4/scale"]/1.5
		animation_tree_node["parameters/TimeScale 5/scale"]=animation_tree_node["parameters/TimeScale 5/scale"]/1.5
		animation_tree_node["parameters/TimeScale 6/scale"]=animation_tree_node["parameters/TimeScale 6/scale"]/1.5
		animation_tree_node["parameters/TimeScale 7/scale"]=animation_tree_node["parameters/TimeScale 7/scale"]/1.5
		animation_tree_node["parameters/TimeScale 8/scale"]=animation_tree_node["parameters/TimeScale 8/scale"]/1.5
		animation_tree_node["parameters/TimeScale 9/scale"]=animation_tree_node["parameters/TimeScale 9/scale"]/1.5
		
	if bot_diffoculty=="hard":
		reaction_time=0.1
		animation_tree_node["parameters/TimeScale/scale"]=animation_tree_node["parameters/TimeScale/scale"]/1.2
		animation_tree_node["parameters/TimeScale 10/scale"]=animation_tree_node["parameters/TimeScale 10/scale"]/1.2
		animation_tree_node["parameters/TimeScale 11/scale"]=animation_tree_node["parameters/TimeScale 11/scale"]/1.2
		animation_tree_node["parameters/TimeScale 12/scale"]=animation_tree_node["parameters/TimeScale 12/scale"]/1.2
		animation_tree_node["parameters/TimeScale 2/scale"]=animation_tree_node["parameters/TimeScale 2/scale"]/1.2
		animation_tree_node["parameters/TimeScale 3/scale"]=animation_tree_node["parameters/TimeScale 3/scale"]/1.2
		animation_tree_node["parameters/TimeScale 4/scale"]=animation_tree_node["parameters/TimeScale 4/scale"]/1.2
		animation_tree_node["parameters/TimeScale 5/scale"]=animation_tree_node["parameters/TimeScale 5/scale"]/1.2
		animation_tree_node["parameters/TimeScale 6/scale"]=animation_tree_node["parameters/TimeScale 6/scale"]/1.2
		animation_tree_node["parameters/TimeScale 7/scale"]=animation_tree_node["parameters/TimeScale 7/scale"]/1.2
		animation_tree_node["parameters/TimeScale 8/scale"]=animation_tree_node["parameters/TimeScale 8/scale"]/1.2
		animation_tree_node["parameters/TimeScale 9/scale"]=animation_tree_node["parameters/TimeScale 9/scale"]/1.2
		
var player_kill_score_FFA=0
func FFA_game_over_kill():
	#print(player_kill_score_FFA)
	if player_kill_score_FFA>=Main_Menu_Global.setting_max_kills_i:
		scene_root.kill_score_control(self)

var blinding_state=false#烟雾致盲
var blinding_state_timer=10
var dazzle_state=false#闪光致盲
var dazzle_state_timer=5
#reaction_time
#var rifle_distance_range=[30,50]
#var pistol_distance_range=[30,50]
#var smg_distance_range=[30,50]
#var sniper_distance_range=[30,65]
#var shotgun_distance_range=[20,40]
#var machine_gun_distance_range=[30,50]
#var using_weapon_distance_range=[0,0]

func player_blinding():
	if blinding_state:
		if bot_diffoculty=="easy":
			reaction_time=2
		if bot_diffoculty=="medium":
			reaction_time=1
		if bot_diffoculty=="hard":
			reaction_time=0.2
			
		rifle_distance_range[1]=100
		pistol_distance_range[1]=100
		smg_distance_range[1]=100
		sniper_distance_range[1]=130
		shotgun_distance_range[1]=80
		machine_gun_distance_range[1]=100
		
		blinding_state_timer-=get_physics_process_delta_time()
		if blinding_state_timer<0:
			blinding_state=false
			blinding_state_timer=10
	else:
		rifle_distance_range[1]=50
		pistol_distance_range[1]=50
		smg_distance_range[1]=50
		sniper_distance_range[1]=65
		shotgun_distance_range[1]=40
		machine_gun_distance_range[1]=50
		
		if bot_diffoculty=="easy":
			reaction_time=1
		if bot_diffoculty=="medium":
			reaction_time=0.5
		if bot_diffoculty=="hard":
			reaction_time=0.1
func smoke_my_eyes():
	blinding_state=true

func player_dazzle():
	if dazzle_state:
		dazzle_state_timer-=get_physics_process_delta_time()
		if dazzle_state_timer<0:
			dazzle_state=false
			dazzle_state_timer=5
	
func flash_my_eyes():
	dazzle_state=true

var throw_timer=30
var throw_random_list=[2,1,0,0,1,2,0,1,2]
var can_throw=false

var player_grenade_nums_fire=4
var player_grenade_nums_smoke=4
var player_grenade_nums_flash=4
var using_grenade="fire"
var using_grenade_nums=0
func player_grenade_attack():
	throw_timer-=get_physics_process_delta_time()
	if throw_timer<0:
		can_throw=true
	else:
		can_throw=false
	if enemy_main!=null:
		if enemy_main.global_position.distance_to(self.global_position)>15&&enemy_main.global_position.distance_to(self.global_position)<50:
			if can_throw:
				if throw_random_list.pick_random()==0:
					if player_grenade_nums_fire>0:
						hand_state_anim.travel("grenade_throw")
						using_grenade="fire"
						player_grenade_nums_fire-=1
						throw_timer=30
				if throw_random_list.pick_random()==1:
					if player_grenade_nums_smoke>0:
						hand_state_anim.travel("grenade_throw")
						using_grenade="smoke"
						player_grenade_nums_smoke-=1
						throw_timer=30
				if throw_random_list.pick_random()==2:
					if player_grenade_nums_flash>0:
						hand_state_anim.travel("grenade_throw")
						using_grenade="flash"
						player_grenade_nums_flash-=1
						throw_timer=30
				

var sword_action_id=[0,1]
func ai_sword_attack():
	if can_throw==false&&hand_state_anim.get_current_node()!=("grenade_throw"):
		if sword_trigger.has_overlapping_bodies():
			for st in sword_trigger.get_overlapping_bodies():
				if st!=self:
					if scene_root.mode=="free_for_all":
						if hand_state_anim.get_current_node()!="sword_attack":
							if sword_action_id.pick_random()==0:
								animation_tree_node["parameters/StateMachine/sword_attack/Transition/transition_request"]="sword_attack1"
							if sword_action_id.pick_random()==1:
								animation_tree_node["parameters/StateMachine/sword_attack/Transition/transition_request"]="sword_attack2"
							hand_state_anim.travel("sword_attack")
					if scene_root.mode=="team_death_match":
						if st.TDM_team!=TDM_team:
							if hand_state_anim.get_current_node()!="sword_attack":
								if sword_action_id.pick_random()==0:
									animation_tree_node["parameters/StateMachine/sword_attack/Transition/transition_request"]="sword_attack1"
								if sword_action_id.pick_random()==1:
									animation_tree_node["parameters/StateMachine/sword_attack/Transition/transition_request"]="sword_attack2"
								hand_state_anim.travel("sword_attack")
@onready var grenade_throw_pos_node=$Skeleton/Skeleton3D/spine_bone_pos/grenade_throw_pos
func ai_throw_grenade_anim_event():
	if player_die==false&&control_lock:
		var throw_force=20
		var grenade_rig=preload("res://assets/player/prefab/grenade_rig.tscn")
		var gr=grenade_rig.instantiate()
		gr.scene_root=scene_root
		gr.position=grenade_throw_pos_node.global_position
		gr.using_grenade=using_grenade
		gr.player_master=self
		if gr is RigidBody3D:
			gr.apply_impulse(grenade_throw_pos_node.global_transform.basis.z*throw_force)
			gr.rotation_degrees=grenade_throw_pos_node.global_rotation_degrees
		scene_root.add_child(gr)
func ai_grenade_throw_1st_anim_event2():
	if using_grenade=="fire":
		$Skeleton/Skeleton3D/right_hand/grenade_fire.visible=true
		$Skeleton/Skeleton3D/right_hand/grenade_smoke.visible=false
		$Skeleton/Skeleton3D/right_hand/grenade_flash.visible=false
	if using_grenade=="smoke":
		$Skeleton/Skeleton3D/right_hand/grenade_fire.visible=false
		$Skeleton/Skeleton3D/right_hand/grenade_smoke.visible=true
		$Skeleton/Skeleton3D/right_hand/grenade_flash.visible=false
	if using_grenade=="flash":
		$Skeleton/Skeleton3D/right_hand/grenade_fire.visible=false
		$Skeleton/Skeleton3D/right_hand/grenade_smoke.visible=false
		$Skeleton/Skeleton3D/right_hand/grenade_flash.visible=true

@onready var sword_trigger=$Skeleton/Skeleton3D/sword_attack_trigger
func ai_sword_attack_anim_event():
	var audio_id=[0,1,2]
	var a_id=audio_id.pick_random()
	if a_id==0:
		var sword_attack_audio=preload("res://assets/audios/sword_attack_audio.tscn")
		var saa=sword_attack_audio.instantiate()
		saa.get_children()[0].autoplay=true
		sword_trigger.add_child(saa)
	elif a_id==1:
		var sword_attack_audio=preload("res://assets/audios/sword_attack_audio.tscn")
		var saa=sword_attack_audio.instantiate()
		saa.get_children()[1].autoplay=true
		sword_trigger.add_child(saa)
	elif a_id==2:
		var sword_attack_audio=preload("res://assets/audios/sword_attack_audio.tscn")
		var saa=sword_attack_audio.instantiate()
		saa.get_children()[2].autoplay=true
		sword_trigger.add_child(saa)
func ai_sword_attack1_anim_event():
	if sword_trigger.has_overlapping_bodies():
		for st in sword_trigger.get_overlapping_bodies():
			if st!=self:
				if scene_root.mode=="team_death_match":
					if st.TDM_team!=TDM_team:
						st.hit_loss_health_event(100)
						st.murderer=self
						var sword_kill_audio=preload("res://assets/audios/sword_kill_enemy_audio.tscn")
						var ska=sword_kill_audio.instantiate()
						ska.position=sword_trigger.global_position
						scene_root.add_child(ska)
				if scene_root.mode=="free_for_all":
					st.hit_loss_health_event(100)
					st.murderer=self
					var sword_kill_audio=preload("res://assets/audios/sword_kill_enemy_audio.tscn")
					var ska=sword_kill_audio.instantiate()
					ska.position=sword_trigger.global_position
					scene_root.add_child(ska)
