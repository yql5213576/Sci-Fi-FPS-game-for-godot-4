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
@onready var players_points=$player.get_children()
var ai_lib_size=26
var user_player=null

var mode="free_for_all"
var first_blood=false
var game_start=false

var game_over=false

var player_ready=false
func _ready() -> void:
	game_times=Main_Menu_Global.setting_game_time_i
	forest_sp_openion()
	#players.append($player/point1/hero_player)
	#players.append($player/point2/hero_AI)
	#players.append($player/point3/hero_AI)
	#players.append($player/point4/hero_AI)
	#players.append($player/point5/hero_AI)
	#players.append($player/point6/hero_AI)
@onready var current_map_scene="res://assets/scenes/main_game_scenes/Free_For_All/forest/forest_free_for_all.tscn"
@onready var blood_strike_environment=preload("res://assets/scenes/forest/terrain/forest_main_scene_environment.tres")
func _physics_process(delta: float) -> void:
	#print(players_kills,players_name,"---",score_board_ready)
	if game_over==true:
		saturation_event=false
		game_result()
	
	if saturation_event:
		blood_strike_environment.adjustment_saturation=Vector2(blood_strike_environment.adjustment_saturation,0).lerp(Vector2(1.2,0),0.005).x
	else:
		blood_strike_environment.adjustment_saturation=0
	
	area_collision_ai_nav_points()
	score_board_control()
	if game_over==false:
		game_time_control()
	
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



func print_A_kills_B(A,B):
	players_kills[players_name.find(A.user_name)]+=1
	players_die[players_name.find(B.user_name)]+=1
	print(A.user_name+"    kill    "+B.user_name)
	A.player_kill_score_FFA+=1
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
var win_player=null
func kill_score_control(player):
	game_over=true
	win_player=player
	
#---scoreboard----
var players_name=[]
var players_kills=[]
var players_die=[]


var score_board_ready=false
func game_result():
	pass

@onready var score_board_scene="res://assets/my_UI/pause_menu/scoreboard_FFA.tscn"
var game_end_timer=0
var resault_bool=false
func score_board_control():
	if score_board_ready==true:
		if players_name.size()>0:
			if players_kills.size()!=players_name.size():
				for pk in range(players_name.size()):
					players_kills.append(0)
			if players_die.size()!=players_name.size():
				for pd in range(players_name.size()):
					players_die.append(0)
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
				ScoreBoardFFAGlobal.players_name=players_name
				ScoreBoardFFAGlobal.players_kills=players_kills
				ScoreBoardFFAGlobal.players_die=players_die
				get_tree().change_scene_to_packed(packed_scene)
#---scoreboard----

func forest_sp_openion():
	if UserData.grass_density==0:
		$map/grass1_small.queue_free()
		$map/grass1.queue_free()
		$map/grass2.queue_free()
	if UserData.grass_density==1:
		$map/grass1.queue_free()
		$map/grass2.queue_free()
	if UserData.grass_density==2:
		pass
