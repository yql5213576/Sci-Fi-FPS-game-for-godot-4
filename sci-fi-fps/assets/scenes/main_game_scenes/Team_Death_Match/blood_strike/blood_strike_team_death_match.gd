extends Node3D

#autoload
var bot_num=0

var blue_bot_num=0
var red_bot_num=0

var bot_difficulty=""
#autoload

@onready var ai_nav_points=$ai_nav_points.get_children()
var ai_nav_points_lib_id=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]
var ai_nav_points_lib={1:true,2:true,3:true,4:true,5:true,6:true,7:true,8:true,9:true,10:true,11:true,12:true,13:true,14:true,15:true,16:true,17:true,18:true,19:true,20:true,21:true,22:true,23:true,24:true,25:true,26:true}
var players=[]

var ai_blue_points_lib_id=[1,2,3,4,5,6,7,8]
var ai_blue_points_lib={1:true,2:true,3:true,4:true,5:true,6:true,7:true,8:true}

var ai_red_points_lib_id=[1,2,3,4,5,6,7,8]
var ai_red_points_lib={1:true,2:true,3:true,4:true,5:true,6:true,7:true,8:true}

@onready var players_points=$player.get_children()
@onready var players_blue_points=$team_points/blue_points.get_children()
@onready var players_red_points=$team_points/red_points.get_children()
var ai_lib_size=26
var user_player=null

var mode="team_death_match"
var first_blood=false
var game_start=false

var game_over=false

var player_ready=false
func _ready() -> void:
	game_times=Main_Menu_Global.setting_game_time_i
	#players.append($player/point1/hero_player)
	#players.append($player/point2/hero_AI)
	#players.append($player/point3/hero_AI)
	#players.append($player/point4/hero_AI)
	#players.append($player/point5/hero_AI)
	#players.append($player/point6/hero_AI)
	if UserData.voxelgi_data==false:
		$VoxelGI.visible=false
	if UserData.voxelgi_data==true:
		$VoxelGI.visible=true
	get_tree().root.mesh_lod_threshold=UserData.lod_data
	get_tree().root.scaling_3d_scale=UserData.render_resolution_data
	get_tree().root.use_occlusion_culling=true
@onready var current_map_scene="res://assets/scenes/main_game_scenes/Team_Death_Match/blood_strike/blood_strike_team_death_match.tscn"
@onready var blood_strike_environment=preload("res://assets/scenes/main_game_scenes/blood_strike/blood_strike.tres")
func _physics_process(delta: float) -> void:
	
	if game_over==true:
		saturation_event=false
		game_result()
	
	if saturation_event:
		blood_strike_environment.adjustment_saturation=Vector2(blood_strike_environment.adjustment_saturation,0).lerp(Vector2(1.2,0),0.005).x
	else:
		blood_strike_environment.adjustment_saturation=Vector2(blood_strike_environment.adjustment_saturation,0).lerp(Vector2(0,0),0.1).x
	
	area_collision_ai_nav_points()
	score_board_control()
	if game_over==false:
		game_time_control()
		kill_score_control()
	
	bot_num=Main_Menu_Global.setting_bot_num_i
	bot_difficulty=Main_Menu_Global.setting_difficulty
