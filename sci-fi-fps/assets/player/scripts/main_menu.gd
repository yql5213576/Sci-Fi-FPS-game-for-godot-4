extends Control


@onready var blood_strike_map_TDM:String="res://assets/scenes/main_game_scenes/Team_Death_Match/blood_strike/blood_strike_team_death_match.tscn"
@onready var blood_strike_map_FFA:String="res://assets/scenes/main_game_scenes/Free_For_All/blood_strike/blood_strike_free_for_all.tscn"

@onready var space_station_simple_map_TDM:String="res://assets/scenes/main_game_scenes/Team_Death_Match/space_station_simple/space_station_simple_team_death_match.tscn"
@onready var space_station_simple_map_FFA:String="res://assets/scenes/main_game_scenes/Free_For_All/space_station_simple/space_station_simple_free_for_all.tscn"

@onready var snow_basin_map_TDM:String="res://assets/scenes/main_game_scenes/Team_Death_Match/snow_basin/snow_basin_team_death_match.tscn"
@onready var snow_basin_map_FFA:String="res://assets/scenes/main_game_scenes/Free_For_All/snow_basin/snow_basin_free_for_all.tscn"

@onready var office_map_TDM:String="res://assets/scenes/main_game_scenes/Team_Death_Match/office/office_team_death_match.tscn"
@onready var office_map_FFA:String="res://assets/scenes/main_game_scenes/Free_For_All/office/office_free_for_all.tscn"


func _ready() -> void:
	if FileAccess.file_exists("user://SaveUser0.3.data"):
		UserData.user_data_load()
	if FileAccess.file_exists("user://SaveOptions0.4.data"):
		UserData.user_options_load()
		apply_options()
	else:
		UserData.user_options_save()
		apply_options()
	reslution_text_default=str(UserData.reslution_vec_data_default.x)+"-"+str(UserData.reslution_vec_data_default.y)
	#resolution_button.text=reslution_text_default
	if UserData.user_name_data==""&&FileAccess.file_exists("user://SaveUser0.3.data")==false:
		$user_first_login.visible=true
	else:
		$user_first_login.visible=false
	$TextureRect.modulate=Color(1,1,1,0)
	$Control_button_menu.visible=true
	$game_load.visible=false
	$quit_verify.visible=false
	$loading_progress_bar.visible=false
	$user_career.visible=false
	$user_options.visible=false
	about_the_game_menu.visible=false
	
	


@onready var map_texture_node:Node=$game_load/PanelContainer/MarginContainer/HBoxContainer/TextureRect

@onready var blood_strike_map_icon:Resource=load("res://assets/scenes/map_icons/blood_strike_icon.png")
@onready var space_station_simple_icon:Resource=load("res://assets/scenes/map_icons/space_station_simple_icon.png")
@onready var snow_basin_icon:Resource=load("res://assets/scenes/map_icons/snow_basin_icon.png")
@onready var office_icon:Resource=load("res://assets/scenes/map_icons/office_icon.png")

@onready var loading_ProgressBar:Node=$loading_progress_bar/MarginContainer/VBoxContainer/loading_ProgressBar/ProgressBar
func _process(delta: float) -> void:
	if $user_options.visible==false:
		user_data_text_control()
	#print(DisplayServer.screen_get_size())
	Input.set_mouse_mode(0)
	if get_tree().paused==true:
		get_tree().paused=false
	Main_Menu_Global.map=map_label_text.text
	Main_Menu_Global.mode=mode_label_text.text
	Main_Menu_Global.setting_bot_num=button_bot_num_node.text
	Main_Menu_Global.setting_difficulty=button_difficulty_node.text
	Main_Menu_Global.setting_game_time=button_game_time_node.text
	Main_Menu_Global.setting_max_kills=button_max_kill_node.text
	Main_Menu_Global.setting_ai_grenade=button_ai_grenade_node.text
	Main_Menu_Global.setting_ai_sword=button_ai_sword_node.text
	
	mouse_range_label_node.text=str(mouse_range_node.value)

	crosshair_label_node.text=str(crosshair_node.value)
	lod_label_node.text=str(lod_node.value)
	render_resolution_label_node.text=str(render_resolution_node.value)
	
	if map_label_text.text=="Blood Strike":
		map_texture_node.texture=blood_strike_map_icon
	if map_label_text.text=="Space Station Simple":
		map_texture_node.texture=space_station_simple_icon
	if map_label_text.text=="Snow Basin":
		map_texture_node.texture=snow_basin_icon
	if map_label_text.text=="Office":
		map_texture_node.texture=office_icon
	
	if game_start_loading==true:
		$Control_button_menu.visible=false
		$game_load.visible=false
		$quit_verify.visible=false
		$loading_progress_bar.visible=true
		if map_label_text.text=="Blood Strike":
			if mode_label_text.text=="Team Death Match":
				var progress:Array[float]=[]
				ResourceLoader.load_threaded_request(blood_strike_map_TDM)
				ResourceLoader.load_threaded_get_status(blood_strike_map_TDM,progress)
				loading_ProgressBar.value=progress[0]*100
				if progress[0]==1:
					var packed_scene:Resource=ResourceLoader.load_threaded_get(blood_strike_map_TDM)
					get_tree().change_scene_to_packed(packed_scene)
			if mode_label_text.text=="Free For All":
				var progress:Array[float]=[]
				ResourceLoader.load_threaded_request(blood_strike_map_FFA)
				ResourceLoader.load_threaded_get_status(blood_strike_map_FFA,progress)
				loading_ProgressBar.value=progress[0]*100
				if progress[0]==1:
					var packed_scene:Resource=ResourceLoader.load_threaded_get(blood_strike_map_FFA)
					get_tree().change_scene_to_packed(packed_scene)


		if map_label_text.text=="Space Station Simple":
			if mode_label_text.text=="Team Death Match":
				var progress:Array[float]=[]
				ResourceLoader.load_threaded_request(space_station_simple_map_TDM)
				ResourceLoader.load_threaded_get_status(space_station_simple_map_TDM,progress)
				loading_ProgressBar.value=progress[0]*100
				if progress[0]==1:
					var packed_scene:Resource=ResourceLoader.load_threaded_get(space_station_simple_map_TDM)
					get_tree().change_scene_to_packed(packed_scene)
			if mode_label_text.text=="Free For All":
				var progress:Array[float]=[]
				ResourceLoader.load_threaded_request(space_station_simple_map_FFA)
				ResourceLoader.load_threaded_get_status(space_station_simple_map_FFA,progress)
				loading_ProgressBar.value=progress[0]*100
				if progress[0]==1:
					var packed_scene:Resource=ResourceLoader.load_threaded_get(space_station_simple_map_FFA)
					get_tree().change_scene_to_packed(packed_scene)
					
		if map_label_text.text=="Snow Basin":
			if mode_label_text.text=="Team Death Match":
				var progress:Array[float]=[]
				ResourceLoader.load_threaded_request(snow_basin_map_TDM)
				ResourceLoader.load_threaded_get_status(snow_basin_map_TDM,progress)
				loading_ProgressBar.value=progress[0]*100
				if progress[0]==1:
					var packed_scene:Resource=ResourceLoader.load_threaded_get(snow_basin_map_TDM)
					get_tree().change_scene_to_packed(packed_scene)
			if mode_label_text.text=="Free For All":
				var progress:Array[float]=[]
				ResourceLoader.load_threaded_request(snow_basin_map_FFA)
				ResourceLoader.load_threaded_get_status(snow_basin_map_FFA,progress)
				loading_ProgressBar.value=progress[0]*100
				if progress[0]==1:
					var packed_scene:Resource=ResourceLoader.load_threaded_get(snow_basin_map_FFA)
					get_tree().change_scene_to_packed(packed_scene)
					
		if map_label_text.text=="Office":
			if mode_label_text.text=="Team Death Match":
				var progress:Array[float]=[]
				ResourceLoader.load_threaded_request(office_map_TDM)
				ResourceLoader.load_threaded_get_status(office_map_TDM,progress)
				loading_ProgressBar.value=progress[0]*100
				if progress[0]==1:
					var packed_scene:Resource=ResourceLoader.load_threaded_get(office_map_TDM)
					get_tree().change_scene_to_packed(packed_scene)
			if mode_label_text.text=="Free For All":
				var progress:Array[float]=[]
				ResourceLoader.load_threaded_request(office_map_FFA)
				ResourceLoader.load_threaded_get_status(office_map_FFA,progress)
				loading_ProgressBar.value=progress[0]*100
				if progress[0]==1:
					var packed_scene:Resource=ResourceLoader.load_threaded_get(office_map_FFA)
					get_tree().change_scene_to_packed(packed_scene)
					
