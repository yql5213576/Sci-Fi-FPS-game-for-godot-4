extends Node

var map:String
var mode:String

var setting_bot_num:String
var setting_bot_num_i:int

var setting_difficulty:String

var setting_game_time:String
var setting_game_time_i:int

var setting_max_kills:String
var setting_max_kills_i:int

var user_name:String=""
var bot_names:Array[String]=["bot1","bot2","bot3","bot4","bot5","bot6","bot7","bot8","bot9","bot10","bot11","bot12","bot13","bot14","bot15"]
func _physics_process(delta: float) -> void:
	setting_bot_num_i=int(setting_bot_num)
	setting_game_time_i=int(setting_game_time)
	setting_max_kills_i=int(setting_max_kills)
	