func area_collision_ai_nav_points():
	if $"ai_nav_points/1".has_overlapping_bodies():
		ai_nav_points_lib['1'] = false
	else:
		ai_nav_points_lib['1'] = true
		
	if $"ai_nav_points/2".has_overlapping_bodies():
		ai_nav_points_lib['2'] = false
	else:
		ai_nav_points_lib['2'] = true
		
	if $"ai_nav_points/3".has_overlapping_bodies():
		ai_nav_points_lib['3'] = false
	else:
		ai_nav_points_lib['3'] = true
		
	if $"ai_nav_points/4".has_overlapping_bodies():
		ai_nav_points_lib['4'] = false
	else:
		ai_nav_points_lib['4'] = true
		
	if $"ai_nav_points/5".has_overlapping_bodies():
		ai_nav_points_lib['5'] = false
	else:
		ai_nav_points_lib['5'] = true
		
	if $"ai_nav_points/6".has_overlapping_bodies():
		ai_nav_points_lib['6'] = false
	else:
		ai_nav_points_lib['6'] = true
		
	if $"ai_nav_points/7".has_overlapping_bodies():
		ai_nav_points_lib['7'] = false
	else:
		ai_nav_points_lib['7'] = true
		
	if $"ai_nav_points/8".has_overlapping_bodies():
		ai_nav_points_lib['8'] = false
	else:
		ai_nav_points_lib['8'] = true
		
	if $"ai_nav_points/9".has_overlapping_bodies():
		ai_nav_points_lib['9'] = false
	else:
		ai_nav_points_lib['9'] = true
		
	if $"ai_nav_points/10".has_overlapping_bodies():
		ai_nav_points_lib['10'] = false
	else:
		ai_nav_points_lib['10'] = true
	if $"ai_nav_points/11".has_overlapping_bodies():
		ai_nav_points_lib['11'] = false
	else:
		ai_nav_points_lib['11'] = true
		
	if $"ai_nav_points/12".has_overlapping_bodies():
		ai_nav_points_lib['12'] = false
	else:
		ai_nav_points_lib['12'] = true
		
	if $"ai_nav_points/13".has_overlapping_bodies():
		ai_nav_points_lib['13'] = false
	else:
		ai_nav_points_lib['13'] = true
		
	if $"ai_nav_points/14".has_overlapping_bodies():
		ai_nav_points_lib['14'] = false
	else:
		ai_nav_points_lib['14'] = true
		
	if $"ai_nav_points/15".has_overlapping_bodies():
		ai_nav_points_lib['15'] = false
	else:
		ai_nav_points_lib['15'] = true
		
	if $"ai_nav_points/16".has_overlapping_bodies():
		ai_nav_points_lib['16'] = false
	else:
		ai_nav_points_lib['16'] = true
		
	if $"ai_nav_points/17".has_overlapping_bodies():
		ai_nav_points_lib['17'] = false
	else:
		ai_nav_points_lib['17'] = true
		
	if $"ai_nav_points/18".has_overlapping_bodies():
		ai_nav_points_lib['18'] = false
	else:
		ai_nav_points_lib['18'] = true
	
	if $"ai_nav_points/19".has_overlapping_bodies():
		ai_nav_points_lib['19'] = false
	else:
		ai_nav_points_lib['19'] = true
	
	if $"ai_nav_points/20".has_overlapping_bodies():
		ai_nav_points_lib['20'] = false
	else:
		ai_nav_points_lib['20'] = true
	
	if $"ai_nav_points/21".has_overlapping_bodies():
		ai_nav_points_lib['21'] = false
	else:
		ai_nav_points_lib['21'] = true
	
	if $"ai_nav_points/22".has_overlapping_bodies():
		ai_nav_points_lib['22'] = false
	else:
		ai_nav_points_lib['22'] = true
		
	if $"ai_nav_points/23".has_overlapping_bodies():
		ai_nav_points_lib['23'] = false
	else:
		ai_nav_points_lib['23'] = true
		
	if $"ai_nav_points/24".has_overlapping_bodies():
		ai_nav_points_lib['24'] = false
	else:
		ai_nav_points_lib['24'] = true
		
	if $"ai_nav_points/25".has_overlapping_bodies():
		ai_nav_points_lib['25'] = false
	else:
		ai_nav_points_lib['25'] = true
		
	if $"ai_nav_points/26".has_overlapping_bodies():
		ai_nav_points_lib['26'] = false
	else:
		ai_nav_points_lib['26'] = true
	
	
	if $"team_points/blue_points/1".has_overlapping_bodies():
		ai_blue_points_lib['1']=false
	else:
		ai_blue_points_lib['1']=true
		
	if $"team_points/blue_points/2".has_overlapping_bodies():
		ai_blue_points_lib['2']=false
	else:
		ai_blue_points_lib['2']=true
	
	if $"team_points/blue_points/3".has_overlapping_bodies():
		ai_blue_points_lib['3']=false
	else:
		ai_blue_points_lib['3']=true
	
	if $"team_points/blue_points/4".has_overlapping_bodies():
		ai_blue_points_lib['4']=false
	else:
		ai_blue_points_lib['4']=true
	
	if $"team_points/blue_points/5".has_overlapping_bodies():
		ai_blue_points_lib['5']=false
	else:
		ai_blue_points_lib['5']=true
	
	if $"team_points/blue_points/6".has_overlapping_bodies():
		ai_blue_points_lib['6']=false
	else:
		ai_blue_points_lib['6']=true
	
	if $"team_points/blue_points/7".has_overlapping_bodies():
		ai_blue_points_lib['7']=false
	else:
		ai_blue_points_lib['7']=true
	
	if $"team_points/blue_points/8".has_overlapping_bodies():
		ai_blue_points_lib['8']=false
	else:
		ai_blue_points_lib['8']=true
	
	
	
	
	if $"team_points/red_points/1".has_overlapping_bodies():
		ai_red_points_lib['1']=false
	else:
		ai_red_points_lib['1']=true
		
	if $"team_points/red_points/2".has_overlapping_bodies():
		ai_red_points_lib['2']=false
	else:
		ai_red_points_lib['2']=true
	
	if $"team_points/red_points/3".has_overlapping_bodies():
		ai_red_points_lib['3']=false
	else:
		ai_red_points_lib['3']=true
	
	if $"team_points/red_points/4".has_overlapping_bodies():
		ai_red_points_lib['4']=false
	else:
		ai_red_points_lib['4']=true
	
	if $"team_points/red_points/5".has_overlapping_bodies():
		ai_red_points_lib['5']=false
	else:
		ai_red_points_lib['5']=true
	
	if $"team_points/red_points/6".has_overlapping_bodies():
		ai_red_points_lib['6']=false
	else:
		ai_red_points_lib['6']=true
	
	if $"team_points/red_points/7".has_overlapping_bodies():
		ai_red_points_lib['7']=false
	else:
		ai_red_points_lib['7']=true
	
	if $"team_points/red_points/8".has_overlapping_bodies():
		ai_red_points_lib['8']=false
	else:
		ai_red_points_lib['8']=true


