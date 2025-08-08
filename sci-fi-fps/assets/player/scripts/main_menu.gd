extends Control


@onready var blood_strike_map_TDM="res://assets/scenes/main_game_scenes/Team_Death_Match/blood_strike/blood_strike_team_death_match.tscn"
@onready var blood_strike_map_FFA="res://assets/scenes/main_game_scenes/Free_For_All/blood_strike/blood_strike_free_for_all.tscn"

@onready var forest_map_TDM="res://assets/scenes/main_game_scenes/Team_Death_Match/forest/forest_team_death_match.tscn"
@onready var forest_map_FFA="res://assets/scenes/main_game_scenes/Free_For_All/forest/forest_free_for_all.tscn"

func _ready() -> void:
	if FileAccess.file_exists("user://SaveUser.data"):
		UserData.user_data_load()
	if FileAccess.file_exists("user://SaveOptions.data"):
		UserData.user_options_load()
		apply_options()
	else:
		UserData.user_options_save()
		apply_options()
	reslution_text_default=str(UserData.reslution_vec_data_default.x)+"-"+str(UserData.reslution_vec_data_default.y)
	#resolution_button.text=reslution_text_default
	if UserData.user_name_data==""&&FileAccess.file_exists("user://SaveUser.data")==false:
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
	
	


@onready var map_texture_node=$game_load/PanelContainer/MarginContainer/HBoxContainer/TextureRect

@onready var blood_strike_map_icon=load("res://assets/scenes/main_game_scenes/blood_strike/blood_strike_icon.png")
@onready var forest_icon=load("res://assets/scenes/forest/forest_icon.png")

@onready var loading_ProgressBar=$loading_progress_bar/MarginContainer/VBoxContainer/loading_ProgressBar/ProgressBar
func _process(delta: float) -> void:
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
	
	mouse_range_label_node.text=str(mouse_range_node.value)
	crosshair_label_node.text=str(crosshair_node.value)
	
	if map_label_text.text=="Blood Strike":
		map_texture_node.texture=blood_strike_map_icon
	if map_label_text.text=="Forest":
		map_texture_node.texture=forest_icon
	
	
	
	if game_start_loading==true:
		$Control_button_menu.visible=false
		$game_load.visible=false
		$quit_verify.visible=false
		$loading_progress_bar.visible=true
		if map_label_text.text=="Blood Strike":
			if mode_label_text.text=="Team Death Match":
				var progress=[]
				ResourceLoader.load_threaded_request(blood_strike_map_TDM)
				ResourceLoader.load_threaded_get_status(blood_strike_map_TDM,progress)
				loading_ProgressBar.value=progress[0]*100
				if progress[0]==1:
					var packed_scene=ResourceLoader.load_threaded_get(blood_strike_map_TDM)
					get_tree().change_scene_to_packed(packed_scene)
			if mode_label_text.text=="Free For All":
				var progress=[]
				ResourceLoader.load_threaded_request(blood_strike_map_FFA)
				ResourceLoader.load_threaded_get_status(blood_strike_map_FFA,progress)
				loading_ProgressBar.value=progress[0]*100
				if progress[0]==1:
					var packed_scene=ResourceLoader.load_threaded_get(blood_strike_map_FFA)
					get_tree().change_scene_to_packed(packed_scene)
		
		if map_label_text.text=="Forest":
			if mode_label_text.text=="Team Death Match":
				var progress=[]
				ResourceLoader.load_threaded_request(forest_map_TDM)
				ResourceLoader.load_threaded_get_status(forest_map_TDM,progress)
				loading_ProgressBar.value=progress[0]*100
				if progress[0]==1:
					var packed_scene=ResourceLoader.load_threaded_get(forest_map_TDM)
					get_tree().change_scene_to_packed(packed_scene)
			if mode_label_text.text=="Free For All":
				var progress=[]
				ResourceLoader.load_threaded_request(forest_map_FFA)
				ResourceLoader.load_threaded_get_status(forest_map_FFA,progress)
				loading_ProgressBar.value=progress[0]*100
				if progress[0]==1:
					var packed_scene=ResourceLoader.load_threaded_get(forest_map_FFA)
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