#Control_button_menu
func _on_texture_button_start_pressed() -> void:
	$main_menu_button_press_audio.play()
	if $Control_button_menu.visible==true&&$user_first_login.visible==false:
		if $game_load.visible==false:
			$game_load.visible=true
			$Control_button_menu.visible=false


func _on_texture_button_load_pressed() -> void:
	$main_menu_button_press_audio.play()
	if $Control_button_menu.visible==true&&$user_first_login.visible==false:
		if $user_career.visible==false:
			$user_career.visible=true

func _on_texture_button_options_pressed() -> void:
	$main_menu_button_press_audio.play()
	if $Control_button_menu.visible==true&&$user_first_login.visible==false:
		if $user_options.visible==false:
			$user_options.visible=true

func _on_texture_button_quit_pressed() -> void:
	$main_menu_button_press_audio.play()
	if $Control_button_menu.visible==true&&$user_first_login.visible==false:
		if $quit_verify.visible==false:
			$quit_verify.visible=true
#Control_button_menu



#quit_verify

func _on_yes_button_button_down() -> void:
	$user_manu_button_press_audio.play()
	if $quit_verify.visible==true:
		$quit_verify.visible=false
		get_tree().quit()

func _on_no_button_button_down() -> void:
	$user_manu_button_press_audio.play()
	if $quit_verify.visible==true:
		if $quit_verify.visible==true:
			$quit_verify.visible=false
#quit_verify





@onready var map_label_text:Node=$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer_Metric/HBox_Map/mp
@onready var mode_label_text:Node=$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer_Metric/HBox_Mode/md



#game_load
func _on_cancel_button_button_down() -> void:
	$user_manu_button_press_audio.play()
	if $game_load.visible==true:
		$game_load.visible=false
		$Control_button_menu.visible=true

#maps
func _on_button_blood_strike_button_down() -> void:
	$user_manu_button_press_audio.play()
	if $game_load.visible==true:
		map_label_text.text="Blood Strike"


func _on_button_space_station_simple_button_down() -> void:
	$user_manu_button_press_audio.play()
	if $game_load.visible==true:
		map_label_text.text="Space Station Simple"

func _on_button_snow_basin_button_down() -> void:
	$user_manu_button_press_audio.play()
	if $game_load.visible==true:
		map_label_text.text="Snow Basin"

func _on_button_office_button_down() -> void:
	$user_manu_button_press_audio.play()
	if $game_load.visible==true:
		map_label_text.text="Office"
#maps

#mode
func _on_team_death_match_button_down() -> void:
	$user_manu_button_press_audio.play()
	if $game_load.visible==true:
		mode_label_text.text="Team Death Match"


func _on_free_for_all_button_down() -> void:
	$user_manu_button_press_audio.play()
	if $game_load.visible==true:
		mode_label_text.text="Free For All"
#mode

#setting
@onready var button_bot_num_node:Node=$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_bot_num/Button_bot_num
@onready var button_difficulty_node:Node=$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_difficulty/Button_difficulty
@onready var button_game_time_node:Node=$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_game_time/Button_game_time
@onready var button_max_kill_node:Node=$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_max_kills/Button_max_kills
@onready var button_ai_grenade_node:Node=$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_ai_grenade/Button_ai_grenade
@onready var button_ai_sword_node:Node=$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_ai_sword/Button_ai_sword
func _on_button_bot_num_button_down() -> void:
	$user_manu_button_press_audio.play()
	if $game_load.visible==true:
		if button_bot_num_node.text=="0":
			button_bot_num_node.text="1"
			return
		if button_bot_num_node.text=="1":
			button_bot_num_node.text="3"
			return
		if button_bot_num_node.text=="3":
			button_bot_num_node.text="5"
			return
		if button_bot_num_node.text=="5":
			button_bot_num_node.text="7"
			return
		if button_bot_num_node.text=="7":
			button_bot_num_node.text="9"
			return
		if button_bot_num_node.text=="9":
			button_bot_num_node.text="11"
			return
		if button_bot_num_node.text=="11":
			button_bot_num_node.text="13"
			return
		if button_bot_num_node.text=="13":
			button_bot_num_node.text="15"
			return
		if button_bot_num_node.text=="15":
			button_bot_num_node.text="0"
			return