var blue_team_score=0
var red_team_score=0
var win_team:String




func print_A_kills_B(A,B):
	if players_name_blue.find(A.user_name)!=-1:
		players_kills_blue[players_name_blue.find(A.user_name)]+=1
	if players_name_blue.find(B.user_name)!=-1:
		players_die_blue[players_name_blue.find(B.user_name)]+=1
	if players_name_red.find(A.user_name)!=-1:
		players_kills_red[players_name_red.find(A.user_name)]+=1
	if players_name_red.find(B.user_name)!=-1:
		players_die_red[players_name_red.find(B.user_name)]+=1
	
	print(A.user_name+"    kill    "+B.user_name)
	if user_player.has_method("print_killing_tips"):
		user_player.print_killing_tips(A.user_name+"    kill    "+B.user_name)
	if A.TDM_team=="blue"&&B.TDM_team=="red":
		blue_team_score+=1
		if A.user_name==UserData.user_name_data:
			UserData.kills_data_n+=1
			if first_blood==false:
				user_player.get_first_blood_event()
				first_blood=true
				return
			if first_blood==true:
				user_player.kills_anim_event()
		else:
			if first_blood==false:
				first_blood=true
		if B.user_name==UserData.user_name_data:
			UserData.death_data_n+=1
	if A.TDM_team=="red"&&B.TDM_team=="blue":
		red_team_score+=1
		if A.user_name==UserData.user_name_data:
			UserData.kills_data_n+=1
			if first_blood==false:
				user_player.get_first_blood_event()
				first_blood=true
				return
			if first_blood==true:
				user_player.kills_anim_event()
		else:
			if first_blood==false:
				first_blood=true
		if B.user_name==UserData.user_name_data:
			UserData.death_data_n+=1

var saturation_event=false
func scene_saturation_event():
	saturation_event=true

