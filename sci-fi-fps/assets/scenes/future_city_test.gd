extends Node3D
@onready var ai_nav_points=$ai_nav_points.get_children()
var ai_nav_points_lib_id=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]
var ai_nav_points_lib={1:true,2:true,3:true,4:true,5:true,6:true,7:true,8:true,9:true,10:true,11:true,12:true,13:true,14:true,15:true,16:true,17:true,18:true}
var players=[]
@onready var players_points=$player.get_children()
var ai_lib_size=18
@onready var test_player=$player/point1/hero_player

func _ready() -> void:
	players.append($player/point1/hero_player)
	players.append($player/point2/hero_AI)
	players.append($player/point3/hero_AI)
	players.append($player/point4/hero_AI)
	players.append($player/point5/hero_AI)
	players.append($player/point6/hero_AI)
	players.append($player/point7/hero_AI)
	players.append($player/point8/hero_AI)
	players.append($player/point9/hero_AI)


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
	if $"ai_nav_points/1".has_overlapping_bodies():
		ai_nav_points_lib['11'] = false
	else:
		ai_nav_points_lib['11'] = true
		
	if $"ai_nav_points/2".has_overlapping_bodies():
		ai_nav_points_lib['12'] = false
	else:
		ai_nav_points_lib['12'] = true
		
	if $"ai_nav_points/3".has_overlapping_bodies():
		ai_nav_points_lib['13'] = false
	else:
		ai_nav_points_lib['13'] = true
		
	if $"ai_nav_points/4".has_overlapping_bodies():
		ai_nav_points_lib['14'] = false
	else:
		ai_nav_points_lib['14'] = true
		
	if $"ai_nav_points/5".has_overlapping_bodies():
		ai_nav_points_lib['15'] = false
	else:
		ai_nav_points_lib['15'] = true
		
	if $"ai_nav_points/6".has_overlapping_bodies():
		ai_nav_points_lib['16'] = false
	else:
		ai_nav_points_lib['16'] = true
		
	if $"ai_nav_points/7".has_overlapping_bodies():
		ai_nav_points_lib['17'] = false
	else:
		ai_nav_points_lib['17'] = true
		
	if $"ai_nav_points/8".has_overlapping_bodies():
		ai_nav_points_lib['18'] = false
	else:
		ai_nav_points_lib['18'] = true