func _on_button_difficulty_button_down() -> void:
	$user_manu_button_press_audio.play()
	if $game_load.visible==true:
		if button_difficulty_node.text=="easy":
			button_difficulty_node.text="medium"
			return
		if button_difficulty_node.text=="medium":
			button_difficulty_node.text="hard"
			return
		if button_difficulty_node.text=="hard":
			button_difficulty_node.text="easy"
			return


func _on_button_game_time_button_down() -> void:#0,5,10,30,60
	$user_manu_button_press_audio.play()
	if $game_load.visible==true:
		if button_game_time_node.text=="0":
			button_game_time_node.text="1"
			return
		if button_game_time_node.text=="1":
			button_game_time_node.text="5"
			return
		if button_game_time_node.text=="5":
			button_game_time_node.text="10"
			return
		if button_game_time_node.text=="10":
			button_game_time_node.text="30"
			return
		if button_game_time_node.text=="30":
			button_game_time_node.text="60"
			return
		if button_game_time_node.text=="60":
			button_game_time_node.text="0"
			return


func _on_button_max_kills_button_down() -> void:#10,30,60,100,150,200,250,300
	$user_manu_button_press_audio.play()
	if $game_load.visible==true:
		if button_max_kill_node.text=="10":
			button_max_kill_node.text="30"
			return
		if button_max_kill_node.text=="30":
			button_max_kill_node.text="60"
			return
		if button_max_kill_node.text=="60":
			button_max_kill_node.text="100"
			return
		if button_max_kill_node.text=="100":
			button_max_kill_node.text="150"
			return
		if button_max_kill_node.text=="150":
			button_max_kill_node.text="200"
			return
		if button_max_kill_node.text=="200":
			button_max_kill_node.text="250"
			return
		if button_max_kill_node.text=="250":
			button_max_kill_node.text="300"
			return
		if button_max_kill_node.text=="300":
			button_max_kill_node.text="10"
			return

func _on_button_ai_grenade_button_down() -> void:
	$user_manu_button_press_audio.play()
	if button_ai_grenade_node.text=="open":
		button_ai_grenade_node.text="close"
	elif button_ai_grenade_node.text=="close":
		button_ai_grenade_node.text="open"


func _on_button_ai_sword_button_down() -> void:
	$user_manu_button_press_audio.play()
	if button_ai_sword_node.text=="open":
		button_ai_sword_node.text="close"
	elif button_ai_sword_node.text=="close":
		button_ai_sword_node.text="open"
	


#setting

var game_start_loading:bool=false
#game_start
func _on_start_button_button_down() -> void:
	$user_manu_button_press_audio.play()
	if $game_load.visible==true:
		game_start_loading=true
#game_start

#game_load


#user_career
#user_name
@onready var name_line_edit:Node=$user_first_login/MarginContainer/VBoxContainer/HBoxContainer_line_edit/LineEdit
@onready var user_data:Node=$user_career



func _on_button_ok_button_down() -> void:
	$main_menu_button_press_audio.play()
	if $user_first_login.visible==true:
		if name_line_edit.text!="":
			UserData.user_name_data=name_line_edit.text
			UserData.user_data_save()
			$user_first_login.visible=false

@onready var user_name_text_label:Node=$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer/user_name2
@onready var kills_text_label:Node=$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer2/kills2
@onready var death_text_label:Node=$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer3/death2
@onready var favorite_text_label:Node=$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer4/favorite2
@onready var rank_text_label:Node=$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer5/rank2
@onready var battles_text_label:Node=$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer6/battles2


func _on_data_folder_button_down() -> void:
	$user_manu_button_press_audio.play()
	OS.shell_open(ProjectSettings.globalize_path("user://"))


func _on_exit_button_down() -> void:
	$user_manu_button_press_audio.play()
	if $user_career.visible==true:
		$user_career.visible=false