@onready var map_label_text=$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer_Metric/HBox_Map/mp
@onready var mode_label_text=$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer_Metric/HBox_Mode/md



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

func _on_button_forest_button_down() -> void:
	$user_manu_button_press_audio.play()
	if $game_load.visible==true:
		map_label_text.text="Forest"
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
@onready var button_bot_num_node=$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_bot_num/Button_bot_num
@onready var button_difficulty_node=$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_difficulty/Button_difficulty
@onready var button_game_time_node=$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_game_time/Button_game_time
@onready var button_max_kill_node=$game_load/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Setting/PanelContainer_mode/ScrollContainer/VBoxContainer/HBox_max_kills/Button_max_kills
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

#setting

var game_start_loading=false
#game_start
func _on_start_button_button_down() -> void:
	$user_manu_button_press_audio.play()
	if $game_load.visible==true:
		game_start_loading=true
#game_start

#game_load


#user_career
#user_name
@onready var name_line_edit=$user_first_login/MarginContainer/VBoxContainer/HBoxContainer_line_edit/LineEdit
@onready var user_data=$user_career



func _on_button_ok_button_down() -> void:
	$main_menu_button_press_audio.play()
	if $user_first_login.visible==true:
		if name_line_edit.text!="":
			UserData.user_name_data=name_line_edit.text
			UserData.user_data_save()
			$user_first_login.visible=false

@onready var user_name_text_label=$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer/user_name2
@onready var kills_text_label=$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer2/kills2
@onready var death_text_label=$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer3/death2
@onready var favorite_text_label=$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer4/favorite2
@onready var rank_text_label=$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer5/rank2
@onready var battles_text_label=$user_career/PanelContainer/MarginContainer/HBoxContainer/player_career_names/HBoxContainer6/battles2


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
	if UserData.anti_aliasing_fxaa_data==Viewport.SCREEN_SPACE_AA_DISABLED:
		anti_aliasing_fxaa_button.text="close"
	elif UserData.anti_aliasing_fxaa_data==Viewport.SCREEN_SPACE_AA_FXAA:
		anti_aliasing_fxaa_button.text="open"
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
	if UserData.glow_data==true:
		glow_button.text="open"
	else:
		glow_button.text="close"
	if UserData.volumetric_fog_data==true:
		volumetric_fog_button.text="open"
	else:
		volumetric_fog_button.text="close"
	
	grass_button.text=str(UserData.grass_density)
	UserData.mouse_seveitivity_data=mouse_range_node.value
	UserData.crosshair_data=crosshair_node.value
#user_career

#options

@onready var resolution_button=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer/Button_resolution
@onready var vsync_button=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer10/Button_vsync
@onready var anti_aliasing_msaa_button=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer8/Button_anti_aliasing_msaa
@onready var anti_aliasing_fxaa_button=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer9/Button_anti_aliasing_fxaa
@onready var ssao_button=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer2/Button_ssao
@onready var ssil_button=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer3/Button_ssil
@onready var sdfgi_button=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer4/Button_sdfgi
@onready var glow_button=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer5/Button_glow
@onready var volumetric_fog_button=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer6/Button_volumetric_fog
@onready var grass_button=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer7/Button_grass

@onready var mouse_range_node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer11/MS_range
@onready var mouse_range_label_node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer11/MS_range/MS_range_Label

@onready var crosshair_node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer12/CS_range
@onready var crosshair_label_node=$user_options/PanelContainer/MarginContainer/HBoxContainer/ScrollContainer_career/player_career_names/HBoxContainer12/CS_range/CS_range_Label

var reslution_text_default#_ready
var vsync_default="open"
var anti_aliasing_msaa_default="4x"
var anti_aliasing_fxaa_default="close"
var ssao_default="open"
var ssil_default="open"
var sdfgi_default="open"
var glow_default="open"
var volumetric_fog_default="open"
var grass_default="0"
var mouse_sevsitivity_default=0.08
var crosshair_size_default=0.125
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