var game_times=0
var game_timer=1
var game_time_min=[0,0]
var game_time_sec=[0,0]
var time_start=false
#0,5,10,30,60
func game_time_control():
	if time_start==false:
		if game_times==0:
			pass
		if game_times==1:
			game_time_min=[0,1]
			game_time_sec=[0,0]
			time_start=true
		if game_times==5:
			game_time_min=[0,5]
			game_time_sec=[0,0]
			time_start=true
		if game_times==10:
			game_time_min=[0,10]
			game_time_sec=[0,0]
			time_start=true
		if game_times==30:
			game_time_min=[0,30]
			game_time_sec=[0,0]
			time_start=true
		if game_times==60:
			game_time_min=[0,60]
			game_time_sec=[0,0]
			time_start=true
	else:
		if game_start:
			if game_times!=0:
				game_timer+=get_physics_process_delta_time()
				if game_timer>=1:
					if game_time_min[1]>=0:
						if game_time_sec==[0,0]:
							if game_time_min[1]>0:
								game_time_sec[0]=5
								game_time_sec[1]=9
							if game_time_min[1]>0:
								game_time_min[1]-=1
						else:
							if game_time_sec[1]>0:
								game_time_sec[1]-=1
							else:
								game_time_sec[0]-=1
								game_time_sec[1]=9
					game_timer=0
				if game_time_min[1]==0:
					if game_time_sec==[0,0]:
						game_over=true

func kill_score_control():
	if blue_team_score>=Main_Menu_Global.setting_max_kills_i:
		game_over=true
	if red_team_score>=Main_Menu_Global.setting_max_kills_i:
		game_over=true

func game_result():
	ScoreBoardTDMGlobal.blue_team_score=blue_team_score
	ScoreBoardTDMGlobal.red_team_score=red_team_score
	if blue_team_score>red_team_score:
		win_team="blue"
	if red_team_score>blue_team_score:
		win_team="red"
	if red_team_score==blue_team_score:
		win_team="draw"


#---scoreboard----
var players_name_blue=[]
var players_kills_blue=[]
var players_die_blue=[]

var players_name_red=[]
var players_kills_red=[]
var players_die_red=[]

var score_board_ready=false
@onready var score_board_scene="res://assets/my_UI/pause_menu/scoreboard_TDM.tscn"
var game_end_timer=0
var resault_bool=false
func score_board_control():
	if score_board_ready==true:
		if players_name_blue.size()>0:
			if players_kills_blue.size()!=players_name_blue.size():
				for pk in range(players_name_blue.size()):
					players_kills_blue.append(0)
			if players_die_blue.size()!=players_name_blue.size():
				for pd in range(players_name_blue.size()):
					players_die_blue.append(0)
					
		if players_name_red.size()>0:
			if players_kills_red.size()!=players_name_red.size():
				for pk in range(players_name_red.size()):
					players_kills_red.append(0)
			if players_die_red.size()!=players_name_red.size():
				for pd in range(players_name_red.size()):
					players_die_red.append(0)
		score_board_ready=false
	
	if game_over:
		if resault_bool==false:
			UserData.battles_data_n+=1
			resault_bool=true
		game_end_timer+=get_physics_process_delta_time()
		if game_end_timer>=5:
			var progress=[]
			ResourceLoader.load_threaded_request(score_board_scene)
			ResourceLoader.load_threaded_get_status(score_board_scene,progress)
			if progress[0]==1:
				var packed_scene=ResourceLoader.load_threaded_get(score_board_scene)
				ScoreBoardTDMGlobal.players_name_blue=players_name_blue
				ScoreBoardTDMGlobal.players_kills_blue=players_kills_blue
				ScoreBoardTDMGlobal.players_die_blue=players_die_blue
				
				ScoreBoardTDMGlobal.players_name_red=players_name_red
				ScoreBoardTDMGlobal.players_kills_red=players_kills_red
				ScoreBoardTDMGlobal.players_die_red=players_die_red
				get_tree().change_scene_to_packed(packed_scene)
#---scoreboard----