func user_data_text_control():
	user_name_text_label.text=UserData.user_name_data
	kills_text_label.text=UserData.kills_data
	death_text_label.text=UserData.death_data
	favorite_text_label.text=UserData.favorite_data
	rank_text_label.text=UserData.rank_data
	battles_text_label.text=UserData.battles_data
	
	
	resolution_button.text=str(int(UserData.reslution_vec_data.x))+"-"+str(int(UserData.reslution_vec_data.y))
	if UserData.vsync_data==DisplayServer.VSYNC_ENABLED:
		vsync_button.text="open"
	elif UserData.vsync_data==DisplayServer.VSYNC_DISABLED:
		vsync_button.text="close"
	
	if UserData.anti_aliasing_msaa_data==Viewport.MSAA_2X:
		anti_aliasing_msaa_button.text="2x"
	elif UserData.anti_aliasing_msaa_data==Viewport.MSAA_4X:
		anti_aliasing_msaa_button.text="4x"
	elif UserData.anti_aliasing_msaa_data==Viewport.MSAA_8X:
		anti_aliasing_msaa_button.text="8x"
	if UserData.ssao_data==true:
		ssao_button.text="open"
	else:
		ssao_button.text="close"
	if UserData.ssil_data==true:
		ssil_button.text="open"
	else:
		ssil_button.text="close"
	if UserData.sdfgi_data==true:
		sdfgi_button.text="open"
	else:
		sdfgi_button.text="close"
	if UserData.voxelgi_data==true:
		voxelgi_button.text="open"
	else:
		voxelgi_button.text="close"
	if UserData.glow_data==true:
		glow_button.text="open"
	else:
		glow_button.text="close"
	if UserData.volumetric_fog_data==true:
		volumetric_fog_button.text="open"
	else:
		volumetric_fog_button.text="close"
	if UserData.ssr_data==true:
		ssr_button.text="open"
	else:
		ssr_button.text="close"
	#language
	
	language_button.text=UserData.language_data
	if UserData.language_data=="chinese":
		$quit_verify/MarginContainer/VBoxContainer/HBoxContainer2/Label_cn.visible=true
		$user_first_login/MarginContainer/VBoxContainer/Input_user_name_alert_cn.visible=true
		$change_name/MarginContainer/VBoxContainer/Input_user_name_alert_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer/resolution_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer10/vsync_cn.visible=true
		$"user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer8/anti-aliasing_msaa_cn".visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer2/ssao_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer3/ssil_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer4/sdfgi_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer18/ssr_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer13/VoxelGI_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer5/glow_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer6/volumetric_fog_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer7/grass_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer11/mouse_sevsitivity_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer12/crosshair_size_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer14/level_of_detail_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer15/render_resolution_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer16/language_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer17/texture_size_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer/about1_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer2/about2_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer3/about3_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer4/about4_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer5/about5_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer6/about6_cn.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer7/about7_cn.visible=true
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_start/start_cn.visible=true
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_load/data_cn.visible=true
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_options/options_cn.visible=true
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_quit/quit_cn.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer_Metric/HBox_Mode/modes_cn.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer_Metric/HBox_Map/maps_cn.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_bot_num/bot_num_cn.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_difficulty/difficulty_cn.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_game_time/game_time_cn.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_max_kills/max_kills_cn.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_ai_grenade/ai_grenade_cn.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_ai_sword/ai_sword_cn.visible=true
		
		
		$quit_verify/MarginContainer/VBoxContainer/HBoxContainer2/Label_en.visible=false
		$user_first_login/MarginContainer/VBoxContainer/Input_user_name_alert_en.visible=false
		$change_name/MarginContainer/VBoxContainer/Input_user_name_alert_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer/resolution_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer10/vsync_en.visible=false
		$"user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer8/anti-aliasing_msaa_en".visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer2/ssao_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer3/ssil_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer4/sdfgi_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer18/ssr_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer13/VoxelGI_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer5/glow_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer6/volumetric_fog_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer7/grass_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer11/mouse_sevsitivity_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer12/crosshair_size_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer14/level_of_detail_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer15/render_resolution_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer16/language_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer17/texture_size_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer/about1_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer2/about2_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer3/about3_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer4/about4_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer5/about5_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer6/about6_en.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer7/about7_en.visible=false
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_start/start_en.visible=false
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_load/data_en.visible=false
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_options/options_en.visible=false
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_quit/quit_en.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer_Metric/HBox_Mode/modes_en.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer_Metric/HBox_Map/maps_en.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_bot_num/bot_num_en.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_difficulty/difficulty_en.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_game_time/game_time_en.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_max_kills/max_kills_en.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_ai_grenade/ai_grenade_en.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_ai_sword/ai_sword_en.visible=false
		
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_bot_num/HSeparator.custom_minimum_size.x=40.515
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_difficulty/HSeparator.custom_minimum_size.x=24.135
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_game_time/HSeparator.custom_minimum_size.x=13.95
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_max_kills/HSeparator.custom_minimum_size.x=25.65
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_ai_grenade/HSeparator.custom_minimum_size.x=46.87
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_ai_sword/HSeparator.custom_minimum_size.x=46.81
		
		
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Maps/PanelContainer_maps/ScrollContainer/VBoxContainer/Button_blood_strike.text="血战回廊"
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Maps/PanelContainer_maps/ScrollContainer/VBoxContainer/Button_space_station_simple.text="太空站"
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Maps/PanelContainer_maps/ScrollContainer/VBoxContainer/Button_snow_basin.text="冰雪盆地"
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Maps/PanelContainer_maps/ScrollContainer/VBoxContainer/Button_office.text="办公室"
		
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Mode/PanelContainer_mode/ScrollContainer/VBoxContainer/Team_Death_Match.text="团队竞赛"
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Mode/PanelContainer_mode/ScrollContainer/VBoxContainer/Free_For_All.text="个人战斗"
		
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/apply_options.text="应用"
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/reset_options.text="重置"
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/exit_options.text="关闭"
		
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/start_button.text="战斗开始"
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/cancel_button.text="取消"
		
		$quit_verify/MarginContainer/VBoxContainer/HBoxContainer/yes_button.text="是"
		$quit_verify/MarginContainer/VBoxContainer/HBoxContainer/no_button.text="否"
		
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer/user_name_cn.visible=true
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer2/kills_cn.visible=true
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer3/death_cn.visible=true
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer4/favorite_cn.visible=true
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer5/rank_cn.visible=true
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer6/battles_cn.visible=true
		$user_career/PanelContainer/MarginContainer/HBoxContainer/save_data_control/alert_text_cn.visible=true
		
		$user_career/PanelContainer/MarginContainer/HBoxContainer/save_data_control/data_folder.text="存档文件"
		$user_career/PanelContainer/MarginContainer/HBoxContainer/save_data_control/exit.text="关闭"
		
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer/user_name_en.visible=false
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer2/kills_en.visible=false
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer3/death_en.visible=false
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer4/favorite_en.visible=false
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer5/rank_en.visible=false
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer6/battles_en.visible=false
		$user_career/PanelContainer/MarginContainer/HBoxContainer/save_data_control/alert_text_en.visible=false
		
	if UserData.language_data=="english":
		$quit_verify/MarginContainer/VBoxContainer/HBoxContainer2/Label_cn.visible=false
		$user_first_login/MarginContainer/VBoxContainer/Input_user_name_alert_cn.visible=false
		$change_name/MarginContainer/VBoxContainer/Input_user_name_alert_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer/resolution_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer10/vsync_cn.visible=false
		$"user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer8/anti-aliasing_msaa_cn".visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer2/ssao_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer3/ssil_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer4/sdfgi_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer18/ssr_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer13/VoxelGI_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer5/glow_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer6/volumetric_fog_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer7/grass_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer11/mouse_sevsitivity_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer12/crosshair_size_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer14/level_of_detail_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer15/render_resolution_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer16/language_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer17/texture_size_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer/about1_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer2/about2_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer3/about3_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer4/about4_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer5/about5_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer6/about6_cn.visible=false
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer7/about7_cn.visible=false
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_start/start_cn.visible=false
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_load/data_cn.visible=false
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_options/options_cn.visible=false
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_quit/quit_cn.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer_Metric/HBox_Mode/modes_cn.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer_Metric/HBox_Map/maps_cn.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_bot_num/bot_num_cn.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_difficulty/difficulty_cn.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_game_time/game_time_cn.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_max_kills/max_kills_cn.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_ai_grenade/ai_grenade_cn.visible=false
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_ai_sword/ai_sword_cn.visible=false
		
		
		$quit_verify/MarginContainer/VBoxContainer/HBoxContainer2/Label_en.visible=true
		$user_first_login/MarginContainer/VBoxContainer/Input_user_name_alert_en.visible=true
		$change_name/MarginContainer/VBoxContainer/Input_user_name_alert_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer/resolution_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer10/vsync_en.visible=true
		$"user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer8/anti-aliasing_msaa_en".visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer2/ssao_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer3/ssil_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer4/sdfgi_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer18/ssr_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer13/VoxelGI_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer5/glow_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer6/volumetric_fog_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer7/grass_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer11/mouse_sevsitivity_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer12/crosshair_size_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer14/level_of_detail_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer15/render_resolution_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer16/language_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer17/texture_size_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer/about1_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer2/about2_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer3/about3_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer4/about4_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer5/about5_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer6/about6_en.visible=true
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu/MarginContainer/VBoxContainer/HBoxContainer7/about7_en.visible=true
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_start/start_en.visible=true
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_load/data_en.visible=true
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_options/options_en.visible=true
		$Control_button_menu/button_menu/PanelContainer/VBoxContainer/TextureButton_quit/quit_en.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer_Metric/HBox_Mode/modes_en.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer_Metric/HBox_Map/maps_en.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_bot_num/bot_num_en.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_difficulty/difficulty_en.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_game_time/game_time_en.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_max_kills/max_kills_en.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_ai_grenade/ai_grenade_en.visible=true
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_ai_sword/ai_sword_en.visible=true
		
		
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_bot_num/HSeparator.custom_minimum_size.x=33.225
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_difficulty/HSeparator.custom_minimum_size.x=30.845
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_game_time/HSeparator.custom_minimum_size.x=24.98
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_max_kills/HSeparator.custom_minimum_size.x=32.23
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_ai_grenade/HSeparator.custom_minimum_size.x=18.815
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_ai_sword/HSeparator.custom_minimum_size.x=34.495
		
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Maps/PanelContainer_maps/ScrollContainer/VBoxContainer/Button_blood_strike.text="blood strike"
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Maps/PanelContainer_maps/ScrollContainer/VBoxContainer/Button_space_station_simple.text="space station"
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Maps/PanelContainer_maps/ScrollContainer/VBoxContainer/Button_snow_basin.text="snow basin"
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Maps/PanelContainer_maps/ScrollContainer/VBoxContainer/Button_office.text="office"
		
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Mode/PanelContainer_mode/ScrollContainer/VBoxContainer/Team_Death_Match.text="Team death match"
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Mode/PanelContainer_mode/ScrollContainer/VBoxContainer/Free_For_All.text="Free for all"
		
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/apply_options.text="apply"
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/reset_options.text="reset"
		$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/exit_options.text="exit"
		
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/start_button.text="Let's Go!"
		$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/cancel_button.text="Cancel"
		
		$quit_verify/MarginContainer/VBoxContainer/HBoxContainer/yes_button.text="Yes"
		$quit_verify/MarginContainer/VBoxContainer/HBoxContainer/no_button.text="No"
		
		
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer/user_name_cn.visible=false
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer2/kills_cn.visible=false
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer3/death_cn.visible=false
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer4/favorite_cn.visible=false
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer5/rank_cn.visible=false
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer6/battles_cn.visible=false
		$user_career/PanelContainer/MarginContainer/HBoxContainer/save_data_control/alert_text_cn.visible=false
		
		$user_career/PanelContainer/MarginContainer/HBoxContainer/save_data_control/data_folder.text="Data Folder"
		$user_career/PanelContainer/MarginContainer/HBoxContainer/save_data_control/exit.text="Exit"
		
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer/user_name_en.visible=true
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer2/kills_en.visible=true
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer3/death_en.visible=true
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer4/favorite_en.visible=true
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer5/rank_en.visible=true
		$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer6/battles_en.visible=true
		$user_career/PanelContainer/MarginContainer/HBoxContainer/save_data_control/alert_text_en.visible=true
	#language
	grass_button.text=str(UserData.grass_density)
	
	if UserData.texture_size_data==256:
		texture_size_button.text="256-256"
	elif UserData.texture_size_data==512:
		texture_size_button.text="512-512"
	elif UserData.texture_size_data==1024:
		texture_size_button.text="1024-1024"
	#mouse_range_node.value=UserData.mouse_seveitivity_data
	#crosshair_node.value=UserData.crosshair_data
	#lod_node.value=UserData.lod_data
	#render_resolution_node.value=UserData.render_resolution_data
	
	