func _on_button_antialiasingfxaa_button_down() -> void:
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if anti_aliasing_fxaa_button.text=="close":
			anti_aliasing_fxaa_button.text="open"
			UserData.anti_aliasing_fxaa_data==Viewport.SCREEN_SPACE_AA_FXAA
			return
		if anti_aliasing_fxaa_button.text=="open":
			anti_aliasing_fxaa_button.text="close"
			UserData.anti_aliasing_fxaa_data=Viewport.SCREEN_SPACE_AA_DISABLED
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
@onready var blood_strike_environment=preload("res://assets/scenes/main_game_scenes/blood_strike/blood_strike.tres")
@onready var forest_environment=preload("res://assets/scenes/forest/terrain/forest_main_scene_environment.tres")

func apply_options():
	get_viewport().content_scale_size=UserData.reslution_vec_data
	resolution_button.text=str(int(UserData.reslution_vec_data.x))+"-"+str(int(UserData.reslution_vec_data.y))
	
	DisplayServer.window_set_vsync_mode(UserData.vsync_data)
	
	get_viewport().msaa_3d=UserData.anti_aliasing_msaa_data
	
	get_viewport().screen_space_aa=UserData.anti_aliasing_fxaa_data
	
	blood_strike_environment.set_ssao_enabled(UserData.ssao_data)
	forest_environment.set_ssao_enabled(UserData.ssao_data)
	
	blood_strike_environment.set_ssil_enabled(UserData.ssil_data)
	forest_environment.set_ssil_enabled(UserData.ssil_data)
	
	blood_strike_environment.set_sdfgi_enabled(UserData.sdfgi_data)
	forest_environment.set_sdfgi_enabled(UserData.sdfgi_data)
	
	blood_strike_environment.set_glow_enabled(UserData.glow_data)
	forest_environment.set_glow_enabled(UserData.glow_data)
	
	blood_strike_environment.set_volumetric_fog_enabled(UserData.volumetric_fog_data)
	forest_environment.set_volumetric_fog_enabled(UserData.volumetric_fog_data)
	
	UserData.mouse_seveitivity_data=mouse_range_node.value
	UserData.crosshair_data=crosshair_node.value
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
		
		anti_aliasing_fxaa_button.text=anti_aliasing_fxaa_default
		UserData.anti_aliasing_fxaa_data=UserData.anti_aliasing_fxaa_data_default
		
		ssao_button.text=ssao_default
		UserData.ssao_data=UserData.ssao_data_default
		
		ssil_button.text=ssil_default
		UserData.ssil_data=UserData.ssil_data_default
		
		sdfgi_button.text=sdfgi_default
		UserData.sdfgi_data=UserData.sdfgi_data_default
		
		glow_button.text=glow_default
		UserData.glow_data=UserData.glow_data_default
		
		volumetric_fog_button.text=volumetric_fog_default
		UserData.volumetric_fog_data=UserData.volumetric_fog_data_default
		
		grass_button.text=grass_default
		UserData.grass_density=UserData.grass_density_default
		
		mouse_range_node.value=mouse_sevsitivity_default
		
		crosshair_node.value=crosshair_size_default

		
		UserData.mouse_seveitivity_data=UserData.mouse_seveitivity_data_default
	

func _on_exit_options_button_down() -> void:
	if FileAccess.file_exists("user://SaveOptions.data"):
		UserData.user_options_load()
	$user_manu_button_press_audio.play()
	if about_the_game_menu.visible==false:
		if $user_options.visible==true:
			$user_options.visible=false
#options
var kills_data=""
var kills_data_n=0
var death_data=""
var death_data_n=0

var favorite_data=""
var favorite_data_rifle=0
var favorite_data_pistol=0
var favorite_data_smg=0
var favorite_data_sniper=0
var favorite_data_shotgun=0
var favorite_data_machine_gun=0

var rank_data=""
var rank_data_n=0
var battles_data=""
var battles_data_n=0

@onready var about_the_game_menu=$user_options/PanelContainer/MarginContainer/HBoxContainer/save_data_control/about_the_game/about_the_game_menu
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


func _on_button_forest_mouse_entered() -> void:
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


func _on_button_anti_aliasing_fxaa_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_ssao_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_ssil_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_sdfgi_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_glow_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_volumetric_fog_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_button_grass_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_ms_range_mouse_entered() -> void:
	$user_manu_button_audio.play()


func _on_cs_range_mouse_entered() -> void:
	$user_manu_button_audio.play()


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
