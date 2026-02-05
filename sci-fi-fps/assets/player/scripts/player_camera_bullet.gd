extends RayCast3D
var bullet_speed:float=0
var sub_objects:Array[Node]=[]
var player_master:Node=null
var weapon_type:String=""


@onready var ray1:Node=$shotgun_all_ray/RayCast3D
@onready var ray2:Node=$shotgun_all_ray/RayCast3D2
@onready var ray3:Node=$shotgun_all_ray/RayCast3D3
@onready var ray4:Node=$shotgun_all_ray/RayCast3D4
@onready var ray5:Node=$shotgun_all_ray/RayCast3D5
@onready var ray6:Node=$shotgun_all_ray/RayCast3D6
@onready var ray7:Node=$shotgun_all_ray/RayCast3D7
@onready var ray8:Node=$shotgun_all_ray/RayCast3D8
@onready var ray9:Node=$shotgun_all_ray/RayCast3D9
var rays:Array[Node]=[]
func _ready() -> void:
	rays.append(self)
	rays.append($shotgun_all_ray/RayCast3D)
	rays.append($shotgun_all_ray/RayCast3D2)
	rays.append($shotgun_all_ray/RayCast3D3)
	rays.append($shotgun_all_ray/RayCast3D4)
	rays.append($shotgun_all_ray/RayCast3D5)
	rays.append($shotgun_all_ray/RayCast3D6)
	rays.append($shotgun_all_ray/RayCast3D7)
	rays.append($shotgun_all_ray/RayCast3D8)
	rays.append($shotgun_all_ray/RayCast3D9)
	for r in range(rays.size()):
		if rays[r] is RayCast3D:
			rays[r].add_exception(player_master.hip_bone_pos_node)
			rays[r].add_exception(player_master.spine_bone_pos_node)
			rays[r].add_exception(player_master.leg1_l_bone_pos_node)
			rays[r].add_exception(player_master.leg2_l_bone_pos_node)
			rays[r].add_exception(player_master.foot_l_bone_pos_node)
			rays[r].add_exception(player_master.leg1_r_bone_pos_node)
			rays[r].add_exception(player_master.leg2_r_bone_pos_node)
			rays[r].add_exception(player_master.foot_r_bone_pos_node)
			rays[r].add_exception(player_master.head_bone_pos_node)
			rays[r].add_exception(player_master.shouder_l_bone_pos_node)
			rays[r].add_exception(player_master.arm_l_bone_pos_node)
			rays[r].add_exception(player_master.hand_l_bone_pos_node)
			rays[r].add_exception(player_master.shouder_r_bone_pos_node)
			rays[r].add_exception(player_master.arm_r_bone_pos_node)
			rays[r].add_exception(player_master.hand_r_bone_pos_node)
func _physics_process(delta: float) -> void:
	if player_master!=null:
		bullet_main_func(weapon_type)
var rifle_shoot_player_distance:float=10
var pistol_shoot_player_distance:float=10
var smg_shoot_player_distance:float=10
var sniper_shoot_player_distance:float=20
var shotgun_shoot_player_distance:float=10
var machine_gun_shoot_player_distance:float=10



var rifle_damage:Array[Array]=[[21,33,44,57]#"hip"
,[23,35,45]# "spine"
,[6,8,12,18,20]#"leg1_L"
,[6,8,12,18,20]#"leg2_L"
,[3,7,11,15]#"foot_L"
,[6,8,12,18,20]#"leg1_R"
,[6,8,12,18,20]#"leg2_R"
,[3,7,11,15]#"foot_R"
,[64,72,85,51,90]#"head"
,[21,33,44,57]#"shouder_L"
,[6,8,12,18,20]#"arm_L"
,[3,7,11,15]#"hand_L"
,[21,33,44,57]#"shouder_R"
,[6,8,12,18,20]#"arm_R"
,[3,7,11,15]]#"hand_R"

var pistol_damage:Array[Array]=[[21,33,44,57]#"hip"
,[23,35,45]# "spine"
,[6,8,12,18,20]#"leg1_L"
,[6,8,12,18,20]#"leg2_L"
,[3,7,11,15]#"foot_L"
,[6,8,12,18,20]#"leg1_R"
,[6,8,12,18,20]#"leg2_R"
,[3,7,11,15]#"foot_R"
,[64,72,85,51,90]#"head"
,[21,33,44,57]#"shouder_L"
,[6,8,12,18,20]#"arm_L"
,[3,7,11,15]#"hand_L"
,[21,33,44,57]#"shouder_R"
,[6,8,12,18,20]#"arm_R"
,[3,7,11,15]]#"hand_R"

var smg_damage:Array[Array]=[[8,15,27,35]#"hip"
,[9,14,27]# "spine"
,[5,8,12,18,20]#"leg1_L"
,[5,8,11,18,20]#"leg2_L"
,[3,7,11,15]#"foot_L"
,[5,8,12,18,20]#"leg1_R"
,[5,8,12,18,20]#"leg2_R"
,[3,7,11,15]#"foot_R"
,[40,50,60,54,68]#"head"
,[10,16,24,35]#"shouder_L"
,[6,8,12,18,20]#"arm_L"
,[3,7,11,15]#"hand_L"
,[10,16,24,35]#"shouder_R"
,[6,8,12,18,20]#"arm_R"
,[3,7,11,15]]#"hand_R"

var sniper_damage:Array[Array]=[[40,50,60,70]#"hip"
,[90,100,74]# "spine"
,[20,30,40,50,60]#"leg1_L"
,[20,30,40,50,60]#"leg2_L"
,[15,35,40,50]#"foot_L"
,[20,30,40,50,60]#"leg1_R"
,[20,30,40,50,60]#"leg2_R"
,[15,35,40,50]#"foot_R"
,[100]#"head"
,[21,33,44,57]#"shouder_L"
,[20,30,40,50,60]#"arm_L"
,[23,47,31,55]#"hand_L"
,[21,33,44,57]#"shouder_R"
,[20,30,40,50,60]#"arm_R"
,[23,47,31,55]]#"hand_R"

var shotgun_damage:Array[Array]=[[21,33,44,57]#"hip"
,[23,35,45]# "spine"
,[6,8,12,18,20]#"leg1_L"
,[6,8,12,18,20]#"leg2_L"
,[3,7,11,15]#"foot_L"
,[6,8,12,18,20]#"leg1_R"
,[6,8,12,18,20]#"leg2_R"
,[3,7,11,15]#"foot_R"
,[64,72,85,51,90]#"head"
,[21,33,44,57]#"shouder_L"
,[6,8,12,18,20]#"arm_L"
,[3,7,11,15]#"hand_L"
,[21,33,44,57]#"shouder_R"
,[6,8,12,18,20]#"arm_R"
,[3,7,11,15]]#"hand_R"