#user_career

#options

@onready var resolution_button:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer/Button_resolution
@onready var vsync_button:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer10/Button_vsync
@onready var anti_aliasing_msaa_button:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer8/Button_anti_aliasing_msaa
@onready var ssao_button:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer2/Button_ssao
@onready var ssil_button:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer3/Button_ssil
@onready var sdfgi_button:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer4/Button_sdfgi
@onready var ssr_button:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer18/Button_ssr
@onready var voxelgi_button:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer13/Button_VoxelGI
@onready var glow_button:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer5/Button_glow
@onready var volumetric_fog_button:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer6/Button_volumetric_fog
@onready var grass_button:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer7/Button_grass
@onready var language_button:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer16/Button_language

@onready var mouse_range_node:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer11/MS_range
@onready var mouse_range_label_node:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer11/MS_range/MS_range_Label

@onready var crosshair_node:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer12/CS_range
@onready var crosshair_label_node:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer12/CS_range/CS_range_Label

@onready var lod_node:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer14/lod_range
@onready var lod_label_node:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer14/lod_range/lod_range_Label

@onready var render_resolution_node:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer15/render_resolution_range
@onready var render_resolution_label_node:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer15/render_resolution_range/render_resolution_range_Label

@onready var texture_size_button:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer17/Button_texture_size

