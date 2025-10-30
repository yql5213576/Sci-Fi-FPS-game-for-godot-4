extends Node3D
var ai_lib_size=18
var user_player=null

var mode="team_death_match"
var first_blood=false
var game_start=false

var game_over=false

var player_ready=false


var blue_team_score=0
var red_team_score=0
var win_team:String

var game_times=0
var game_timer=1
var game_time_min=[0,0]
var game_time_sec=[0,0]
var time_start=false

var ai_blue_points_lib_id=[1,2,3,4,5,6,7,8]
var ai_blue_points_lib={1:true,2:true,3:true,4:true,5:true,6:true,7:true,8:true}

var ai_red_points_lib_id=[1,2,3,4,5,6,7,8]
var ai_red_points_lib={1:true,2:true,3:true,4:true,5:true,6:true,7:true,8:true}

@onready var ai_nav_points=$ai_nav_points.get_children()
var ai_nav_points_lib_id=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]
var ai_nav_points_lib={1:true,2:true,3:true,4:true,5:true,6:true,7:true,8:true,9:true,10:true,11:true,12:true,13:true,14:true,15:true,16:true,17:true,18:true}

@onready var players_points=$player.get_children()
@onready var players_blue_points=$team_points/blue_points.get_children()
@onready var players_red_points=$team_points/red_points.get_children()


var players=[]
func _ready() -> void:
	players.append($player/point1/hero_player)
	#get_viewport().content_scale_size=Vector2(2560,1600)
	get_viewport().content_scale_size=Vector2(1152,648)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
func kill_score_control(test):
	pass

func _physics_process(delta: float) -> void:
	area_collision_ai_nav_points()
	
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