var machine_gun_damage:Array[Array]=[[21,33,44,57]#"hip"
,[23,35,45]# "spine"
,[6,8,12,18,20]#"leg1_L"
,[6,8,12,18,20]#"leg2_L"
,[3,7,11,15]#"foot_L"
,[6,8,12,18,20]#"leg1_R"
,[6,8,12,18,20]#"leg2_R"
,[3,7,11,15]#"foot_R"
,[64,72,85/2,51,90]#"head"
,[21,33,44,57]#"shouder_L"
,[6,8,12,18,20]#"arm_L"
,[3,7,11,15]#"hand_L"
,[21,33,44,57]#"shouder_R"
,[6,8,12,18,20]#"arm_R"
,[3,7,11,15]]#"hand_R"
func bullet_main_func(weapon_type):
	if weapon_type=="rifle":
		if self.is_colliding():
			if self.get_collider().get_collision_layer()==256:
				player_master.bullet_hit_water_event(get_collision_point())
				self.queue_free()
		if player_master!=null:
			self.add_exception(player_master)
		target_position.z+=bullet_speed*get_physics_process_delta_time()
		if self.is_colliding():
			if self.get_collider().get_collision_layer()!=8:
				if self.get_collider().get_collision_layer()==32:
					if self.get_collider() is Area3D:
						if self.get_collision_point().distance_to(to_global(self.target_position))<=rifle_shoot_player_distance:
							
							
							if player_master.scene_root.mode=="free_for_all":
								player_master.bullet_exp_event(get_collision_point(),false)
								player_master.player_3rd_hit_blood_event(get_collision_point(),"rifle")
								if self.get_collider().body_pos=="hip":
									self.get_collider().hurt_event(rifle_damage[0].pick_random(),player_master)
								if self.get_collider().body_pos=="spine":
									self.get_collider().hurt_event(rifle_damage[1].pick_random(),player_master)
								if self.get_collider().body_pos=="leg1_L":
									self.get_collider().hurt_event(rifle_damage[2].pick_random(),player_master)
								if self.get_collider().body_pos=="leg2_L":
									self.get_collider().hurt_event(rifle_damage[3].pick_random(),player_master)
								if self.get_collider().body_pos=="foot_L":
									self.get_collider().hurt_event(rifle_damage[4].pick_random(),player_master)
								if self.get_collider().body_pos=="leg1_R":
									self.get_collider().hurt_event(rifle_damage[5].pick_random(),player_master)
								if self.get_collider().body_pos=="leg2_R":
									self.get_collider().hurt_event(rifle_damage[6].pick_random(),player_master)
								if self.get_collider().body_pos=="foot_R":
									self.get_collider().hurt_event(rifle_damage[7].pick_random(),player_master)
								if self.get_collider().body_pos=="head":
									self.get_collider().hurt_event(rifle_damage[8].pick_random(),player_master)
								if self.get_collider().body_pos=="shouder_L":
									self.get_collider().hurt_event(rifle_damage[9].pick_random(),player_master)
								if self.get_collider().body_pos=="arm_L":
									self.get_collider().hurt_event(rifle_damage[10].pick_random(),player_master)
								if self.get_collider().body_pos=="hand_L":
									self.get_collider().hurt_event(rifle_damage[11].pick_random(),player_master)
								if self.get_collider().body_pos=="shouder_R":
									self.get_collider().hurt_event(rifle_damage[12].pick_random(),player_master)
								if self.get_collider().body_pos=="arm_R":
									self.get_collider().hurt_event(rifle_damage[13].pick_random(),player_master)
								if self.get_collider().body_pos=="hand_R":
									self.get_collider().hurt_event(rifle_damage[14].pick_random(),player_master)
								self.queue_free()
								for i in range(sub_objects.size()):
									sub_objects[i].queue_free()
							if player_master.scene_root.mode=="team_death_match":
								if player_master.TDM_team!=self.get_collider().player_master.TDM_team:
									player_master.bullet_exp_event(get_collision_point(),false)
									player_master.player_3rd_hit_blood_event(get_collision_point(),"rifle")
									if self.get_collider().body_pos=="hip":
										self.get_collider().hurt_event(rifle_damage[0].pick_random(),player_master)
									if self.get_collider().body_pos=="spine":
										self.get_collider().hurt_event(rifle_damage[1].pick_random(),player_master)
									if self.get_collider().body_pos=="leg1_L":
										self.get_collider().hurt_event(rifle_damage[2].pick_random(),player_master)
									if self.get_collider().body_pos=="leg2_L":
										self.get_collider().hurt_event(rifle_damage[3].pick_random(),player_master)
									if self.get_collider().body_pos=="foot_L":
										self.get_collider().hurt_event(rifle_damage[4].pick_random(),player_master)
									if self.get_collider().body_pos=="leg1_R":
										self.get_collider().hurt_event(rifle_damage[5].pick_random(),player_master)
									if self.get_collider().body_pos=="leg2_R":
										self.get_collider().hurt_event(rifle_damage[6].pick_random(),player_master)
									if self.get_collider().body_pos=="foot_R":
										self.get_collider().hurt_event(rifle_damage[7].pick_random(),player_master)
									if self.get_collider().body_pos=="head":
										self.get_collider().hurt_event(rifle_damage[8].pick_random(),player_master)
									if self.get_collider().body_pos=="shouder_L":
										self.get_collider().hurt_event(rifle_damage[9].pick_random(),player_master)
									if self.get_collider().body_pos=="arm_L":
										self.get_collider().hurt_event(rifle_damage[10].pick_random(),player_master)
									if self.get_collider().body_pos=="hand_L":
										self.get_collider().hurt_event(rifle_damage[11].pick_random(),player_master)
									if self.get_collider().body_pos=="shouder_R":
										self.get_collider().hurt_event(rifle_damage[12].pick_random(),player_master)
									if self.get_collider().body_pos=="arm_R":
										self.get_collider().hurt_event(rifle_damage[13].pick_random(),player_master)
									if self.get_collider().body_pos=="hand_R":
										self.get_collider().hurt_event(rifle_damage[14].pick_random(),player_master)
									self.queue_free()
									for i in range(sub_objects.size()):
										sub_objects[i].queue_free()
								else:
									self.add_exception(self.get_collider())
									
						else:
							self.add_exception(self.get_collider())
				elif self.get_collider().get_collision_layer()==1:
					player_master.bullet_exp_event(get_collision_point(),false)
					self.queue_free()
					for i in range(sub_objects.size()):
						sub_objects[i].queue_free()
			else:
				player_master.bullet_exp_event(get_collision_point(),true)
				self.queue_free()
				for i in range(sub_objects.size()):
					sub_objects[i].queue_free()
				
			
				
				
	if weapon_type=="pistol":
		if self.is_colliding():
			if self.get_collider().get_collision_layer()==256:
				player_master.bullet_hit_water_event(get_collision_point())
				self.queue_free()
		if player_master!=null:
			self.add_exception(player_master)
		target_position.z+=bullet_speed*get_physics_process_delta_time()
		if self.is_colliding():
			
			if self.get_collider().get_collision_layer()!=8:
				if self.get_collider().get_collision_layer()==32:
					if self.get_collider() is Area3D:
						if self.get_collision_point().distance_to(to_global(self.target_position))<=pistol_shoot_player_distance:
							
							if player_master.scene_root.mode=="free_for_all":
								player_master.player_3rd_hit_blood_event(get_collision_point(),"pistol")
								player_master.bullet_exp_event(get_collision_point(),false)
								if self.get_collider().body_pos=="hip":
									self.get_collider().hurt_event(pistol_damage[0].pick_random(),player_master)
								if self.get_collider().body_pos=="spine":
									self.get_collider().hurt_event(pistol_damage[1].pick_random(),player_master)
								if self.get_collider().body_pos=="leg1_L":
									self.get_collider().hurt_event(pistol_damage[2].pick_random(),player_master)
								if self.get_collider().body_pos=="leg2_L":
									self.get_collider().hurt_event(pistol_damage[3].pick_random(),player_master)
								if self.get_collider().body_pos=="foot_L":
									self.get_collider().hurt_event(pistol_damage[4].pick_random(),player_master)
								if self.get_collider().body_pos=="leg1_R":
									self.get_collider().hurt_event(pistol_damage[5].pick_random(),player_master)
								if self.get_collider().body_pos=="leg2_R":
									self.get_collider().hurt_event(pistol_damage[6].pick_random(),player_master)
								if self.get_collider().body_pos=="foot_R":
									self.get_collider().hurt_event(pistol_damage[7].pick_random(),player_master)
								if self.get_collider().body_pos=="head":
									self.get_collider().hurt_event(pistol_damage[8].pick_random(),player_master)
								if self.get_collider().body_pos=="shouder_L":
									self.get_collider().hurt_event(pistol_damage[9].pick_random(),player_master)
								if self.get_collider().body_pos=="arm_L":
									self.get_collider().hurt_event(pistol_damage[10].pick_random(),player_master)
								if self.get_collider().body_pos=="hand_L":
									self.get_collider().hurt_event(pistol_damage[11].pick_random(),player_master)
								if self.get_collider().body_pos=="shouder_R":
									self.get_collider().hurt_event(pistol_damage[12].pick_random(),player_master)
								if self.get_collider().body_pos=="arm_R":
									self.get_collider().hurt_event(pistol_damage[13].pick_random(),player_master)
								if self.get_collider().body_pos=="hand_R":
									self.get_collider().hurt_event(pistol_damage[14].pick_random(),player_master)
							
								self.queue_free()
								for i in range(sub_objects.size()):
									sub_objects[i].queue_free()
							if player_master.scene_root.mode=="team_death_match":
								if player_master.TDM_team!=self.get_collider().player_master.TDM_team:
									player_master.player_3rd_hit_blood_event(get_collision_point(),"pistol")
									player_master.bullet_exp_event(get_collision_point(),false)
									if self.get_collider().body_pos=="hip":
										self.get_collider().hurt_event(pistol_damage[0].pick_random(),player_master)
									if self.get_collider().body_pos=="spine":
										self.get_collider().hurt_event(pistol_damage[1].pick_random(),player_master)
									if self.get_collider().body_pos=="leg1_L":
										self.get_collider().hurt_event(pistol_damage[2].pick_random(),player_master)
									if self.get_collider().body_pos=="leg2_L":
										self.get_collider().hurt_event(pistol_damage[3].pick_random(),player_master)
									if self.get_collider().body_pos=="foot_L":
										self.get_collider().hurt_event(pistol_damage[4].pick_random(),player_master)
									if self.get_collider().body_pos=="leg1_R":
										self.get_collider().hurt_event(pistol_damage[5].pick_random(),player_master)
									if self.get_collider().body_pos=="leg2_R":
										self.get_collider().hurt_event(pistol_damage[6].pick_random(),player_master)
									if self.get_collider().body_pos=="foot_R":
										self.get_collider().hurt_event(pistol_damage[7].pick_random(),player_master)
									if self.get_collider().body_pos=="head":
										self.get_collider().hurt_event(pistol_damage[8].pick_random(),player_master)
									if self.get_collider().body_pos=="shouder_L":
										self.get_collider().hurt_event(pistol_damage[9].pick_random(),player_master)
									if self.get_collider().body_pos=="arm_L":
										self.get_collider().hurt_event(pistol_damage[10].pick_random(),player_master)
									if self.get_collider().body_pos=="hand_L":
										self.get_collider().hurt_event(pistol_damage[11].pick_random(),player_master)
									if self.get_collider().body_pos=="shouder_R":
										self.get_collider().hurt_event(pistol_damage[12].pick_random(),player_master)
									if self.get_collider().body_pos=="arm_R":
										self.get_collider().hurt_event(pistol_damage[13].pick_random(),player_master)
									if self.get_collider().body_pos=="hand_R":
										self.get_collider().hurt_event(pistol_damage[14].pick_random(),player_master)
								
									self.queue_free()
									for i in range(sub_objects.size()):
										sub_objects[i].queue_free()
								else:
									self.add_exception(self.get_collider())
						else:
							self.add_exception(self.get_collider())
				elif self.get_collider().get_collision_layer()==1:
					player_master.bullet_exp_event(get_collision_point(),false)
					self.queue_free()
					for i in range(sub_objects.size()):
						sub_objects[i].queue_free()
			else:
				player_master.bullet_exp_event(get_collision_point(),true)
				self.queue_free()
				for i in range(sub_objects.size()):
					sub_objects[i].queue_free()
	if weapon_type=="smg":
		if self.is_colliding():
			if self.get_collider().get_collision_layer()==256:
				player_master.bullet_hit_water_event(get_collision_point())
				self.queue_free()
		if player_master!=null:
			self.add_exception(player_master)
		target_position.z+=bullet_speed*get_physics_process_delta_time()
		if self.is_colliding():
			
			if self.get_collider().get_collision_layer()!=8:
				if self.get_collider().get_collision_layer()==32:
					if self.get_collider() is Area3D:
						if self.get_collision_point().distance_to(to_global(self.target_position))<=smg_shoot_player_distance:
							
							if player_master.scene_root.mode=="free_for_all":
								player_master.player_3rd_hit_blood_event(get_collision_point(),"smg")
								player_master.bullet_exp_event(get_collision_point(),false)
								if self.get_collider().body_pos=="hip":
									self.get_collider().hurt_event(smg_damage[0].pick_random(),player_master)
								if self.get_collider().body_pos=="spine":
									self.get_collider().hurt_event(smg_damage[1].pick_random(),player_master)
								if self.get_collider().body_pos=="leg1_L":
									self.get_collider().hurt_event(smg_damage[2].pick_random(),player_master)
								if self.get_collider().body_pos=="leg2_L":
									self.get_collider().hurt_event(smg_damage[3].pick_random(),player_master)
								if self.get_collider().body_pos=="foot_L":
									self.get_collider().hurt_event(smg_damage[4].pick_random(),player_master)
								if self.get_collider().body_pos=="leg1_R":
									self.get_collider().hurt_event(smg_damage[5].pick_random(),player_master)
								if self.get_collider().body_pos=="leg2_R":
									self.get_collider().hurt_event(smg_damage[6].pick_random(),player_master)
								if self.get_collider().body_pos=="foot_R":
									self.get_collider().hurt_event(smg_damage[7].pick_random(),player_master)
								if self.get_collider().body_pos=="head":
									self.get_collider().hurt_event(smg_damage[8].pick_random(),player_master)
								if self.get_collider().body_pos=="shouder_L":
									self.get_collider().hurt_event(smg_damage[9].pick_random(),player_master)
								if self.get_collider().body_pos=="arm_L":
									self.get_collider().hurt_event(smg_damage[10].pick_random(),player_master)
								if self.get_collider().body_pos=="hand_L":
									self.get_collider().hurt_event(smg_damage[11].pick_random(),player_master)
								if self.get_collider().body_pos=="shouder_R":
									self.get_collider().hurt_event(smg_damage[12].pick_random(),player_master)
								if self.get_collider().body_pos=="arm_R":
									self.get_collider().hurt_event(smg_damage[13].pick_random(),player_master)
								if self.get_collider().body_pos=="hand_R":
									self.get_collider().hurt_event(smg_damage[14].pick_random(),player_master)
							
								self.queue_free()
								for i in range(sub_objects.size()):
									sub_objects[i].queue_free()
							
							if player_master.scene_root.mode=="team_death_match":
								if player_master.TDM_team!=self.get_collider().player_master.TDM_team:
									player_master.player_3rd_hit_blood_event(get_collision_point(),"smg")
									player_master.bullet_exp_event(get_collision_point(),false)
									if self.get_collider().body_pos=="hip":
										self.get_collider().hurt_event(smg_damage[0].pick_random(),player_master)
									if self.get_collider().body_pos=="spine":
										self.get_collider().hurt_event(smg_damage[1].pick_random(),player_master)
									if self.get_collider().body_pos=="leg1_L":
										self.get_collider().hurt_event(smg_damage[2].pick_random(),player_master)
									if self.get_collider().body_pos=="leg2_L":
										self.get_collider().hurt_event(smg_damage[3].pick_random(),player_master)
									if self.get_collider().body_pos=="foot_L":
										self.get_collider().hurt_event(smg_damage[4].pick_random(),player_master)
									if self.get_collider().body_pos=="leg1_R":
										self.get_collider().hurt_event(smg_damage[5].pick_random(),player_master)
									if self.get_collider().body_pos=="leg2_R":
										self.get_collider().hurt_event(smg_damage[6].pick_random(),player_master)
									if self.get_collider().body_pos=="foot_R":
										self.get_collider().hurt_event(smg_damage[7].pick_random(),player_master)
									if self.get_collider().body_pos=="head":
										self.get_collider().hurt_event(smg_damage[8].pick_random(),player_master)
									if self.get_collider().body_pos=="shouder_L":
										self.get_collider().hurt_event(smg_damage[9].pick_random(),player_master)
									if self.get_collider().body_pos=="arm_L":
										self.get_collider().hurt_event(smg_damage[10].pick_random(),player_master)
									if self.get_collider().body_pos=="hand_L":
										self.get_collider().hurt_event(smg_damage[11].pick_random(),player_master)
									if self.get_collider().body_pos=="shouder_R":
										self.get_collider().hurt_event(smg_damage[12].pick_random(),player_master)
									if self.get_collider().body_pos=="arm_R":
										self.get_collider().hurt_event(smg_damage[13].pick_random(),player_master)
									if self.get_collider().body_pos=="hand_R":
										self.get_collider().hurt_event(smg_damage[14].pick_random(),player_master)
								
									self.queue_free()
									for i in range(sub_objects.size()):
										sub_objects[i].queue_free()
								else:
									self.add_exception(self.get_collider())
						else:
							self.add_exception(self.get_collider())
				elif self.get_collider().get_collision_layer()==1:
					player_master.bullet_exp_event(get_collision_point(),false)
					self.queue_free()
					for i in range(sub_objects.size()):
						sub_objects[i].queue_free()
			else:
				player_master.bullet_exp_event(get_collision_point(),true)
				self.queue_free()
				for i in range(sub_objects.size()):
					sub_objects[i].queue_free()
	if weapon_type=="sniper":
		if self.is_colliding():
			if self.get_collider().get_collision_layer()==256:
				player_master.bullet_hit_water_event(get_collision_point())
				self.queue_free()
		if player_master!=null:
			self.add_exception(player_master)
		target_position.z+=bullet_speed*get_physics_process_delta_time()
		if self.is_colliding():
			if self.get_collider().get_collision_layer()!=8:
				if self.get_collider().get_collision_layer()==32:
					if self.get_collider() is Area3D:
						if self.get_collision_point().distance_to(to_global(self.target_position))<=sniper_shoot_player_distance:
							
							if player_master.scene_root.mode=="free_for_all":
								player_master.player_3rd_hit_blood_event(get_collision_point(),"sniper")
								player_master.bullet_exp_event(get_collision_point(),false)
								if self.get_collider().body_pos=="hip":
									self.get_collider().hurt_event(sniper_damage[0].pick_random(),player_master)
								if self.get_collider().body_pos=="spine":
									self.get_collider().hurt_event(sniper_damage[1].pick_random(),player_master)
								if self.get_collider().body_pos=="leg1_L":
									self.get_collider().hurt_event(sniper_damage[2].pick_random(),player_master)
								if self.get_collider().body_pos=="leg2_L":
									self.get_collider().hurt_event(sniper_damage[3].pick_random(),player_master)
								if self.get_collider().body_pos=="foot_L":
									self.get_collider().hurt_event(sniper_damage[4].pick_random(),player_master)
								if self.get_collider().body_pos=="leg1_R":
									self.get_collider().hurt_event(sniper_damage[5].pick_random(),player_master)
								if self.get_collider().body_pos=="leg2_R":
									self.get_collider().hurt_event(sniper_damage[6].pick_random(),player_master)
								if self.get_collider().body_pos=="foot_R":
									self.get_collider().hurt_event(sniper_damage[7].pick_random(),player_master)
								if self.get_collider().body_pos=="head":
									self.get_collider().hurt_event(sniper_damage[8].pick_random(),player_master)
								if self.get_collider().body_pos=="shouder_L":
									self.get_collider().hurt_event(sniper_damage[9].pick_random(),player_master)
								if self.get_collider().body_pos=="arm_L":
									self.get_collider().hurt_event(sniper_damage[10].pick_random(),player_master)
								if self.get_collider().body_pos=="hand_L":
									self.get_collider().hurt_event(sniper_damage[11].pick_random(),player_master)
								if self.get_collider().body_pos=="shouder_R":
									self.get_collider().hurt_event(sniper_damage[12].pick_random(),player_master)
								if self.get_collider().body_pos=="arm_R":
									self.get_collider().hurt_event(sniper_damage[13].pick_random(),player_master)
								if self.get_collider().body_pos=="hand_R":
									self.get_collider().hurt_event(sniper_damage[14].pick_random(),player_master)
							
								self.queue_free()
								for i in range(sub_objects.size()):
									sub_objects[i].queue_free()
									
							if player_master.scene_root.mode=="team_death_match":
								if player_master.TDM_team!=self.get_collider().player_master.TDM_team:
									player_master.player_3rd_hit_blood_event(get_collision_point(),"sniper")
									player_master.bullet_exp_event(get_collision_point(),false)
									if self.get_collider().body_pos=="hip":
										self.get_collider().hurt_event(sniper_damage[0].pick_random(),player_master)
									if self.get_collider().body_pos=="spine":
										self.get_collider().hurt_event(sniper_damage[1].pick_random(),player_master)
									if self.get_collider().body_pos=="leg1_L":
										self.get_collider().hurt_event(sniper_damage[2].pick_random(),player_master)
									if self.get_collider().body_pos=="leg2_L":
										self.get_collider().hurt_event(sniper_damage[3].pick_random(),player_master)
									if self.get_collider().body_pos=="foot_L":
										self.get_collider().hurt_event(sniper_damage[4].pick_random(),player_master)
									if self.get_collider().body_pos=="leg1_R":
										self.get_collider().hurt_event(sniper_damage[5].pick_random(),player_master)
									if self.get_collider().body_pos=="leg2_R":
										self.get_collider().hurt_event(sniper_damage[6].pick_random(),player_master)
									if self.get_collider().body_pos=="foot_R":
										self.get_collider().hurt_event(sniper_damage[7].pick_random(),player_master)
									if self.get_collider().body_pos=="head":
										self.get_collider().hurt_event(sniper_damage[8].pick_random(),player_master)
									if self.get_collider().body_pos=="shouder_L":
										self.get_collider().hurt_event(sniper_damage[9].pick_random(),player_master)
									if self.get_collider().body_pos=="arm_L":
										self.get_collider().hurt_event(sniper_damage[10].pick_random(),player_master)
									if self.get_collider().body_pos=="hand_L":
										self.get_collider().hurt_event(sniper_damage[11].pick_random(),player_master)
									if self.get_collider().body_pos=="shouder_R":
										self.get_collider().hurt_event(sniper_damage[12].pick_random(),player_master)
									if self.get_collider().body_pos=="arm_R":
										self.get_collider().hurt_event(sniper_damage[13].pick_random(),player_master)
									if self.get_collider().body_pos=="hand_R":
										self.get_collider().hurt_event(sniper_damage[14].pick_random(),player_master)
								
									self.queue_free()
									for i in range(sub_objects.size()):
										sub_objects[i].queue_free()
								else:
									self.add_exception(self.get_collider())
						else:
							self.add_exception(self.get_collider())
				elif self.get_collider().get_collision_layer()==1:
					player_master.bullet_exp_event(get_collision_point(),false)
					self.queue_free()
					for i in range(sub_objects.size()):
						sub_objects[i].queue_free()
			else:
				player_master.bullet_exp_event(get_collision_point(),true)
				self.queue_free()
				for i in range(sub_objects.size()):
					sub_objects[i].queue_free()
	
	if weapon_type=="shotgun":
		if player_master!=null:
			#self.add_exception(player_master)
			if ray1!=null:
				ray1.add_exception(player_master)
			if ray2!=null:
				ray2.add_exception(player_master)
			if ray3!=null:
				ray3.add_exception(player_master)
			if ray4!=null:
				ray4.add_exception(player_master)
			if ray5!=null:
				ray5.add_exception(player_master)
			if ray6!=null:
				ray6.add_exception(player_master)
			if ray7!=null:
				ray7.add_exception(player_master)
			if ray8!=null:
				ray8.add_exception(player_master)
			if ray9!=null:
				ray9.add_exception(player_master)
			
			
		if ray1!=null:
			if ray1.is_colliding():
				if ray1.get_collider().get_collision_layer()==256:
					player_master.bullet_hit_water_event(ray1.get_collision_point())
					ray1.queue_free()
			ray1.target_position.z+=bullet_speed*get_physics_process_delta_time()
			if ray1.is_colliding():
				if ray1.get_collider().get_collision_layer()!=8:
					if ray1.get_collider().get_collision_layer()==32:
						if ray1.get_collider() is Area3D:
							if ray1.get_collision_point().distance_to(to_global(ray1.target_position))<=shotgun_shoot_player_distance:
								
								if player_master.scene_root.mode=="free_for_all":
									player_master.player_3rd_hit_blood_event(ray1.get_collision_point(),"shotgun")
									player_master.bullet_exp_event(ray1.get_collision_point(),false)
									if ray1.get_collider().body_pos=="hip":
										ray1.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
									if ray1.get_collider().body_pos=="spine":
										ray1.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
									if ray1.get_collider().body_pos=="leg1_L":
										ray1.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
									if ray1.get_collider().body_pos=="leg2_L":
										ray1.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
									if ray1.get_collider().body_pos=="foot_L":
										ray1.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
									if ray1.get_collider().body_pos=="leg1_R":
										ray1.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
									if ray1.get_collider().body_pos=="leg2_R":
										ray1.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
									if ray1.get_collider().body_pos=="foot_R":
										ray1.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
									if ray1.get_collider().body_pos=="head":
										ray1.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
									if ray1.get_collider().body_pos=="shouder_L":
										ray1.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
									if ray1.get_collider().body_pos=="arm_L":
										ray1.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
									if ray1.get_collider().body_pos=="hand_L":
										ray1.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
									if ray1.get_collider().body_pos=="shouder_R":
										ray1.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
									if ray1.get_collider().body_pos=="arm_R":
										ray1.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
									if ray1.get_collider().body_pos=="hand_R":
										ray1.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
									ray1.queue_free()
								
								if player_master.scene_root.mode=="team_death_match":
									if player_master.TDM_team!=ray1.get_collider().player_master.TDM_team:
										player_master.player_3rd_hit_blood_event(ray1.get_collision_point(),"shotgun")
										player_master.bullet_exp_event(ray1.get_collision_point(),false)
										if ray1.get_collider().body_pos=="hip":
											ray1.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
										if ray1.get_collider().body_pos=="spine":
											ray1.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
										if ray1.get_collider().body_pos=="leg1_L":
											ray1.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
										if ray1.get_collider().body_pos=="leg2_L":
											ray1.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
										if ray1.get_collider().body_pos=="foot_L":
											ray1.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
										if ray1.get_collider().body_pos=="leg1_R":
											ray1.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
										if ray1.get_collider().body_pos=="leg2_R":
											ray1.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
										if ray1.get_collider().body_pos=="foot_R":
											ray1.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
										if ray1.get_collider().body_pos=="head":
											ray1.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
										if ray1.get_collider().body_pos=="shouder_L":
											ray1.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
										if ray1.get_collider().body_pos=="arm_L":
											ray1.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
										if ray1.get_collider().body_pos=="hand_L":
											ray1.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
										if ray1.get_collider().body_pos=="shouder_R":
											ray1.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
										if ray1.get_collider().body_pos=="arm_R":
											ray1.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
										if ray1.get_collider().body_pos=="hand_R":
											ray1.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
										ray1.queue_free()
									else:
										ray1.add_exception(ray1.get_collider())
							else:
								ray1.add_exception(ray1.get_collider())
					elif ray1.get_collider().get_collision_layer()==1:
						player_master.bullet_exp_event(ray1.get_collision_point(),false)
						ray1.queue_free()
				else:
					player_master.bullet_exp_event(ray1.get_collision_point(),true)
					ray1.queue_free()
		if ray2!=null:
			if ray2.is_colliding():
				if ray2.get_collider().get_collision_layer()==256:
					player_master.bullet_hit_water_event(ray2.get_collision_point())
					ray2.queue_free()
			ray2.target_position.z+=bullet_speed*get_physics_process_delta_time()
			if ray2.is_colliding():
				if ray2.get_collider().get_collision_layer()!=8:
					if ray2.get_collider().get_collision_layer()==32:
						if ray2.get_collider() is Area3D:
							if ray2.get_collision_point().distance_to(to_global(ray2.target_position))<=shotgun_shoot_player_distance:
								
								if player_master.scene_root.mode=="free_for_all":
									player_master.player_3rd_hit_blood_event(ray2.get_collision_point(),"shotgun")
									player_master.bullet_exp_event(ray2.get_collision_point(),false)
									if ray2.get_collider().body_pos=="hip":
										ray2.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
									if ray2.get_collider().body_pos=="spine":
										ray2.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
									if ray2.get_collider().body_pos=="leg1_L":
										ray2.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
									if ray2.get_collider().body_pos=="leg2_L":
										ray2.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
									if ray2.get_collider().body_pos=="foot_L":
										ray2.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
									if ray2.get_collider().body_pos=="leg1_R":
										ray2.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
									if ray2.get_collider().body_pos=="leg2_R":
										ray2.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
									if ray2.get_collider().body_pos=="foot_R":
										ray2.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
									if ray2.get_collider().body_pos=="head":
										ray2.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
									if ray2.get_collider().body_pos=="shouder_L":
										ray2.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
									if ray2.get_collider().body_pos=="arm_L":
										ray2.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
									if ray2.get_collider().body_pos=="hand_L":
										ray2.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
									if ray2.get_collider().body_pos=="shouder_R":
										ray2.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
									if ray2.get_collider().body_pos=="arm_R":
										ray2.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
									if ray2.get_collider().body_pos=="hand_R":
										ray2.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
									ray2.queue_free()
									
								if player_master.scene_root.mode=="team_death_match":
									if player_master.TDM_team!=ray2.get_collider().player_master.TDM_team:
										player_master.player_3rd_hit_blood_event(ray2.get_collision_point(),"shotgun")
										player_master.bullet_exp_event(ray2.get_collision_point(),false)
										if ray2.get_collider().body_pos=="hip":
											ray2.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
										if ray2.get_collider().body_pos=="spine":
											ray2.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
										if ray2.get_collider().body_pos=="leg1_L":
											ray2.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
										if ray2.get_collider().body_pos=="leg2_L":
											ray2.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
										if ray2.get_collider().body_pos=="foot_L":
											ray2.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
										if ray2.get_collider().body_pos=="leg1_R":
											ray2.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
										if ray2.get_collider().body_pos=="leg2_R":
											ray2.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
										if ray2.get_collider().body_pos=="foot_R":
											ray2.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
										if ray2.get_collider().body_pos=="head":
											ray2.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
										if ray2.get_collider().body_pos=="shouder_L":
											ray2.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
										if ray2.get_collider().body_pos=="arm_L":
											ray2.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
										if ray2.get_collider().body_pos=="hand_L":
											ray2.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
										if ray2.get_collider().body_pos=="shouder_R":
											ray2.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
										if ray2.get_collider().body_pos=="arm_R":
											ray2.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
										if ray2.get_collider().body_pos=="hand_R":
											ray2.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
										ray2.queue_free()
									else:
										ray2.add_exception(ray2.get_collider())
							else:
								ray2.add_exception(ray2.get_collider())
					elif ray2.get_collider().get_collision_layer()==1:
						player_master.bullet_exp_event(ray2.get_collision_point(),false)
						ray2.queue_free()
				else:
					player_master.bullet_exp_event(ray2.get_collision_point(),true)
					ray2.queue_free()
		if ray3!=null:
			if ray3.is_colliding():
				if ray3.get_collider().get_collision_layer()==256:
					player_master.bullet_hit_water_event(ray3.get_collision_point())
					ray3.queue_free()
			ray3.target_position.z+=bullet_speed*get_physics_process_delta_time()
			if ray3.is_colliding():
				if ray3.get_collider().get_collision_layer()!=8:
					if ray3.get_collider().get_collision_layer()==32:
						if ray3.get_collider() is Area3D:
							if ray3.get_collision_point().distance_to(to_global(ray3.target_position))<=shotgun_shoot_player_distance:
								
								if player_master.scene_root.mode=="free_for_all":
									player_master.player_3rd_hit_blood_event(ray3.get_collision_point(),"shotgun")
									player_master.bullet_exp_event(ray3.get_collision_point(),false)
									if ray3.get_collider().body_pos=="hip":
										ray3.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
									if ray3.get_collider().body_pos=="spine":
										ray3.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
									if ray3.get_collider().body_pos=="leg1_L":
										ray3.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
									if ray3.get_collider().body_pos=="leg2_L":
										ray3.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
									if ray3.get_collider().body_pos=="foot_L":
										ray3.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
									if ray3.get_collider().body_pos=="leg1_R":
										ray3.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
									if ray3.get_collider().body_pos=="leg2_R":
										ray3.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
									if ray3.get_collider().body_pos=="foot_R":
										ray3.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
									if ray3.get_collider().body_pos=="head":
										ray3.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
									if ray3.get_collider().body_pos=="shouder_L":
										ray3.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
									if ray3.get_collider().body_pos=="arm_L":
										ray3.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
									if ray3.get_collider().body_pos=="hand_L":
										ray3.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
									if ray3.get_collider().body_pos=="shouder_R":
										ray3.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
									if ray3.get_collider().body_pos=="arm_R":
										ray3.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
									if ray3.get_collider().body_pos=="hand_R":
										ray3.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
									ray3.queue_free()
									
								if player_master.scene_root.mode=="team_death_match":
									if player_master.TDM_team!=ray3.get_collider().player_master.TDM_team:
										player_master.player_3rd_hit_blood_event(ray3.get_collision_point(),"shotgun")
										player_master.bullet_exp_event(ray3.get_collision_point(),false)
										if ray3.get_collider().body_pos=="hip":
											ray3.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
										if ray3.get_collider().body_pos=="spine":
											ray3.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
										if ray3.get_collider().body_pos=="leg1_L":
											ray3.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
										if ray3.get_collider().body_pos=="leg2_L":
											ray3.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
										if ray3.get_collider().body_pos=="foot_L":
											ray3.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
										if ray3.get_collider().body_pos=="leg1_R":
											ray3.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
										if ray3.get_collider().body_pos=="leg2_R":
											ray3.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
										if ray3.get_collider().body_pos=="foot_R":
											ray3.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
										if ray3.get_collider().body_pos=="head":
											ray3.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
										if ray3.get_collider().body_pos=="shouder_L":
											ray3.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
										if ray3.get_collider().body_pos=="arm_L":
											ray3.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
										if ray3.get_collider().body_pos=="hand_L":
											ray3.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
										if ray3.get_collider().body_pos=="shouder_R":
											ray3.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
										if ray3.get_collider().body_pos=="arm_R":
											ray3.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
										if ray3.get_collider().body_pos=="hand_R":
											ray3.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
										ray3.queue_free()
									else:
										ray3.add_exception(ray3.get_collider())
							else:
								ray3.add_exception(ray3.get_collider())
					elif ray3.get_collider().get_collision_layer()==1:
						player_master.bullet_exp_event(ray3.get_collision_point(),false)
						ray3.queue_free()
				else:
					player_master.bullet_exp_event(ray3.get_collision_point(),true)
					ray3.queue_free()
		if ray4!=null:
			if ray4.is_colliding():
				if ray4.get_collider().get_collision_layer()==256:
					player_master.bullet_hit_water_event(ray4.get_collision_point())
					ray4.queue_free()
			ray4.target_position.z+=bullet_speed*get_physics_process_delta_time()
			if ray4.is_colliding():
				if ray4.get_collider().get_collision_layer()!=8:
					if ray4.get_collider().get_collision_layer()==32:
						if ray4.get_collider() is Area3D:
							if ray4.get_collision_point().distance_to(to_global(ray4.target_position))<=shotgun_shoot_player_distance:
								
								if player_master.scene_root.mode=="free_for_all":
									player_master.player_3rd_hit_blood_event(ray4.get_collision_point(),"shotgun")
									player_master.bullet_exp_event(ray4.get_collision_point(),false)
									if ray4.get_collider().body_pos=="hip":
										ray4.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
									if ray4.get_collider().body_pos=="spine":
										ray4.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
									if ray4.get_collider().body_pos=="leg1_L":
										ray4.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
									if ray4.get_collider().body_pos=="leg2_L":
										ray4.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
									if ray4.get_collider().body_pos=="foot_L":
										ray4.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
									if ray4.get_collider().body_pos=="leg1_R":
										ray4.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
									if ray4.get_collider().body_pos=="leg2_R":
										ray4.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
									if ray4.get_collider().body_pos=="foot_R":
										ray4.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
									if ray4.get_collider().body_pos=="head":
										ray4.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
									if ray4.get_collider().body_pos=="shouder_L":
										ray4.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
									if ray4.get_collider().body_pos=="arm_L":
										ray4.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
									if ray4.get_collider().body_pos=="hand_L":
										ray4.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
									if ray4.get_collider().body_pos=="shouder_R":
										ray4.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
									if ray4.get_collider().body_pos=="arm_R":
										ray4.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
									if ray4.get_collider().body_pos=="hand_R":
										ray4.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
									ray4.queue_free()
								
								if player_master.scene_root.mode=="team_death_match":
									if player_master.TDM_team!=ray4.get_collider().player_master.TDM_team:
										player_master.player_3rd_hit_blood_event(ray4.get_collision_point(),"shotgun")
										player_master.bullet_exp_event(ray4.get_collision_point(),false)
										if ray4.get_collider().body_pos=="hip":
											ray4.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
										if ray4.get_collider().body_pos=="spine":
											ray4.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
										if ray4.get_collider().body_pos=="leg1_L":
											ray4.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
										if ray4.get_collider().body_pos=="leg2_L":
											ray4.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
										if ray4.get_collider().body_pos=="foot_L":
											ray4.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
										if ray4.get_collider().body_pos=="leg1_R":
											ray4.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
										if ray4.get_collider().body_pos=="leg2_R":
											ray4.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
										if ray4.get_collider().body_pos=="foot_R":
											ray4.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
										if ray4.get_collider().body_pos=="head":
											ray4.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
										if ray4.get_collider().body_pos=="shouder_L":
											ray4.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
										if ray4.get_collider().body_pos=="arm_L":
											ray4.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
										if ray4.get_collider().body_pos=="hand_L":
											ray4.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
										if ray4.get_collider().body_pos=="shouder_R":
											ray4.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
										if ray4.get_collider().body_pos=="arm_R":
											ray4.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
										if ray4.get_collider().body_pos=="hand_R":
											ray4.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
										ray4.queue_free()
									else:
										ray4.add_exception(ray4.get_collider())
							else:
								ray4.add_exception(ray4.get_collider())
					elif ray4.get_collider().get_collision_layer()==1:
						player_master.bullet_exp_event(ray4.get_collision_point(),false)
						ray4.queue_free()
				else:
					player_master.bullet_exp_event(ray4.get_collision_point(),true)
					ray4.queue_free()
		if ray5!=null:
			if ray5.is_colliding():
				if ray5.get_collider().get_collision_layer()==256:
					player_master.bullet_hit_water_event(ray5.get_collision_point())
					ray5.queue_free()
			ray5.target_position.z+=bullet_speed*get_physics_process_delta_time()
			if ray5.is_colliding():
				if ray5.get_collider().get_collision_layer()!=8:
					if ray5.get_collider().get_collision_layer()==32:
						if ray5.get_collider() is Area3D:
							if ray5.get_collision_point().distance_to(to_global(ray5.target_position))<=shotgun_shoot_player_distance:
								
								if player_master.scene_root.mode=="free_for_all":
									player_master.player_3rd_hit_blood_event(ray5.get_collision_point(),"shotgun")
									player_master.bullet_exp_event(ray5.get_collision_point(),false)
									if ray5.get_collider().body_pos=="hip":
										ray5.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
									if ray5.get_collider().body_pos=="spine":
										ray5.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
									if ray5.get_collider().body_pos=="leg1_L":
										ray5.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
									if ray5.get_collider().body_pos=="leg2_L":
										ray5.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
									if ray5.get_collider().body_pos=="foot_L":
										ray5.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
									if ray5.get_collider().body_pos=="leg1_R":
										ray5.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
									if ray5.get_collider().body_pos=="leg2_R":
										ray5.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
									if ray5.get_collider().body_pos=="foot_R":
										ray5.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
									if ray5.get_collider().body_pos=="head":
										ray5.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
									if ray5.get_collider().body_pos=="shouder_L":
										ray5.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
									if ray5.get_collider().body_pos=="arm_L":
										ray5.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
									if ray5.get_collider().body_pos=="hand_L":
										ray5.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
									if ray5.get_collider().body_pos=="shouder_R":
										ray5.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
									if ray5.get_collider().body_pos=="arm_R":
										ray5.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
									if ray5.get_collider().body_pos=="hand_R":
										ray5.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
									ray5.queue_free()
									
								if player_master.scene_root.mode=="team_death_match":
									if player_master.TDM_team!=ray5.get_collider().player_master.TDM_team:
										player_master.player_3rd_hit_blood_event(ray5.get_collision_point(),"shotgun")
										player_master.bullet_exp_event(ray5.get_collision_point(),false)
										if ray5.get_collider().body_pos=="hip":
											ray5.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
										if ray5.get_collider().body_pos=="spine":
											ray5.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
										if ray5.get_collider().body_pos=="leg1_L":
											ray5.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
										if ray5.get_collider().body_pos=="leg2_L":
											ray5.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
										if ray5.get_collider().body_pos=="foot_L":
											ray5.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
										if ray5.get_collider().body_pos=="leg1_R":
											ray5.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
										if ray5.get_collider().body_pos=="leg2_R":
											ray5.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
										if ray5.get_collider().body_pos=="foot_R":
											ray5.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
										if ray5.get_collider().body_pos=="head":
											ray5.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
										if ray5.get_collider().body_pos=="shouder_L":
											ray5.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
										if ray5.get_collider().body_pos=="arm_L":
											ray5.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
										if ray5.get_collider().body_pos=="hand_L":
											ray5.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
										if ray5.get_collider().body_pos=="shouder_R":
											ray5.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
										if ray5.get_collider().body_pos=="arm_R":
											ray5.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
										if ray5.get_collider().body_pos=="hand_R":
											ray5.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
										ray5.queue_free()
									else:
										ray5.add_exception(ray5.get_collider())
							else:
								ray5.add_exception(ray5.get_collider())
					elif ray5.get_collider().get_collision_layer()==1:
						player_master.bullet_exp_event(ray5.get_collision_point(),false)
						ray5.queue_free()
				else:
					player_master.bullet_exp_event(ray5.get_collision_point(),true)
					ray5.queue_free()
		if ray6!=null:
			if ray6.is_colliding():
				if ray6.get_collider().get_collision_layer()==256:
					player_master.bullet_hit_water_event(ray6.get_collision_point())
					ray6.queue_free()
			ray6.target_position.z+=bullet_speed*get_physics_process_delta_time()
			if ray6.is_colliding():
				if ray6.get_collider().get_collision_layer()!=8:
					if ray6.get_collider().get_collision_layer()==32:
						if ray6.get_collider() is Area3D:
							if ray6.get_collision_point().distance_to(to_global(ray6.target_position))<=shotgun_shoot_player_distance:
								
								if player_master.scene_root.mode=="free_for_all":
									player_master.player_3rd_hit_blood_event(ray6.get_collision_point(),"shotgun")
									player_master.bullet_exp_event(ray6.get_collision_point(),false)
									if ray6.get_collider().body_pos=="hip":
										ray6.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
									if ray6.get_collider().body_pos=="spine":
										ray6.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
									if ray6.get_collider().body_pos=="leg1_L":
										ray6.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
									if ray6.get_collider().body_pos=="leg2_L":
										ray6.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
									if ray6.get_collider().body_pos=="foot_L":
										ray6.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
									if ray6.get_collider().body_pos=="leg1_R":
										ray6.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
									if ray6.get_collider().body_pos=="leg2_R":
										ray6.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
									if ray6.get_collider().body_pos=="foot_R":
										ray6.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
									if ray6.get_collider().body_pos=="head":
										ray6.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
									if ray6.get_collider().body_pos=="shouder_L":
										ray6.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
									if ray6.get_collider().body_pos=="arm_L":
										ray6.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
									if ray6.get_collider().body_pos=="hand_L":
										ray6.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
									if ray6.get_collider().body_pos=="shouder_R":
										ray6.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
									if ray6.get_collider().body_pos=="arm_R":
										ray6.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
									if ray6.get_collider().body_pos=="hand_R":
										ray6.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
									ray6.queue_free()
								
								if player_master.scene_root.mode=="team_death_match":
									if player_master.TDM_team!=ray6.get_collider().player_master.TDM_team:
										player_master.player_3rd_hit_blood_event(ray6.get_collision_point(),"shotgun")
										player_master.bullet_exp_event(ray6.get_collision_point(),false)
										if ray6.get_collider().body_pos=="hip":
											ray6.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
										if ray6.get_collider().body_pos=="spine":
											ray6.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
										if ray6.get_collider().body_pos=="leg1_L":
											ray6.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
										if ray6.get_collider().body_pos=="leg2_L":
											ray6.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
										if ray6.get_collider().body_pos=="foot_L":
											ray6.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
										if ray6.get_collider().body_pos=="leg1_R":
											ray6.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
										if ray6.get_collider().body_pos=="leg2_R":
											ray6.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
										if ray6.get_collider().body_pos=="foot_R":
											ray6.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
										if ray6.get_collider().body_pos=="head":
											ray6.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
										if ray6.get_collider().body_pos=="shouder_L":
											ray6.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
										if ray6.get_collider().body_pos=="arm_L":
											ray6.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
										if ray6.get_collider().body_pos=="hand_L":
											ray6.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
										if ray6.get_collider().body_pos=="shouder_R":
											ray6.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
										if ray6.get_collider().body_pos=="arm_R":
											ray6.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
										if ray6.get_collider().body_pos=="hand_R":
											ray6.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
										ray6.queue_free()
									else:
										ray6.add_exception(ray6.get_collider())
							else:
								ray6.add_exception(ray6.get_collider())
					elif ray6.get_collider().get_collision_layer()==1:
						player_master.bullet_exp_event(ray6.get_collision_point(),false)
						ray6.queue_free()
				else:
					player_master.bullet_exp_event(ray6.get_collision_point(),true)
					ray6.queue_free()
		if ray7!=null:
			if ray7.is_colliding():
				if ray7.get_collider().get_collision_layer()==256:
					player_master.bullet_hit_water_event(ray7.get_collision_point())
					ray7.queue_free()
			ray7.target_position.z+=bullet_speed*get_physics_process_delta_time()
			if ray7.is_colliding():
				if ray7.get_collider().get_collision_layer()!=8:
					if ray7.get_collider().get_collision_layer()==32:
						if ray7.get_collider() is Area3D:
							if ray7.get_collision_point().distance_to(to_global(ray7.target_position))<=shotgun_shoot_player_distance:
								
								if player_master.scene_root.mode=="free_for_all":
									player_master.player_3rd_hit_blood_event(ray7.get_collision_point(),"shotgun")
									player_master.bullet_exp_event(ray7.get_collision_point(),false)
									if ray7.get_collider().body_pos=="hip":
										ray7.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
									if ray7.get_collider().body_pos=="spine":
										ray7.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
									if ray7.get_collider().body_pos=="leg1_L":
										ray7.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
									if ray7.get_collider().body_pos=="leg2_L":
										ray7.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
									if ray7.get_collider().body_pos=="foot_L":
										ray7.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
									if ray7.get_collider().body_pos=="leg1_R":
										ray7.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
									if ray7.get_collider().body_pos=="leg2_R":
										ray7.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
									if ray7.get_collider().body_pos=="foot_R":
										ray7.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
									if ray7.get_collider().body_pos=="head":
										ray7.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
									if ray7.get_collider().body_pos=="shouder_L":
										ray7.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
									if ray7.get_collider().body_pos=="arm_L":
										ray7.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
									if ray7.get_collider().body_pos=="hand_L":
										ray7.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
									if ray7.get_collider().body_pos=="shouder_R":
										ray7.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
									if ray7.get_collider().body_pos=="arm_R":
										ray7.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
									if ray7.get_collider().body_pos=="hand_R":
										ray7.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
									ray7.queue_free()
									
								if player_master.scene_root.mode=="team_death_match":
									if player_master.TDM_team!=ray7.get_collider().player_master.TDM_team:
										player_master.player_3rd_hit_blood_event(ray7.get_collision_point(),"shotgun")
										player_master.bullet_exp_event(ray7.get_collision_point(),false)
										if ray7.get_collider().body_pos=="hip":
											ray7.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
										if ray7.get_collider().body_pos=="spine":
											ray7.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
										if ray7.get_collider().body_pos=="leg1_L":
											ray7.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
										if ray7.get_collider().body_pos=="leg2_L":
											ray7.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
										if ray7.get_collider().body_pos=="foot_L":
											ray7.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
										if ray7.get_collider().body_pos=="leg1_R":
											ray7.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
										if ray7.get_collider().body_pos=="leg2_R":
											ray7.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
										if ray7.get_collider().body_pos=="foot_R":
											ray7.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
										if ray7.get_collider().body_pos=="head":
											ray7.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
										if ray7.get_collider().body_pos=="shouder_L":
											ray7.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
										if ray7.get_collider().body_pos=="arm_L":
											ray7.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
										if ray7.get_collider().body_pos=="hand_L":
											ray7.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
										if ray7.get_collider().body_pos=="shouder_R":
											ray7.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
										if ray7.get_collider().body_pos=="arm_R":
											ray7.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
										if ray7.get_collider().body_pos=="hand_R":
											ray7.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
										ray7.queue_free()
									else:
										ray7.add_exception(ray7.get_collider())
							else:
								ray7.add_exception(ray7.get_collider())
					elif ray7.get_collider().get_collision_layer()==1:
						player_master.bullet_exp_event(ray7.get_collision_point(),false)
						ray7.queue_free()
				else:
					player_master.bullet_exp_event(ray7.get_collision_point(),true)
					ray7.queue_free()
		if ray8!=null:
			if ray8.is_colliding():
				if ray8.get_collider().get_collision_layer()==256:
					player_master.bullet_hit_water_event(ray8.get_collision_point())
					ray8.queue_free()
			ray8.target_position.z+=bullet_speed*get_physics_process_delta_time()
			if ray8.is_colliding():
				if ray8.get_collider().get_collision_layer()!=8:
					if ray8.get_collider().get_collision_layer()==32:
						if ray8.get_collider() is Area3D:
							if ray8.get_collision_point().distance_to(to_global(ray8.target_position))<=shotgun_shoot_player_distance:
								
								if player_master.scene_root.mode=="free_for_all":
									player_master.player_3rd_hit_blood_event(ray8.get_collision_point(),"shotgun")
									player_master.bullet_exp_event(ray8.get_collision_point(),false)
									if ray8.get_collider().body_pos=="hip":
										ray8.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
									if ray8.get_collider().body_pos=="spine":
										ray8.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
									if ray8.get_collider().body_pos=="leg1_L":
										ray8.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
									if ray8.get_collider().body_pos=="leg2_L":
										ray8.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
									if ray8.get_collider().body_pos=="foot_L":
										ray8.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
									if ray8.get_collider().body_pos=="leg1_R":
										ray8.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
									if ray8.get_collider().body_pos=="leg2_R":
										ray8.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
									if ray8.get_collider().body_pos=="foot_R":
										ray8.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
									if ray8.get_collider().body_pos=="head":
										ray8.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
									if ray8.get_collider().body_pos=="shouder_L":
										ray8.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
									if ray8.get_collider().body_pos=="arm_L":
										ray8.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
									if ray8.get_collider().body_pos=="hand_L":
										ray8.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
									if ray8.get_collider().body_pos=="shouder_R":
										ray8.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
									if ray8.get_collider().body_pos=="arm_R":
										ray8.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
									if ray8.get_collider().body_pos=="hand_R":
										ray8.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
									ray8.queue_free()
								
								if player_master.scene_root.mode=="team_death_match":
									if player_master.TDM_team!=ray8.get_collider().player_master.TDM_team:
										player_master.player_3rd_hit_blood_event(ray8.get_collision_point(),"shotgun")
										player_master.bullet_exp_event(ray8.get_collision_point(),false)
										if ray8.get_collider().body_pos=="hip":
											ray8.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
										if ray8.get_collider().body_pos=="spine":
											ray8.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
										if ray8.get_collider().body_pos=="leg1_L":
											ray8.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
										if ray8.get_collider().body_pos=="leg2_L":
											ray8.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
										if ray8.get_collider().body_pos=="foot_L":
											ray8.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
										if ray8.get_collider().body_pos=="leg1_R":
											ray8.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
										if ray8.get_collider().body_pos=="leg2_R":
											ray8.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
										if ray8.get_collider().body_pos=="foot_R":
											ray8.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
										if ray8.get_collider().body_pos=="head":
											ray8.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
										if ray8.get_collider().body_pos=="shouder_L":
											ray8.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
										if ray8.get_collider().body_pos=="arm_L":
											ray8.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
										if ray8.get_collider().body_pos=="hand_L":
											ray8.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
										if ray8.get_collider().body_pos=="shouder_R":
											ray8.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
										if ray8.get_collider().body_pos=="arm_R":
											ray8.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
										if ray8.get_collider().body_pos=="hand_R":
											ray8.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
										ray8.queue_free()
									else:
										ray8.add_exception(ray8.get_collider())
							else:
								ray8.add_exception(ray8.get_collider())
					elif ray8.get_collider().get_collision_layer()==1:
						player_master.bullet_exp_event(ray8.get_collision_point(),false)
						ray8.queue_free()
				else:
					player_master.bullet_exp_event(ray8.get_collision_point(),true)
					ray8.queue_free()
		if ray9!=null:
			if ray9.is_colliding():
				if ray9.get_collider().get_collision_layer()==256:
					player_master.bullet_hit_water_event(ray9.get_collision_point())
					ray9.queue_free()
			ray9.target_position.z+=bullet_speed*get_physics_process_delta_time()
			if ray9.is_colliding():
				if ray9.get_collider().get_collision_layer()!=8:
					if ray9.get_collider().get_collision_layer()==32:
						if ray9.get_collider() is Area3D:
							if ray9.get_collision_point().distance_to(to_global(ray9.target_position))<=shotgun_shoot_player_distance:
								
								if player_master.scene_root.mode=="free_for_all":
									player_master.player_3rd_hit_blood_event(ray9.get_collision_point(),"shotgun")
									player_master.bullet_exp_event(ray9.get_collision_point(),false)
									if ray9.get_collider().body_pos=="hip":
										ray9.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
									if ray9.get_collider().body_pos=="spine":
										ray9.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
									if ray9.get_collider().body_pos=="leg1_L":
										ray9.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
									if ray9.get_collider().body_pos=="leg2_L":
										ray9.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
									if ray9.get_collider().body_pos=="foot_L":
										ray9.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
									if ray9.get_collider().body_pos=="leg1_R":
										ray9.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
									if ray9.get_collider().body_pos=="leg2_R":
										ray9.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
									if ray9.get_collider().body_pos=="foot_R":
										ray9.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
									if ray9.get_collider().body_pos=="head":
										ray9.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
									if ray9.get_collider().body_pos=="shouder_L":
										ray9.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
									if ray9.get_collider().body_pos=="arm_L":
										ray9.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
									if ray9.get_collider().body_pos=="hand_L":
										ray9.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
									if ray9.get_collider().body_pos=="shouder_R":
										ray9.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
									if ray9.get_collider().body_pos=="arm_R":
										ray9.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
									if ray9.get_collider().body_pos=="hand_R":
										ray9.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
									ray9.queue_free()
								
								if player_master.scene_root.mode=="team_death_match":
									if player_master.TDM_team!=ray9.get_collider().player_master.TDM_team:
										player_master.player_3rd_hit_blood_event(ray9.get_collision_point(),"shotgun")
										player_master.bullet_exp_event(ray9.get_collision_point(),false)
										if ray9.get_collider().body_pos=="hip":
											ray9.get_collider().hurt_event(shotgun_damage[0].pick_random(),player_master)
										if ray9.get_collider().body_pos=="spine":
											ray9.get_collider().hurt_event(shotgun_damage[1].pick_random(),player_master)
										if ray9.get_collider().body_pos=="leg1_L":
											ray9.get_collider().hurt_event(shotgun_damage[2].pick_random(),player_master)
										if ray9.get_collider().body_pos=="leg2_L":
											ray9.get_collider().hurt_event(shotgun_damage[3].pick_random(),player_master)
										if ray9.get_collider().body_pos=="foot_L":
											ray9.get_collider().hurt_event(shotgun_damage[4].pick_random(),player_master)
										if ray9.get_collider().body_pos=="leg1_R":
											ray9.get_collider().hurt_event(shotgun_damage[5].pick_random(),player_master)
										if ray9.get_collider().body_pos=="leg2_R":
											ray9.get_collider().hurt_event(shotgun_damage[6].pick_random(),player_master)
										if ray9.get_collider().body_pos=="foot_R":
											ray9.get_collider().hurt_event(shotgun_damage[7].pick_random(),player_master)
										if ray9.get_collider().body_pos=="head":
											ray9.get_collider().hurt_event(shotgun_damage[8].pick_random(),player_master)
										if ray9.get_collider().body_pos=="shouder_L":
											ray9.get_collider().hurt_event(shotgun_damage[9].pick_random(),player_master)
										if ray9.get_collider().body_pos=="arm_L":
											ray9.get_collider().hurt_event(shotgun_damage[10].pick_random(),player_master)
										if ray9.get_collider().body_pos=="hand_L":
											ray9.get_collider().hurt_event(shotgun_damage[11].pick_random(),player_master)
										if ray9.get_collider().body_pos=="shouder_R":
											ray9.get_collider().hurt_event(shotgun_damage[12].pick_random(),player_master)
										if ray9.get_collider().body_pos=="arm_R":
											ray9.get_collider().hurt_event(shotgun_damage[13].pick_random(),player_master)
										if ray9.get_collider().body_pos=="hand_R":
											ray9.get_collider().hurt_event(shotgun_damage[14].pick_random(),player_master)
										ray9.queue_free()
									else:
										ray9.add_exception(ray9.get_collider())
							else:
								ray9.add_exception(ray9.get_collider())
					elif ray9.get_collider().get_collision_layer()==1:
						player_master.bullet_exp_event(ray9.get_collision_point(),false)
						ray9.queue_free()
				else:
					player_master.bullet_exp_event(ray9.get_collision_point(),true)
					ray9.queue_free()
		
		if $shotgun_all_ray.get_children().size()==0:
			self.queue_free()
			for i in range(sub_objects.size()):
				sub_objects[i].queue_free()
	
	
	if weapon_type=="machine_gun":
		if self.is_colliding():
			if self.get_collider().get_collision_layer()==256:
				player_master.bullet_hit_water_event(get_collision_point())
				self.queue_free()
		if player_master!=null:
			self.add_exception(player_master)
		target_position.z+=bullet_speed*get_physics_process_delta_time()
		if self.is_colliding():
			if self.get_collider().get_collision_layer()!=8:
				if self.get_collider().get_collision_layer()==32:
					if self.get_collider() is Area3D:
						if self.get_collision_point().distance_to(to_global(self.target_position))<=machine_gun_shoot_player_distance:
							
							if player_master.scene_root.mode=="free_for_all":
								player_master.player_3rd_hit_blood_event(get_collision_point(),"machine_gun")
								player_master.bullet_exp_event(get_collision_point(),false)
								if self.get_collider().body_pos=="hip":
									self.get_collider().hurt_event(machine_gun_damage[0].pick_random(),player_master)
								if self.get_collider().body_pos=="spine":
									self.get_collider().hurt_event(machine_gun_damage[1].pick_random(),player_master)
								if self.get_collider().body_pos=="leg1_L":
									self.get_collider().hurt_event(machine_gun_damage[2].pick_random(),player_master)
								if self.get_collider().body_pos=="leg2_L":
									self.get_collider().hurt_event(machine_gun_damage[3].pick_random(),player_master)
								if self.get_collider().body_pos=="foot_L":
									self.get_collider().hurt_event(machine_gun_damage[4].pick_random(),player_master)
								if self.get_collider().body_pos=="leg1_R":
									self.get_collider().hurt_event(machine_gun_damage[5].pick_random(),player_master)
								if self.get_collider().body_pos=="leg2_R":
									self.get_collider().hurt_event(machine_gun_damage[6].pick_random(),player_master)
								if self.get_collider().body_pos=="foot_R":
									self.get_collider().hurt_event(machine_gun_damage[7].pick_random(),player_master)
								if self.get_collider().body_pos=="head":
									self.get_collider().hurt_event(machine_gun_damage[8].pick_random(),player_master)
								if self.get_collider().body_pos=="shouder_L":
									self.get_collider().hurt_event(machine_gun_damage[9].pick_random(),player_master)
								if self.get_collider().body_pos=="arm_L":
									self.get_collider().hurt_event(machine_gun_damage[10].pick_random(),player_master)
								if self.get_collider().body_pos=="hand_L":
									self.get_collider().hurt_event(machine_gun_damage[11].pick_random(),player_master)
								if self.get_collider().body_pos=="shouder_R":
									self.get_collider().hurt_event(machine_gun_damage[12].pick_random(),player_master)
								if self.get_collider().body_pos=="arm_R":
									self.get_collider().hurt_event(machine_gun_damage[13].pick_random(),player_master)
								if self.get_collider().body_pos=="hand_R":
									self.get_collider().hurt_event(machine_gun_damage[14].pick_random(),player_master)
							
								self.queue_free()
								for i in range(sub_objects.size()):
									sub_objects[i].queue_free()
									
							if player_master.scene_root.mode=="team_death_match":
								if player_master.TDM_team!=self.get_collider().player_master.TDM_team:
									player_master.player_3rd_hit_blood_event(get_collision_point(),"machine_gun")
									player_master.bullet_exp_event(get_collision_point(),false)
									if self.get_collider().body_pos=="hip":
										self.get_collider().hurt_event(machine_gun_damage[0].pick_random(),player_master)
									if self.get_collider().body_pos=="spine":
										self.get_collider().hurt_event(machine_gun_damage[1].pick_random(),player_master)
									if self.get_collider().body_pos=="leg1_L":
										self.get_collider().hurt_event(machine_gun_damage[2].pick_random(),player_master)
									if self.get_collider().body_pos=="leg2_L":
										self.get_collider().hurt_event(machine_gun_damage[3].pick_random(),player_master)
									if self.get_collider().body_pos=="foot_L":
										self.get_collider().hurt_event(machine_gun_damage[4].pick_random(),player_master)
									if self.get_collider().body_pos=="leg1_R":
										self.get_collider().hurt_event(machine_gun_damage[5].pick_random(),player_master)
									if self.get_collider().body_pos=="leg2_R":
										self.get_collider().hurt_event(machine_gun_damage[6].pick_random(),player_master)
									if self.get_collider().body_pos=="foot_R":
										self.get_collider().hurt_event(machine_gun_damage[7].pick_random(),player_master)
									if self.get_collider().body_pos=="head":
										self.get_collider().hurt_event(machine_gun_damage[8].pick_random(),player_master)
									if self.get_collider().body_pos=="shouder_L":
										self.get_collider().hurt_event(machine_gun_damage[9].pick_random(),player_master)
									if self.get_collider().body_pos=="arm_L":
										self.get_collider().hurt_event(machine_gun_damage[10].pick_random(),player_master)
									if self.get_collider().body_pos=="hand_L":
										self.get_collider().hurt_event(machine_gun_damage[11].pick_random(),player_master)
									if self.get_collider().body_pos=="shouder_R":
										self.get_collider().hurt_event(machine_gun_damage[12].pick_random(),player_master)
									if self.get_collider().body_pos=="arm_R":
										self.get_collider().hurt_event(machine_gun_damage[13].pick_random(),player_master)
									if self.get_collider().body_pos=="hand_R":
										self.get_collider().hurt_event(machine_gun_damage[14].pick_random(),player_master)
								
									self.queue_free()
									for i in range(sub_objects.size()):
										sub_objects[i].queue_free()
								else:
									self.add_exception(self.get_collider())
						else:
							self.add_exception(self.get_collider())
				elif self.get_collider().get_collision_layer()==1:
					player_master.bullet_exp_event(get_collision_point(),false)
					self.queue_free()
					for i in range(sub_objects.size()):
						sub_objects[i].queue_free()
			else:
				player_master.bullet_exp_event(get_collision_point(),true)
				self.queue_free()
				for i in range(sub_objects.size()):
					sub_objects[i].queue_free()