var reslution_text_default:String#_ready
var vsync_default:String="open"
var anti_aliasing_msaa_default:String="4x"
var ssao_default:String="open"
var ssil_default:String="open"
var sdfgi_default:String="close"
var ssr_default:String="close"
var voxelgi_default:String="open"
var glow_default:String="open"
var volumetric_fog_default:String="open"
var grass_default:String="2"
var mouse_sevsitivity_default:float=0.08
var crosshair_size_default:float=0.125
var lod_range_default:float=1
var render_resolution_default:float=1
var language_default:String="chinese"
var texture_size_default:int=1024
func _on_button_resolution_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if $user_options.visible==true:
			if resolution_button.text=="2560-1600":
				resolution_button.text="800-600"
				UserData.reslution_vec_data=Vector2(800,600)
				return
			elif resolution_button.text=="800-600":
				resolution_button.text="1024-768"
				UserData.reslution_vec_data=Vector2(1024,768)
				return
			elif resolution_button.text=="1024-768":
				resolution_button.text="1152-864"
				UserData.reslution_vec_data=Vector2(1152,864)
				return
			elif resolution_button.text=="1152-864":
				resolution_button.text="1280-600"
				UserData.reslution_vec_data=Vector2(1280,600)
				return
			elif resolution_button.text=="1280-600":
				resolution_button.text="1280-720"
				UserData.reslution_vec_data=Vector2(1280,720)
				return
			elif resolution_button.text=="1280-720":
				resolution_button.text="1280-768"
				UserData.reslution_vec_data=Vector2(1280,768)
				return
			elif resolution_button.text=="1280-768":
				resolution_button.text="1280-800"
				UserData.reslution_vec_data=Vector2(1280,800)
				return
			elif resolution_button.text=="1280-800":
				resolution_button.text="1280-960"
				UserData.reslution_vec_data=Vector2(1280,960)
				return
			elif resolution_button.text=="1280-960":
				resolution_button.text="1280-1024"
				UserData.reslution_vec_data=Vector2(1280,1024)
				return
			elif resolution_button.text=="1280-1024":
				resolution_button.text="1360-768"
				UserData.reslution_vec_data=Vector2(1360,768)
				return
			elif resolution_button.text=="1360-768":
				resolution_button.text="1366-768"
				UserData.reslution_vec_data=Vector2(1366,768)
				return
			elif resolution_button.text=="1366-768":
				resolution_button.text="1400-1050"
				UserData.reslution_vec_data=Vector2(1400,1050)
				return
			elif resolution_button.text=="1400-1050":
				resolution_button.text="1440-900"
				UserData.reslution_vec_data=Vector2(1440,900)
				return
			elif resolution_button.text=="1440-900":
				resolution_button.text="1600-900"
				UserData.reslution_vec_data=Vector2(1600,900)
				return
			elif resolution_button.text=="1600-900":
				resolution_button.text="1600-1200"
				UserData.reslution_vec_data=Vector2(1600,1200)
				return
			elif resolution_button.text=="1600-1200":
				resolution_button.text="1680-1050"
				UserData.reslution_vec_data=Vector2(1680,1050)
				return
			elif resolution_button.text=="1680-1050":
				resolution_button.text="1792-1344"
				UserData.reslution_vec_data=Vector2(1792,1344)
				return
			elif resolution_button.text=="1792-1344":
				resolution_button.text="1856-1392"
				UserData.reslution_vec_data=Vector2(1856,1392)
				return
			elif resolution_button.text=="1856-1392":
				resolution_button.text="1920-1080"
				UserData.reslution_vec_data=Vector2(1920,1080)
				return
			elif resolution_button.text=="1920-1080":
				resolution_button.text="1920-1200"
				UserData.reslution_vec_data=Vector2(1920,1200)
				return
			elif resolution_button.text=="1920-1200":
				resolution_button.text="1920-1440"
				UserData.reslution_vec_data=Vector2(1920,1440)
				return
			elif resolution_button.text=="1920-1440":
				resolution_button.text="2048-1152"
				UserData.reslution_vec_data=Vector2(2048,1152)
				return
			elif resolution_button.text=="2048-1152":
				resolution_button.text="2048-1536"
				UserData.reslution_vec_data=Vector2(2048,1536)
				return
			elif resolution_button.text=="2048-1536":
				resolution_button.text="2560-1440"
				UserData.reslution_vec_data=Vector2(2560,1440)
				return
			elif resolution_button.text=="2560-1440":
				resolution_button.text="2560-1600"
				UserData.reslution_vec_data=Vector2(2560,1600)
				return
			else:
				resolution_button.text="800-600"
				UserData.reslution_vec_data=Vector2(800,600)
				return

func _on_button_vsync_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if vsync_button.text=="close":
			vsync_button.text="open"
			UserData.vsync_data=DisplayServer.VSYNC_ENABLED
			return
		if vsync_button.text=="open":
			vsync_button.text="close"
			UserData.vsync_data=DisplayServer.VSYNC_DISABLED
			return

func _on_button_antialiasingmsaa_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if anti_aliasing_msaa_button.text=="8x":
			anti_aliasing_msaa_button.text="disabled"
			UserData.anti_aliasing_msaa_data=Viewport.MSAA_DISABLED
			return
		if anti_aliasing_msaa_button.text=="disabled":
			anti_aliasing_msaa_button.text="2x"
			UserData.anti_aliasing_msaa_data=Viewport.MSAA_2X
			return
		if anti_aliasing_msaa_button.text=="2x":
			anti_aliasing_msaa_button.text="4x"
			UserData.anti_aliasing_msaa_data=Viewport.MSAA_4X
			return
		if anti_aliasing_msaa_button.text=="4x":
			anti_aliasing_msaa_button.text="8x"
			UserData.anti_aliasing_msaa_data=Viewport.MSAA_8X
			return


