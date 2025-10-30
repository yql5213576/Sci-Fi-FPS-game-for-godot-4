extends Node3D
@onready var scene_root=$".."
var player_team=""
var user_name=UserData.user_name_data
var current_player_type=""

var player_into_bool=false
var player_into_n=0
func _ready() -> void:
	team_select_node.visible=false
func player_into_scene():
	#1,3,5,7,9,11,13,15
	if Main_Menu_Global.setting_bot_num_i==0:
		if self.player_team=="blue":
			if player_into_n==0:
				instance_player(scene_root.ai_blue_points_lib_id[0],true)
				player_into_n=1
				player_into_bool=false
				return
		if self.player_team=="red":
			if player_into_n==0:
				instance_player(scene_root.ai_red_points_lib_id[0],true)
				player_into_n=1
				player_into_bool=false
				return

	if Main_Menu_Global.setting_bot_num_i==1:#1v1
		if self.player_team=="blue":
			if player_into_n==0:
				instance_player(scene_root.ai_blue_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("red",2,2,scene_root.ai_red_points_lib_id[0],true)
				player_into_n=2
				player_into_bool=false
				return
			
		if self.player_team=="red":
			if player_into_n==0:
				instance_player(scene_root.ai_red_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("blue",2,2,scene_root.ai_blue_points_lib_id[0],true)
				player_into_n=2
				player_into_bool=false
				return
			
	if Main_Menu_Global.setting_bot_num_i==3:#2v2
		if self.player_team=="blue":
			if player_into_n==0:
				instance_player(scene_root.ai_blue_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("red",2,2,scene_root.ai_red_points_lib_id[0],false)
				player_into_n=2
				player_into_bool=false
				return
			if player_into_n==2:
				instance_ai("red",3,3,scene_root.ai_red_points_lib_id[1],false)
				player_into_n=3
				player_into_bool=false
				return
			if player_into_n==3:
				instance_ai("blue",4,4,scene_root.ai_blue_points_lib_id[1],true)
				player_into_n=4
				player_into_bool=false
				return
			
		if self.player_team=="red":
			if player_into_n==0:
				instance_player(scene_root.ai_red_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("blue",2,2,scene_root.ai_blue_points_lib_id[0],false)
				player_into_n=2
				player_into_bool=false
				return
			if player_into_n==2:
				instance_ai("blue",3,3,scene_root.ai_blue_points_lib_id[1],false)
				player_into_n=3
				player_into_bool=false
				return
			if player_into_n==3:
				instance_ai("red",4,4,scene_root.ai_red_points_lib_id[1],true)
				player_into_n=4
				player_into_bool=false
				return
	if Main_Menu_Global.setting_bot_num_i==5:#3v3
		if self.player_team=="blue":
			if player_into_n==0:
				instance_player(scene_root.ai_blue_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("red",2,2,scene_root.ai_red_points_lib_id[0],false)
				player_into_n=2
				player_into_bool=false
				return
			if player_into_n==2:
				instance_ai("red",3,3,scene_root.ai_red_points_lib_id[1],false)
				player_into_n=3
				player_into_bool=false
				return
			if player_into_n==3:
				instance_ai("red",4,4,scene_root.ai_red_points_lib_id[2],false)
				player_into_n=4
				player_into_bool=false
				return
			if player_into_n==4:
				instance_ai("blue",5,5,scene_root.ai_blue_points_lib_id[1],false)
				player_into_n=5
				player_into_bool=false
				return
			if player_into_n==5:
				instance_ai("blue",6,6,scene_root.ai_blue_points_lib_id[2],true)
				player_into_n=6
				player_into_bool=false
				return
			
		if self.player_team=="red":
			if player_into_n==0:
				instance_player(scene_root.ai_red_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("blue",2,2,scene_root.ai_blue_points_lib_id[0],false)
				player_into_n=2
				player_into_bool=false
				return
			if player_into_n==2:
				instance_ai("blue",3,3,scene_root.ai_blue_points_lib_id[1],false)
				player_into_n=3
				player_into_bool=false
				return
			if player_into_n==3:
				instance_ai("blue",4,4,scene_root.ai_blue_points_lib_id[2],false)
				player_into_n=4
				player_into_bool=false
				return
			if player_into_n==4:
				instance_ai("red",5,5,scene_root.ai_red_points_lib_id[1],false)
				player_into_n=5
				player_into_bool=false
				return
			if player_into_n==5:
				instance_ai("red",6,6,scene_root.ai_red_points_lib_id[2],true)
				player_into_n=6
				player_into_bool=false
				return
			
	if Main_Menu_Global.setting_bot_num_i==7:#4v4
		if self.player_team=="blue":
			if player_into_n==0:
				instance_player(scene_root.ai_blue_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("red",2,2,scene_root.ai_red_points_lib_id[0],false)
				player_into_n=2
				player_into_bool=false
				return
			if player_into_n==2:
				instance_ai("red",3,3,scene_root.ai_red_points_lib_id[1],false)
				player_into_n=3
				player_into_bool=false
				return
			if player_into_n==3:
				instance_ai("red",4,4,scene_root.ai_red_points_lib_id[2],false)
				player_into_n=4
				player_into_bool=false
				return
			if player_into_n==4:
				instance_ai("red",5,5,scene_root.ai_red_points_lib_id[3],false)
				player_into_n=5
				player_into_bool=false
				return
			if player_into_n==5:
				instance_ai("blue",6,6,scene_root.ai_blue_points_lib_id[1],false)
				player_into_n=6
				player_into_bool=false
				return
			if player_into_n==6:
				instance_ai("blue",7,7,scene_root.ai_blue_points_lib_id[2],false)
				player_into_n=7
				player_into_bool=false
				return
			if player_into_n==7:
				instance_ai("blue",8,8,scene_root.ai_blue_points_lib_id[3],true)
				player_into_n=8
				player_into_bool=false
				return
			
		if self.player_team=="red":
			if player_into_n==0:
				instance_player(scene_root.ai_red_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("blue",2,2,scene_root.ai_blue_points_lib_id[0],false)
				player_into_n=2
				player_into_bool=false
				return
			if player_into_n==2:
				instance_ai("blue",3,3,scene_root.ai_blue_points_lib_id[1],false)
				player_into_n=3
				player_into_bool=false
				return
			if player_into_n==3:
				instance_ai("blue",4,4,scene_root.ai_blue_points_lib_id[2],false)
				player_into_n=4
				player_into_bool=false
				return
			if player_into_n==4:
				instance_ai("blue",5,5,scene_root.ai_blue_points_lib_id[3],false)
				player_into_n=5
				player_into_bool=false
				return
			if player_into_n==5:
				instance_ai("red",6,6,scene_root.ai_red_points_lib_id[1],false)
				player_into_n=6
				player_into_bool=false
				return
			if player_into_n==6:
				instance_ai("red",7,7,scene_root.ai_red_points_lib_id[2],false)
				player_into_n=7
				player_into_bool=false
				return
			if player_into_n==7:
				instance_ai("red",8,8,scene_root.ai_red_points_lib_id[3],true)
				player_into_n=8
				player_into_bool=false
				return
			
	if Main_Menu_Global.setting_bot_num_i==9:#5v5
		if self.player_team=="blue":
			if player_into_n==0:
				instance_player(scene_root.ai_blue_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("red",2,2,scene_root.ai_red_points_lib_id[0],false)
				player_into_n=2
				player_into_bool=false
				return
			if player_into_n==2:
				instance_ai("red",3,3,scene_root.ai_red_points_lib_id[1],false)
				player_into_n=3
				player_into_bool=false
				return
			if player_into_n==3:
				instance_ai("red",4,4,scene_root.ai_red_points_lib_id[2],false)
				player_into_n=4
				player_into_bool=false
				return
			if player_into_n==4:
				instance_ai("red",5,5,scene_root.ai_red_points_lib_id[3],false)
				player_into_n=5
				player_into_bool=false
				return
			if player_into_n==5:
				instance_ai("red",6,6,scene_root.ai_red_points_lib_id[4],false)
				player_into_n=6
				player_into_bool=false
				return
			if player_into_n==6:
				instance_ai("blue",7,7,scene_root.ai_blue_points_lib_id[1],false)
				player_into_n=7
				player_into_bool=false
				return
			if player_into_n==7:
				instance_ai("blue",8,8,scene_root.ai_blue_points_lib_id[2],false)
				player_into_n=8
				player_into_bool=false
				return
			if player_into_n==8:
				instance_ai("blue",9,9,scene_root.ai_blue_points_lib_id[3],false)
				player_into_n=9
				player_into_bool=false
				return
			if player_into_n==9:
				instance_ai("blue",10,10,scene_root.ai_blue_points_lib_id[4],true)
				player_into_n=10
				player_into_bool=false
				return
			
		if self.player_team=="red":
			if player_into_n==0:
				instance_player(scene_root.ai_red_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("blue",2,2,scene_root.ai_blue_points_lib_id[0],false)
				player_into_n=2
				player_into_bool=false
				return
			if player_into_n==2:
				instance_ai("blue",3,3,scene_root.ai_blue_points_lib_id[1],false)
				player_into_n=3
				player_into_bool=false
				return
			if player_into_n==3:
				instance_ai("blue",4,4,scene_root.ai_blue_points_lib_id[2],false)
				player_into_n=4
				player_into_bool=false
				return
			if player_into_n==4:
				instance_ai("blue",5,5,scene_root.ai_blue_points_lib_id[3],false)
				player_into_n=5
				player_into_bool=false
				return
			if player_into_n==5:
				instance_ai("blue",6,6,scene_root.ai_blue_points_lib_id[4],false)
				player_into_n=6
				player_into_bool=false
				return
			if player_into_n==6:
				instance_ai("red",7,7,scene_root.ai_red_points_lib_id[1],false)
				player_into_n=7
				player_into_bool=false
				return
			if player_into_n==7:
				instance_ai("red",8,8,scene_root.ai_red_points_lib_id[2],false)
				player_into_n=8
				player_into_bool=false
				return
			if player_into_n==8:
				instance_ai("red",9,9,scene_root.ai_red_points_lib_id[3],false)
				player_into_n=9
				player_into_bool=false
				return
			if player_into_n==9:
				instance_ai("red",10,10,scene_root.ai_red_points_lib_id[4],true)
				player_into_n=10
				player_into_bool=false
				return
			
	if Main_Menu_Global.setting_bot_num_i==11:#6v6
		if self.player_team=="blue":
			if player_into_n==0:
				instance_player(scene_root.ai_blue_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("red",2,2,scene_root.ai_red_points_lib_id[0],false)
				player_into_n=2
				player_into_bool=false
				return
			if player_into_n==2:
				instance_ai("red",3,3,scene_root.ai_red_points_lib_id[1],false)
				player_into_n=3
				player_into_bool=false
				return
			if player_into_n==3:
				instance_ai("red",4,4,scene_root.ai_red_points_lib_id[2],false)
				player_into_n=4
				player_into_bool=false
				return
			if player_into_n==4:
				instance_ai("red",5,5,scene_root.ai_red_points_lib_id[3],false)
				player_into_n=5
				player_into_bool=false
				return
			if player_into_n==5:
				instance_ai("red",6,6,scene_root.ai_red_points_lib_id[4],false)
				player_into_n=6
				player_into_bool=false
				return
			if player_into_n==6:
				instance_ai("red",7,7,scene_root.ai_red_points_lib_id[5],false)
				player_into_n=7
				player_into_bool=false
				return
			if player_into_n==7:
				instance_ai("blue",8,8,scene_root.ai_blue_points_lib_id[1],false)
				player_into_n=8
				player_into_bool=false
				return
			if player_into_n==8:
				instance_ai("blue",9,9,scene_root.ai_blue_points_lib_id[2],false)
				player_into_n=9
				player_into_bool=false
				return
			if player_into_n==9:
				instance_ai("blue",10,10,scene_root.ai_blue_points_lib_id[3],false)
				player_into_n=10
				player_into_bool=false
				return
			if player_into_n==10:
				instance_ai("blue",11,11,scene_root.ai_blue_points_lib_id[4],false)
				player_into_n=11
				player_into_bool=false
				return
			if player_into_n==11:
				instance_ai("blue",12,12,scene_root.ai_blue_points_lib_id[5],true)
				player_into_n=12
				player_into_bool=false
				return
			
		if self.player_team=="red":
			if player_into_n==0:
				instance_player(scene_root.ai_red_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("blue",2,2,scene_root.ai_blue_points_lib_id[0],false)
				player_into_n=2
				player_into_bool=false
				return
			if player_into_n==2:
				instance_ai("blue",3,3,scene_root.ai_blue_points_lib_id[1],false)
				player_into_n=3
				player_into_bool=false
				return
			if player_into_n==3:
				instance_ai("blue",4,4,scene_root.ai_blue_points_lib_id[2],false)
				player_into_n=4
				player_into_bool=false
				return
			if player_into_n==4:
				instance_ai("blue",5,5,scene_root.ai_blue_points_lib_id[3],false)
				player_into_n=5
				player_into_bool=false
				return
			if player_into_n==5:
				instance_ai("blue",6,6,scene_root.ai_blue_points_lib_id[4],false)
				player_into_n=6
				player_into_bool=false
				return
			if player_into_n==6:
				instance_ai("blue",7,7,scene_root.ai_blue_points_lib_id[5],false)
				player_into_n=7
				player_into_bool=false
				return
			if player_into_n==7:
				instance_ai("red",8,8,scene_root.ai_red_points_lib_id[1],false)
				player_into_n=8
				player_into_bool=false
				return
			if player_into_n==8:
				instance_ai("red",9,9,scene_root.ai_red_points_lib_id[2],false)
				player_into_n=9
				player_into_bool=false
				return
			if player_into_n==9:
				instance_ai("red",10,10,scene_root.ai_red_points_lib_id[3],false)
				player_into_n=10
				player_into_bool=false
				return
			if player_into_n==10:
				instance_ai("red",11,11,scene_root.ai_red_points_lib_id[4],false)
				player_into_n=11
				player_into_bool=false
				return
			if player_into_n==11:
				instance_ai("red",12,12,scene_root.ai_red_points_lib_id[5],true)
				player_into_n=12
				player_into_bool=false
				return
			
	if Main_Menu_Global.setting_bot_num_i==13:#7v7
		if self.player_team=="blue":
			if player_into_n==0:
				instance_player(scene_root.ai_blue_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("red",2,2,scene_root.ai_red_points_lib_id[0],false)
				player_into_n=2
				player_into_bool=false
				return
			if player_into_n==2:
				instance_ai("red",3,3,scene_root.ai_red_points_lib_id[1],false)
				player_into_n=3
				player_into_bool=false
				return
			if player_into_n==3:
				instance_ai("red",4,4,scene_root.ai_red_points_lib_id[2],false)
				player_into_n=4
				player_into_bool=false
				return
			if player_into_n==4:
				instance_ai("red",5,5,scene_root.ai_red_points_lib_id[3],false)
				player_into_n=5
				player_into_bool=false
				return
			if player_into_n==5:
				instance_ai("red",6,6,scene_root.ai_red_points_lib_id[4],false)
				player_into_n=6
				player_into_bool=false
				return
			if player_into_n==6:
				instance_ai("red",7,7,scene_root.ai_red_points_lib_id[5],false)
				player_into_n=7
				player_into_bool=false
				return
			if player_into_n==7:
				instance_ai("red",8,8,scene_root.ai_red_points_lib_id[6],false)
				player_into_n=8
				player_into_bool=false
				return
			if player_into_n==8:
				instance_ai("blue",9,9,scene_root.ai_blue_points_lib_id[1],false)
				player_into_n=9
				player_into_bool=false
				return
			if player_into_n==9:
				instance_ai("blue",10,10,scene_root.ai_blue_points_lib_id[2],false)
				player_into_n=10
				player_into_bool=false
				return
			if player_into_n==10:
				instance_ai("blue",11,11,scene_root.ai_blue_points_lib_id[3],false)
				player_into_n=11
				player_into_bool=false
				return
			if player_into_n==11:
				instance_ai("blue",12,12,scene_root.ai_blue_points_lib_id[4],false)
				player_into_n=12
				player_into_bool=false
				return
			if player_into_n==12:
				instance_ai("blue",13,13,scene_root.ai_blue_points_lib_id[5],false)
				player_into_n=13
				player_into_bool=false
				return
			if player_into_n==13:
				instance_ai("blue",14,14,scene_root.ai_blue_points_lib_id[6],true)
				player_into_n=14
				player_into_bool=false
				return
			
		if self.player_team=="red":
			if player_into_n==0:
				instance_player(scene_root.ai_red_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("blue",2,2,scene_root.ai_blue_points_lib_id[0],false)
				player_into_n=2
				player_into_bool=false
				return
			if player_into_n==2:
				instance_ai("blue",3,3,scene_root.ai_blue_points_lib_id[1],false)
				player_into_n=3
				player_into_bool=false
				return
			if player_into_n==3:
				instance_ai("blue",4,4,scene_root.ai_blue_points_lib_id[2],false)
				player_into_n=4
				player_into_bool=false
				return
			if player_into_n==4:
				instance_ai("blue",5,5,scene_root.ai_blue_points_lib_id[3],false)
				player_into_n=5
				player_into_bool=false
				return
			if player_into_n==5:
				instance_ai("blue",6,6,scene_root.ai_blue_points_lib_id[4],false)
				player_into_n=6
				player_into_bool=false
				return
			if player_into_n==6:
				instance_ai("blue",7,7,scene_root.ai_blue_points_lib_id[5],false)
				player_into_n=7
				player_into_bool=false
				return
			if player_into_n==7:
				instance_ai("blue",8,8,scene_root.ai_blue_points_lib_id[6],false)
				player_into_n=8
				player_into_bool=false
				return
			if player_into_n==8:
				instance_ai("red",9,9,scene_root.ai_red_points_lib_id[1],false)
				player_into_n=9
				player_into_bool=false
				return
			if player_into_n==9:
				instance_ai("red",10,10,scene_root.ai_red_points_lib_id[2],false)
				player_into_n=10
				player_into_bool=false
				return
			if player_into_n==10:
				instance_ai("red",11,11,scene_root.ai_red_points_lib_id[3],false)
				player_into_n=11
				player_into_bool=false
				return
			if player_into_n==11:
				instance_ai("red",12,12,scene_root.ai_red_points_lib_id[4],false)
				player_into_n=12
				player_into_bool=false
				return
			if player_into_n==12:
				instance_ai("red",13,13,scene_root.ai_red_points_lib_id[5],false)
				player_into_n=13
				player_into_bool=false
				return
			if player_into_n==13:
				instance_ai("red",13,13,scene_root.ai_red_points_lib_id[6],true)
				player_into_n=14
				player_into_bool=false
				return
				
	if Main_Menu_Global.setting_bot_num_i==15:#8v8
		if self.player_team=="blue":
			if player_into_n==0:
				instance_player(scene_root.ai_blue_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("red",2,2,scene_root.ai_red_points_lib_id[0],false)
				player_into_n=2
				player_into_bool=false
				return
			if player_into_n==2:
				instance_ai("red",3,3,scene_root.ai_red_points_lib_id[1],false)
				player_into_n=3
				player_into_bool=false
				return
			if player_into_n==3:
				instance_ai("red",4,4,scene_root.ai_red_points_lib_id[2],false)
				player_into_n=4
				player_into_bool=false
				return
			if player_into_n==4:
				instance_ai("red",5,5,scene_root.ai_red_points_lib_id[3],false)
				player_into_n=5
				player_into_bool=false
				return
			if player_into_n==5:
				instance_ai("red",6,6,scene_root.ai_red_points_lib_id[4],false)
				player_into_n=6
				player_into_bool=false
				return
			if player_into_n==6:
				instance_ai("red",7,7,scene_root.ai_red_points_lib_id[5],false)
				player_into_n=7
				player_into_bool=false
				return
			if player_into_n==7:
				instance_ai("red",8,8,scene_root.ai_red_points_lib_id[6],false)
				player_into_n=8
				player_into_bool=false
				return
			if player_into_n==8:
				instance_ai("red",9,9,scene_root.ai_red_points_lib_id[7],false)
				player_into_n=9
				player_into_bool=false
				return
			if player_into_n==9:
				instance_ai("blue",10,10,scene_root.ai_blue_points_lib_id[1],false)
				player_into_n=10
				player_into_bool=false
				return
			if player_into_n==10:
				instance_ai("blue",11,11,scene_root.ai_blue_points_lib_id[2],false)
				player_into_n=11
				player_into_bool=false
				return
			if player_into_n==11:
				instance_ai("blue",12,12,scene_root.ai_blue_points_lib_id[3],false)
				player_into_n=12
				player_into_bool=false
				return
			if player_into_n==12:
				instance_ai("blue",13,13,scene_root.ai_blue_points_lib_id[4],false)
				player_into_n=13
				player_into_bool=false
				return
			if player_into_n==13:
				instance_ai("blue",14,14,scene_root.ai_blue_points_lib_id[5],false)
				player_into_n=14
				player_into_bool=false
				return
			if player_into_n==14:
				instance_ai("blue",15,15,scene_root.ai_blue_points_lib_id[6],false)
				player_into_n=15
				player_into_bool=false
				return
			if player_into_n==15:
				instance_ai("blue",16,16,scene_root.ai_blue_points_lib_id[7],true)
				player_into_n=16
				player_into_bool=false
				return
		if self.player_team=="red":
			if player_into_n==0:
				instance_player(scene_root.ai_red_points_lib_id[0],false)
				player_into_n=1
				player_into_bool=false
				return
			if player_into_n==1:
				instance_ai("blue",2,2,scene_root.ai_blue_points_lib_id[0],false)
				player_into_n=2
				player_into_bool=false
				return
			if player_into_n==2:
				instance_ai("blue",3,3,scene_root.ai_blue_points_lib_id[1],false)
				player_into_n=3
				player_into_bool=false
				return
			if player_into_n==3:
				instance_ai("blue",4,4,scene_root.ai_blue_points_lib_id[2],false)
				player_into_n=4
				player_into_bool=false
				return
			if player_into_n==4:
				instance_ai("blue",5,5,scene_root.ai_blue_points_lib_id[3],false)
				player_into_n=5
				player_into_bool=false
				return
			if player_into_n==5:
				instance_ai("blue",6,6,scene_root.ai_blue_points_lib_id[4],false)
				player_into_n=6
				player_into_bool=false
				return
			if player_into_n==6:
				instance_ai("blue",7,7,scene_root.ai_blue_points_lib_id[5],false)
				player_into_n=7
				player_into_bool=false
				return
			if player_into_n==7:
				instance_ai("blue",8,8,scene_root.ai_blue_points_lib_id[6],false)
				player_into_n=8
				player_into_bool=false
				return
			if player_into_n==8:
				instance_ai("blue",9,9,scene_root.ai_blue_points_lib_id[7],false)
				player_into_n=9
				player_into_bool=false
				return
			if player_into_n==9:
				instance_ai("red",10,10,scene_root.ai_red_points_lib_id[1],false)
				player_into_n=10
				player_into_bool=false
				return
			if player_into_n==10:
				instance_ai("red",11,11,scene_root.ai_red_points_lib_id[2],false)
				player_into_n=11
				player_into_bool=false
				return
			if player_into_n==11:
				instance_ai("red",12,12,scene_root.ai_red_points_lib_id[3],false)
				player_into_n=12
				player_into_bool=false
				return
			if player_into_n==12:
				instance_ai("red",13,13,scene_root.ai_red_points_lib_id[4],false)
				player_into_n=13
				player_into_bool=false
				return
			if player_into_n==13:
				instance_ai("red",14,14,scene_root.ai_red_points_lib_id[5],false)
				player_into_n=14
				player_into_bool=false
				return
			if player_into_n==14:
				instance_ai("red",15,15,scene_root.ai_red_points_lib_id[6],false)
				player_into_n=15
				player_into_bool=false
				return
			if player_into_n==15:
				instance_ai("red",16,16,scene_root.ai_red_points_lib_id[7],true)
				player_into_n=16
				player_into_bool=false
				return
			
func instance_player(t_pos,final):
	if scene_root.mode=="team_death_match":
		var player_new=preload("res://assets/player/prefab/hero_player_3rd.tscn")
		var pn=player_new.instantiate()
		if self.player_team=="blue":
			if(scene_root.ai_blue_points_lib[str(t_pos)])==true:
				pn.charactor_color="blue"
				pn.player_point_id=1
				pn.user_name=user_name
				pn.player_health=100
				pn.view_mode_player=0
				pn.player_type=current_player_type
				scene_root.players_points[pn.player_point_id-1].add_child(pn)
				scene_root.players.append(pn)
				
				pn.TDM_team="blue"
				pn.global_position=scene_root.players_blue_points[t_pos-1].global_position
				pn.global_rotation_degrees=scene_root.players_blue_points[t_pos-1].global_rotation_degrees
				scene_root.user_player=pn
				
				
				
				scene_root.players_name_blue.append(pn.user_name)
				if final==false:
					scene_root.score_board_ready=false
				else:
					scene_root.score_board_ready=true
				return
				
		if self.player_team=="red":
			if(scene_root.ai_red_points_lib[str(t_pos)])==true:
				pn.charactor_color="red"
				pn.player_point_id=1
				pn.user_name=user_name
				pn.player_health=100
				pn.view_mode_player=0
				pn.player_type=current_player_type
				scene_root.players_points[pn.player_point_id-1].add_child(pn)
				scene_root.players.append(pn)
				
				pn.TDM_team="red"
				pn.global_position=scene_root.players_red_points[t_pos-1].global_position
				pn.global_rotation_degrees=scene_root.players_red_points[t_pos-1].global_rotation_degrees
				scene_root.user_player=pn
				
				
				
				scene_root.players_name_red.append(pn.user_name)
				if final==false:
					scene_root.score_board_ready=false
				else:
					scene_root.score_board_ready=true
				return
				
func instance_ai(color,point_id,bot_id,t_pos,final):
	if scene_root.mode=="team_death_match":
		var player_new=preload("res://assets/player/AI/prefab/hero_AI.tscn")
		var pn=player_new.instantiate()
		if color=="blue":
			if(scene_root.ai_blue_points_lib[str(t_pos)])==true:
				pn.player_point_id=point_id
				pn.charactor_color="blue"
				pn.user_name="bot"+str(bot_id)
				pn.player_health=100
				pn.TDM_team="blue"
				scene_root.players_points[pn.player_point_id-1].add_child(pn)
				pn.global_position=scene_root.players_blue_points[t_pos-1].global_position
				pn.global_rotation_degrees=scene_root.players_blue_points[t_pos-1].global_rotation_degrees
				scene_root.players.append(pn)
				
				
				
				scene_root.players_name_blue.append(pn.user_name)
				if final==false:
					scene_root.score_board_ready=false
				else:
					scene_root.score_board_ready=true
				return
				
		if color=="red":
			if(scene_root.ai_red_points_lib[str(t_pos)])==true:
				pn.player_point_id=point_id
				pn.charactor_color="red"
				pn.user_name="bot"+str(bot_id)
				pn.player_health=100
				pn.TDM_team="red"
				scene_root.players_points[pn.player_point_id-1].add_child(pn)
				pn.global_position=scene_root.players_red_points[t_pos-1].global_position
				pn.global_rotation_degrees=scene_root.players_red_points[t_pos-1].global_rotation_degrees
				scene_root.players.append(pn)
				
				
				
				scene_root.players_name_red.append(pn.user_name)
				if final==false:
					scene_root.score_board_ready=false
				else:
					scene_root.score_board_ready=true
				return
				
		
@onready var team_select_node=$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/HBoxContainer_team
func _on_class_1_gui_input(event: InputEvent) -> void:
	if $CanvasLayer.visible==true:
		if $CanvasLayer/weapons_change_class.visible==true:
			if event is InputEventMouseButton and event.pressed:
					match event.button_index:
						MOUSE_BUTTON_LEFT:
							current_player_type="rifle_man"
							team_select_node.visible=true

func _on_class_2_gui_input(event: InputEvent) -> void:
	if $CanvasLayer.visible==true:
		if $CanvasLayer/weapons_change_class.visible==true:
			if event is InputEventMouseButton and event.pressed:
					match event.button_index:
						MOUSE_BUTTON_LEFT:
							current_player_type="smg_man"
							team_select_node.visible=true

func _on_class_3_gui_input(event: InputEvent) -> void:
	if $CanvasLayer.visible==true:
		if $CanvasLayer/weapons_change_class.visible==true:
			if event is InputEventMouseButton and event.pressed:
					match event.button_index:
						MOUSE_BUTTON_LEFT:
							current_player_type="shotgun_man"
							team_select_node.visible=true

func _on_class_4_gui_input(event: InputEvent) -> void:
	if $CanvasLayer.visible==true:
		if $CanvasLayer/weapons_change_class.visible==true:
			if event is InputEventMouseButton and event.pressed:
					match event.button_index:
						MOUSE_BUTTON_LEFT:
							current_player_type="sniper_man"
							team_select_node.visible=true

func _on_class_5_gui_input(event: InputEvent) -> void:
	if $CanvasLayer.visible==true:
		if $CanvasLayer/weapons_change_class.visible==true:
			if event is InputEventMouseButton and event.pressed:
					match event.button_index:
						MOUSE_BUTTON_LEFT:
							current_player_type="machine_gun_man"
							team_select_node.visible=true
var player_into_timer=0
func _physics_process(delta: float) -> void:
	#print(player_into_n)
	if player_into_bool==true:
		player_into_scene()
	
	if player_into_bool==false:
		if player_into_n<=Main_Menu_Global.setting_bot_num_i:
			if player_into_n>0:
				player_into_timer+=delta
			if player_into_timer>0.4:
				player_into_bool=true
				player_into_timer=0
		else:
			player_into_bool=false
	if current_player_type=="rifle_man":
		$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class1.modulate=Color(0,0.7,0.9)
		if class2_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class2.modulate=Color(1,1,1,1)
		if class3_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class3.modulate=Color(1,1,1,1)
		if class4_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class4.modulate=Color(1,1,1,1)
		if class5_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class5.modulate=Color(1,1,1,1)
	if current_player_type=="smg_man":
		if class1_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class1.modulate=Color(1,1,1,1)
		$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class2.modulate=Color(0,0.7,0.9)
		if class3_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class3.modulate=Color(1,1,1,1)
		if class4_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class4.modulate=Color(1,1,1,1)
		if class5_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class5.modulate=Color(1,1,1,1)
	if current_player_type=="shotgun_man":
		if class1_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class1.modulate=Color(1,1,1,1)
		if class2_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class2.modulate=Color(1,1,1,1)
		$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class3.modulate=Color(0,0.7,0.9)
		if class4_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class4.modulate=Color(1,1,1,1)
		if class5_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class5.modulate=Color(1,1,1,1)
	if current_player_type=="sniper_man":
		if class1_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class1.modulate=Color(1,1,1,1)
		if class2_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class2.modulate=Color(1,1,1,1)
		if class3_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class3.modulate=Color(1,1,1,1)
		$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class4.modulate=Color(0,0.7,0.9)
		if class5_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class5.modulate=Color(1,1,1,1)
	if current_player_type=="machine_gun_man":
		if class1_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class1.modulate=Color(1,1,1,1)
		if class2_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class2.modulate=Color(1,1,1,1)
		if class3_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class3.modulate=Color(1,1,1,1)
		if class4_enter_bool==false:
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class4.modulate=Color(1,1,1,1)
		$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class5.modulate=Color(0,0.7,0.9)

#weapon_class
var class1_enter_bool=false
var class2_enter_bool=false
var class3_enter_bool=false
var class4_enter_bool=false
var class5_enter_bool=false
func _on_class_1_mouse_entered() -> void:
	if $CanvasLayer.visible==true:
		$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class1.modulate=Color(0,0.7,0.9)
		class1_enter_bool=true
		class2_enter_bool=false
		class3_enter_bool=false
		class4_enter_bool=false
		class5_enter_bool=false


func _on_class_1_mouse_exited() -> void:
	if $CanvasLayer.visible==true:
		if current_player_type!="rifle_man":
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class1.modulate=Color(1,1,1,1)
		class1_enter_bool=false


func _on_class_2_mouse_entered() -> void:
	if $CanvasLayer.visible==true:
		$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class2.modulate=Color(0,0.7,0.9)
		class1_enter_bool=false
		class2_enter_bool=true
		class3_enter_bool=false
		class4_enter_bool=false
		class5_enter_bool=false

func _on_class_2_mouse_exited() -> void:
	if $CanvasLayer.visible==true:
		if current_player_type!="smg_man":
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class2.modulate=Color(1,1,1,1)
		class2_enter_bool=false


func _on_class_3_mouse_entered() -> void:
	if $CanvasLayer.visible==true:
		$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class3.modulate=Color(0,0.7,0.9)
		class1_enter_bool=false
		class2_enter_bool=false
		class3_enter_bool=true
		class4_enter_bool=false
		class5_enter_bool=false

func _on_class_3_mouse_exited() -> void:
	if $CanvasLayer.visible==true:
		if current_player_type!="shotgun_man":
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class3.modulate=Color(1,1,1,1)
		class3_enter_bool=false


func _on_class_4_mouse_entered() -> void:
	if $CanvasLayer.visible==true:
		$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class4.modulate=Color(0,0.7,0.9)
		class1_enter_bool=false
		class2_enter_bool=false
		class3_enter_bool=false
		class4_enter_bool=true
		class5_enter_bool=false

func _on_class_4_mouse_exited() -> void:
	if $CanvasLayer.visible==true:
		if current_player_type!="sniper_man":
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class4.modulate=Color(1,1,1,1)
		class4_enter_bool=false


func _on_class_5_mouse_entered() -> void:
	if $CanvasLayer.visible==true:
		$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class5.modulate=Color(0,0.7,0.9)
		class1_enter_bool=false
		class2_enter_bool=false
		class3_enter_bool=false
		class4_enter_bool=false
		class5_enter_bool=true

func _on_class_5_mouse_exited() -> void:
	if $CanvasLayer.visible==true:
		if current_player_type!="machine_gun_man":
			$CanvasLayer/weapons_change_class/MarginContainer/VBoxContainer/class5.modulate=Color(1,1,1,1)
		class5_enter_bool=false
#weapon_class


func _on_button_blue_team_button_down() -> void:
	if current_player_type=="rifle_man":
		UserData.favorite_data_rifle+=1
	elif current_player_type=="smg_man":
		UserData.favorite_data_smg+=1
	elif current_player_type=="sniper_man":
		UserData.favorite_data_sniper+=1
	elif current_player_type=="shotgun_man":
		UserData.favorite_data_shotgun+=1
	elif current_player_type=="machine_gun_man":
		UserData.favorite_data_machine_gun+=1
	if $CanvasLayer.visible==true:
		if team_select_node.visible==true:
			player_team="blue"
			scene_root.player_ready=true
			#player_into_scene()
			#queue_free()
			$CanvasLayer.visible=false
			$Camera3D.current=false
			player_into_bool=true


func _on_button_red_team_button_down() -> void:
	if current_player_type=="rifle_man":
		UserData.favorite_data_rifle+=1
	if current_player_type=="smg_man":
		UserData.favorite_data_smg+=1
	if current_player_type=="sniper_man":
		UserData.favorite_data_sniper+=1
	if current_player_type=="shotgun_man":
		UserData.favorite_data_shotgun+=1
	if current_player_type=="machine_gun_man":
		UserData.favorite_data_machine_gun+=1
	if $CanvasLayer.visible==true:
		if team_select_node.visible==true:
			player_team="red"
			scene_root.player_ready=true
			#player_into_scene()
			#queue_free()
			$CanvasLayer.visible=false
			$Camera3D.current=false
			player_into_bool=true