func _on_button_ssao_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if ssao_button.text=="close":
			ssao_button.text="open"
			UserData.ssao_data=true
			return
		if ssao_button.text=="open":
			ssao_button.text="close"
			UserData.ssao_data=false
			return


func _on_button_ssil_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if ssil_button.text=="close":
			ssil_button.text="open"
			UserData.ssil_data=true
			return
		if ssil_button.text=="open":
			ssil_button.text="close"
			UserData.ssil_data=false
			return


func _on_button_sdfgi_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if sdfgi_button.text=="close":
			sdfgi_button.text="open"
			UserData.sdfgi_data=true
			return
		if sdfgi_button.text=="open":
			sdfgi_button.text="close"
			UserData.sdfgi_data=false
			return

func _on_button_ssr_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if ssr_button.text=="close":
			ssr_button.text="open"
			UserData.ssr_data=true
			return
		if ssr_button.text=="open":
			ssr_button.text="close"
			UserData.ssr_data=false
			return

func _on_button_voxel_gi_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if voxelgi_button.text=="close":
			voxelgi_button.text="open"
			UserData.voxelgi_data=true
			return
		if voxelgi_button.text=="open":
			voxelgi_button.text="close"
			UserData.voxelgi_data=false
			return

func _on_button_glow_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if glow_button.text=="close":
			glow_button.text="open"
			UserData.glow_data=true
			return
		if glow_button.text=="open":
			glow_button.text="close"
			UserData.glow_data=false
			return


func _on_button_volumetric_fog_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if volumetric_fog_button.text=="close":
			volumetric_fog_button.text="open"
			UserData.volumetric_fog_data=true
			return
		if volumetric_fog_button.text=="open":
			volumetric_fog_button.text="close"
			UserData.volumetric_fog_data=false
			return


func _on_button_grass_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if grass_button.text=="0":
			grass_button.text="1"
			UserData.grass_density=1
			return
		if grass_button.text=="1":
			grass_button.text="2"
			UserData.grass_density=2
			return
		if grass_button.text=="2":
			grass_button.text="0"
			UserData.grass_density=0
			return
	
	
func _on_button_language_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if language_button.text=="chinese":
			language_button.text="english"
			UserData.language_data="english"
			return
		if language_button.text=="english":
			language_button.text="chinese"
			UserData.language_data="chinese"
			return


func _on_button_texture_size_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if texture_size_button.text=="256-256":
			texture_size_button.text="512-512"
			UserData.texture_size_data=512
			return
		if texture_size_button.text=="512-512":
			texture_size_button.text="1024-1024"
			UserData.texture_size_data=1024
			return
		if texture_size_button.text=="1024-1024":
			texture_size_button.text="256-256"
			UserData.texture_size_data=256
			return

@onready var blood_strike_environment:Resource=preload("res://assets/scenes/main_game_scenes/blood_strike/blood_strike.tres")
@onready var space_station_simple_environment:Resource=preload("res://assets/scenes/space_station/ss_Simplified_version/space_station_simple.tres")
@onready var snow_basin_environment:Resource=preload("res://assets/scenes/snow_basin/snow_basin.tres")
@onready var office_environment:Resource=preload("res://assets/scenes/office/office_main_scene.tres")

func apply_options():
	get_viewport().content_scale_size=UserData.reslution_vec_data
	resolution_button.text=str(int(UserData.reslution_vec_data.x))+"-"+str(int(UserData.reslution_vec_data.y))
	
	DisplayServer.window_set_vsync_mode(UserData.vsync_data)
	
	get_viewport().msaa_3d=UserData.anti_aliasing_msaa_data
	
	blood_strike_environment.set_ssao_enabled(UserData.ssao_data)
	space_station_simple_environment.set_ssao_enabled(UserData.ssao_data)
	snow_basin_environment.set_ssao_enabled(UserData.ssao_data)
	office_environment.set_ssao_enabled(UserData.ssao_data)
	
	blood_strike_environment.set_ssil_enabled(UserData.ssil_data)
	space_station_simple_environment.set_ssil_enabled(UserData.ssil_data)
	snow_basin_environment.set_ssil_enabled(UserData.ssil_data)
	office_environment.set_ssil_enabled(UserData.ssil_data)
	
	blood_strike_environment.set_sdfgi_enabled(UserData.sdfgi_data)
	space_station_simple_environment.set_sdfgi_enabled(UserData.sdfgi_data)
	snow_basin_environment.set_sdfgi_enabled(UserData.sdfgi_data)
	office_environment.set_sdfgi_enabled(UserData.sdfgi_data)
	
	blood_strike_environment.set_ssr_enabled(UserData.ssr_data)
	space_station_simple_environment.set_ssr_enabled(UserData.ssr_data)
	snow_basin_environment.set_ssr_enabled(UserData.ssr_data)
	office_environment.set_ssr_enabled(UserData.ssr_data)
	
	blood_strike_environment.set_glow_enabled(UserData.glow_data)
	space_station_simple_environment.set_glow_enabled(UserData.glow_data)
	snow_basin_environment.set_glow_enabled(UserData.glow_data)
	office_environment.set_glow_enabled(UserData.glow_data)
	
	blood_strike_environment.set_volumetric_fog_enabled(UserData.volumetric_fog_data)
	space_station_simple_environment.set_volumetric_fog_enabled(UserData.volumetric_fog_data)
	snow_basin_environment.set_volumetric_fog_enabled(UserData.volumetric_fog_data)
	office_environment.set_volumetric_fog_enabled(UserData.volumetric_fog_data)
	
	
	mouse_range_node.value=UserData.mouse_seveitivity_data
	crosshair_node.value=UserData.crosshair_data
	lod_node.value=UserData.lod_data
	render_resolution_node.value=UserData.render_resolution_data
	
	UserData.mouse_seveitivity_data=mouse_range_node.value
	UserData.crosshair_data=crosshair_node.value
	UserData.lod_data=lod_node.value
	UserData.render_resolution_data=render_resolution_node.value
	
func _on_apply_options_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		apply_options()
		UserData.user_options_save()
		if $user_options.visible==true:
			$user_options.visible=false

func _on_reset_options_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		resolution_button.text=reslution_text_default
		UserData.reslution_vec_data=UserData.reslution_vec_data_default
		
		vsync_button.text=vsync_default
		UserData.vsync_data=UserData.vsync_data_default
		
		anti_aliasing_msaa_button.text=anti_aliasing_msaa_default
		UserData.anti_aliasing_msaa_data=UserData.anti_aliasing_msaa_data_default
		
		ssao_button.text=ssao_default
		UserData.ssao_data=UserData.ssao_data_default
		
		ssil_button.text=ssil_default
		UserData.ssil_data=UserData.ssil_data_default
		
		sdfgi_button.text=sdfgi_default
		UserData.sdfgi_data=UserData.sdfgi_data_default
		
		ssr_button.text=ssr_default
		UserData.ssr_data=UserData.ssr_data_default
		
		voxelgi_button.text=voxelgi_default
		UserData.voxelgi_data=UserData.voxelgi_data_default
		
		glow_button.text=glow_default
		UserData.glow_data=UserData.glow_data_default
		
		volumetric_fog_button.text=volumetric_fog_default
		UserData.volumetric_fog_data=UserData.volumetric_fog_data_default
		
		grass_button.text=grass_default
		UserData.grass_density=UserData.grass_density_default
		
		mouse_range_node.value=mouse_sevsitivity_default
		UserData.mouse_seveitivity_data=UserData.mouse_seveitivity_data_default
		
		crosshair_node.value=crosshair_size_default
		UserData.crosshair_data=UserData.crosshair_data_default
		
		lod_node.value=lod_range_default
		UserData.lod_data=UserData.lod_data_default
		
		render_resolution_node.value=render_resolution_default
		UserData.render_resolution_data=UserData.render_resolution_data_default
		
		language_button.text=language_default
		UserData.language_data=UserData.language_data_default
		
		texture_size_button.text=str(texture_size_default)+"-"+str(texture_size_default)
		UserData.texture_size_data=UserData.texture_size_data_default
func _on_exit_options_button_down() -> void:
	if FileAccess.file_exists("user://SaveOptions0.4.data"):
		UserData.user_options_load()
		apply_options()
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if $user_options.visible==true:
			$user_options.visible=false
#options
var kills_data:String=""
var kills_data_n:int=0
var death_data:String=""
var death_data_n:int=0

var favorite_data:String=""
var favorite_data_rifle:int=0
var favorite_data_pistol:int=0
var favorite_data_smg:int=0
var favorite_data_sniper:int=0
var favorite_data_shotgun:int=0
var favorite_data_machine_gun:int=0

var rank_data:String=""
var rank_data_n:int=0
var battles_data:String=""
var battles_data_n:int=0

@onready var about_the_game_menu:Node=$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu
func _on_button_ok_atg_button_down() -> void:
	$main_menu_button_press_audio.play()
	if about_the_game_menu.visible==true:
		about_the_game_menu.visible=false
	


func _on_about_the_game_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		about_the_game_menu.visible=true

#menu_audio
func _on_texture_button_start_mouse_entered() -> void:
	$main_menu_button_audio.play()


func _on_texture_button_load_mouse_entered() -> void:
	$main_menu_button_audio.play()


func _on_texture_button_options_mouse_entered() -> void:
	$main_menu_button_audio.play()


func _on_texture_button_quit_mouse_entered() -> void:
	$main_menu_button_audio.play()


func _on_button_blood_strike_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_space_station_simple_mouse_entered() -> void:
	$user_manu_button_audio.play()

func _on_button_snow_basin_mouse_entered() -> void:
	$user_manu_button_audio.play()

func _on_button_office_mouse_entered() -> void:
	$user_manu_button_audio.play()

func _on_team_death_match_mouse_entered() -> void:
	$user_manu_button_audio.play()

func _on_free_for_all_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_bot_num_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_difficulty_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_game_time_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_max_kills_mouse_entered() -> void:
	$user_manu_button_audio.play()

func _on_button_ai_grenade_mouse_entered() -> void:
	$user_manu_button_audio.play()

func _on_button_ai_sword_mouse_entered() -> void:
	$user_manu_button_audio.play()

func _on_cancel_button_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_start_button_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_no_button_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_yes_button_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_ok_mouse_entered() -> void:
	$main_menu_button_audio.play()


func _on_data_folder_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_exit_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_resolution_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_vsync_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_anti_aliasing_msaa_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_ssao_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_ssil_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_sdfgi_mouse_entered() -> void:
	$user_manu_button_audio.play()

func _on_button_voxel_gi_mouse_entered() -> void:
	$user_manu_button_audio.play()
	
func _on_button_glow_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_volumetric_fog_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_grass_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_ms_range_mouse_entered() -> void:
	$user_manu_button_audio.play()
func _on_ms_range_mouse_exited() -> void:
	UserData.mouse_seveitivity_data=mouse_range_node.value

func _on_cs_range_mouse_entered() -> void:
	$user_manu_button_audio.play()
func _on_cs_range_mouse_exited() -> void:
	UserData.crosshair_data=crosshair_node.value

func _on_lod_range_mouse_entered() -> void:
	$user_manu_button_audio.play()
func _on_lod_range_mouse_exited() -> void:
	UserData.lod_data=lod_node.value

func _on_render_resolution_range_mouse_entered() -> void:
	$user_manu_button_audio.play()
func _on_render_resolution_range_mouse_exited() -> void:
	UserData.render_resolution_data=render_resolution_node.value

func _on_apply_options_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_reset_options_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_exit_options_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_ok_atg_mouse_entered() -> void:
	$main_menu_button_audio.play()


func _on_about_the_game_mouse_entered() -> void:
	$user_manu_button_audio.play()

func _on_button_language_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_texture_size_mouse_entered() -> void:
	$user_manu_button_audio.play()

func _on_button_ssr_mouse_entered() -> void:
	$user_manu_button_audio.play()
