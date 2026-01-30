extends Control

var players_nodes_main_nodes:Array[Node]=[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]

var players_name:Array[String]=[]
var players_name_ui_nodes:Array[Node]=[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var players_kills:Array[int]=[]
var players_kills_ui_nodes:Array[Node]=[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var players_die:Array[int]=[]
var players_die_ui_nodes:Array[Node]=[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]


var end_timer:float=0
func _ready() -> void:
	visible=true
	players_name=ScoreBoardFFAGlobal.players_name
	players_kills=ScoreBoardFFAGlobal.players_kills
	players_die=ScoreBoardFFAGlobal.players_die
	
	players_nodes_main_nodes[0]=$PanelContainer/MarginContainer/VBoxContainer/player1
	players_nodes_main_nodes[1]=$PanelContainer/MarginContainer/VBoxContainer/player2
	players_nodes_main_nodes[2]=$PanelContainer/MarginContainer/VBoxContainer/player3
	players_nodes_main_nodes[3]=$PanelContainer/MarginContainer/VBoxContainer/player4
	players_nodes_main_nodes[4]=$PanelContainer/MarginContainer/VBoxContainer/player5
	players_nodes_main_nodes[5]=$PanelContainer/MarginContainer/VBoxContainer/player6
	players_nodes_main_nodes[6]=$PanelContainer/MarginContainer/VBoxContainer/player7
	players_nodes_main_nodes[7]=$PanelContainer/MarginContainer/VBoxContainer/player8
	players_nodes_main_nodes[8]=$PanelContainer/MarginContainer/VBoxContainer/player9
	players_nodes_main_nodes[9]=$PanelContainer/MarginContainer/VBoxContainer/player10
	players_nodes_main_nodes[10]=$PanelContainer/MarginContainer/VBoxContainer/player11
	players_nodes_main_nodes[11]=$PanelContainer/MarginContainer/VBoxContainer/player12
	players_nodes_main_nodes[12]=$PanelContainer/MarginContainer/VBoxContainer/player13
	players_nodes_main_nodes[13]=$PanelContainer/MarginContainer/VBoxContainer/player14
	players_nodes_main_nodes[14]=$PanelContainer/MarginContainer/VBoxContainer/player15
	players_nodes_main_nodes[15]=$PanelContainer/MarginContainer/VBoxContainer/player16
	
	players_name_ui_nodes[0]=$PanelContainer/MarginContainer/VBoxContainer/player1/player_name
	players_name_ui_nodes[1]=$PanelContainer/MarginContainer/VBoxContainer/player2/player_name
	players_name_ui_nodes[2]=$PanelContainer/MarginContainer/VBoxContainer/player3/player_name
	players_name_ui_nodes[3]=$PanelContainer/MarginContainer/VBoxContainer/player4/player_name
	players_name_ui_nodes[4]=$PanelContainer/MarginContainer/VBoxContainer/player5/player_name
	players_name_ui_nodes[5]=$PanelContainer/MarginContainer/VBoxContainer/player6/player_name
	players_name_ui_nodes[6]=$PanelContainer/MarginContainer/VBoxContainer/player7/player_name
	players_name_ui_nodes[7]=$PanelContainer/MarginContainer/VBoxContainer/player8/player_name
	players_name_ui_nodes[8]=$PanelContainer/MarginContainer/VBoxContainer/player9/player_name
	players_name_ui_nodes[9]=$PanelContainer/MarginContainer/VBoxContainer/player10/player_name
	players_name_ui_nodes[10]=$PanelContainer/MarginContainer/VBoxContainer/player11/player_name
	players_name_ui_nodes[11]=$PanelContainer/MarginContainer/VBoxContainer/player12/player_name
	players_name_ui_nodes[12]=$PanelContainer/MarginContainer/VBoxContainer/player13/player_name
	players_name_ui_nodes[13]=$PanelContainer/MarginContainer/VBoxContainer/player14/player_name
	players_name_ui_nodes[14]=$PanelContainer/MarginContainer/VBoxContainer/player15/player_name
	players_name_ui_nodes[15]=$PanelContainer/MarginContainer/VBoxContainer/player16/player_name
	
	players_kills_ui_nodes[0]=$PanelContainer/MarginContainer/VBoxContainer/player1/kills_text
	players_kills_ui_nodes[1]=$PanelContainer/MarginContainer/VBoxContainer/player2/kills_text
	players_kills_ui_nodes[2]=$PanelContainer/MarginContainer/VBoxContainer/player3/kills_text
	players_kills_ui_nodes[3]=$PanelContainer/MarginContainer/VBoxContainer/player4/kills_text
	players_kills_ui_nodes[4]=$PanelContainer/MarginContainer/VBoxContainer/player5/kills_text
	players_kills_ui_nodes[5]=$PanelContainer/MarginContainer/VBoxContainer/player6/kills_text
	players_kills_ui_nodes[6]=$PanelContainer/MarginContainer/VBoxContainer/player7/kills_text
	players_kills_ui_nodes[7]=$PanelContainer/MarginContainer/VBoxContainer/player8/kills_text
	players_kills_ui_nodes[8]=$PanelContainer/MarginContainer/VBoxContainer/player9/kills_text
	players_kills_ui_nodes[9]=$PanelContainer/MarginContainer/VBoxContainer/player10/kills_text
	players_kills_ui_nodes[10]=$PanelContainer/MarginContainer/VBoxContainer/player11/kills_text
	players_kills_ui_nodes[11]=$PanelContainer/MarginContainer/VBoxContainer/player12/kills_text
	players_kills_ui_nodes[12]=$PanelContainer/MarginContainer/VBoxContainer/player13/kills_text
	players_kills_ui_nodes[13]=$PanelContainer/MarginContainer/VBoxContainer/player14/kills_text
	players_kills_ui_nodes[14]=$PanelContainer/MarginContainer/VBoxContainer/player15/kills_text
	players_kills_ui_nodes[15]=$PanelContainer/MarginContainer/VBoxContainer/player16/kills_text
	
	players_die_ui_nodes[0]=$PanelContainer/MarginContainer/VBoxContainer/player1/die_text
	players_die_ui_nodes[1]=$PanelContainer/MarginContainer/VBoxContainer/player2/die_text
	players_die_ui_nodes[2]=$PanelContainer/MarginContainer/VBoxContainer/player3/die_text
	players_die_ui_nodes[3]=$PanelContainer/MarginContainer/VBoxContainer/player4/die_text
	players_die_ui_nodes[4]=$PanelContainer/MarginContainer/VBoxContainer/player5/die_text
	players_die_ui_nodes[5]=$PanelContainer/MarginContainer/VBoxContainer/player6/die_text
	players_die_ui_nodes[6]=$PanelContainer/MarginContainer/VBoxContainer/player7/die_text
	players_die_ui_nodes[7]=$PanelContainer/MarginContainer/VBoxContainer/player8/die_text
	players_die_ui_nodes[8]=$PanelContainer/MarginContainer/VBoxContainer/player9/die_text
	players_die_ui_nodes[9]=$PanelContainer/MarginContainer/VBoxContainer/player10/die_text
	players_die_ui_nodes[10]=$PanelContainer/MarginContainer/VBoxContainer/player11/die_text
	players_die_ui_nodes[11]=$PanelContainer/MarginContainer/VBoxContainer/player12/die_text
	players_die_ui_nodes[12]=$PanelContainer/MarginContainer/VBoxContainer/player13/die_text
	players_die_ui_nodes[13]=$PanelContainer/MarginContainer/VBoxContainer/player14/die_text
	players_die_ui_nodes[14]=$PanelContainer/MarginContainer/VBoxContainer/player15/die_text
	players_die_ui_nodes[15]=$PanelContainer/MarginContainer/VBoxContainer/player16/die_text
	
	if players_name.size()==16:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=true
		players_nodes_main_nodes[2].visible=true
		players_nodes_main_nodes[3].visible=true
		players_nodes_main_nodes[4].visible=true
		players_nodes_main_nodes[5].visible=true
		players_nodes_main_nodes[6].visible=true
		players_nodes_main_nodes[7].visible=true
		players_nodes_main_nodes[8].visible=true
		players_nodes_main_nodes[9].visible=true
		players_nodes_main_nodes[10].visible=true
		players_nodes_main_nodes[11].visible=true
		players_nodes_main_nodes[12].visible=true
		players_nodes_main_nodes[13].visible=true
		players_nodes_main_nodes[14].visible=true
		players_nodes_main_nodes[15].visible=true
	if players_name.size()==15:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=true
		players_nodes_main_nodes[2].visible=true
		players_nodes_main_nodes[3].visible=true
		players_nodes_main_nodes[4].visible=true
		players_nodes_main_nodes[5].visible=true
		players_nodes_main_nodes[6].visible=true
		players_nodes_main_nodes[7].visible=true
		players_nodes_main_nodes[8].visible=true
		players_nodes_main_nodes[9].visible=true
		players_nodes_main_nodes[10].visible=true
		players_nodes_main_nodes[11].visible=true
		players_nodes_main_nodes[12].visible=true
		players_nodes_main_nodes[13].visible=true
		players_nodes_main_nodes[14].visible=true
		players_nodes_main_nodes[15].visible=false
	if players_name.size()==14:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=true
		players_nodes_main_nodes[2].visible=true
		players_nodes_main_nodes[3].visible=true
		players_nodes_main_nodes[4].visible=true
		players_nodes_main_nodes[5].visible=true
		players_nodes_main_nodes[6].visible=true
		players_nodes_main_nodes[7].visible=true
		players_nodes_main_nodes[8].visible=true
		players_nodes_main_nodes[9].visible=true
		players_nodes_main_nodes[10].visible=true
		players_nodes_main_nodes[11].visible=true
		players_nodes_main_nodes[12].visible=true
		players_nodes_main_nodes[13].visible=true
		players_nodes_main_nodes[14].visible=false
		players_nodes_main_nodes[15].visible=false
	if players_name.size()==13:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=true
		players_nodes_main_nodes[2].visible=true
		players_nodes_main_nodes[3].visible=true
		players_nodes_main_nodes[4].visible=true
		players_nodes_main_nodes[5].visible=true
		players_nodes_main_nodes[6].visible=true
		players_nodes_main_nodes[7].visible=true
		players_nodes_main_nodes[8].visible=true
		players_nodes_main_nodes[9].visible=true
		players_nodes_main_nodes[10].visible=true
		players_nodes_main_nodes[11].visible=true
		players_nodes_main_nodes[12].visible=true
		players_nodes_main_nodes[13].visible=false
		players_nodes_main_nodes[14].visible=false
		players_nodes_main_nodes[15].visible=false
	if players_name.size()==12:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=true
		players_nodes_main_nodes[2].visible=true
		players_nodes_main_nodes[3].visible=true
		players_nodes_main_nodes[4].visible=true
		players_nodes_main_nodes[5].visible=true
		players_nodes_main_nodes[6].visible=true
		players_nodes_main_nodes[7].visible=true
		players_nodes_main_nodes[8].visible=true
		players_nodes_main_nodes[9].visible=true
		players_nodes_main_nodes[10].visible=true
		players_nodes_main_nodes[11].visible=true
		players_nodes_main_nodes[12].visible=false
		players_nodes_main_nodes[13].visible=false
		players_nodes_main_nodes[14].visible=false
		players_nodes_main_nodes[15].visible=false
	if players_name.size()==11:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=true
		players_nodes_main_nodes[2].visible=true
		players_nodes_main_nodes[3].visible=true
		players_nodes_main_nodes[4].visible=true
		players_nodes_main_nodes[5].visible=true
		players_nodes_main_nodes[6].visible=true
		players_nodes_main_nodes[7].visible=true
		players_nodes_main_nodes[8].visible=true
		players_nodes_main_nodes[9].visible=true
		players_nodes_main_nodes[10].visible=true
		players_nodes_main_nodes[11].visible=false
		players_nodes_main_nodes[12].visible=false
		players_nodes_main_nodes[13].visible=false
		players_nodes_main_nodes[14].visible=false
		players_nodes_main_nodes[15].visible=false
	if players_name.size()==10:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=true
		players_nodes_main_nodes[2].visible=true
		players_nodes_main_nodes[3].visible=true
		players_nodes_main_nodes[4].visible=true
		players_nodes_main_nodes[5].visible=true
		players_nodes_main_nodes[6].visible=true
		players_nodes_main_nodes[7].visible=true
		players_nodes_main_nodes[8].visible=true
		players_nodes_main_nodes[9].visible=true
		players_nodes_main_nodes[10].visible=false
		players_nodes_main_nodes[11].visible=false
		players_nodes_main_nodes[12].visible=false
		players_nodes_main_nodes[13].visible=false
		players_nodes_main_nodes[14].visible=false
		players_nodes_main_nodes[15].visible=false
	if players_name.size()==9:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=true
		players_nodes_main_nodes[2].visible=true
		players_nodes_main_nodes[3].visible=true
		players_nodes_main_nodes[4].visible=true
		players_nodes_main_nodes[5].visible=true
		players_nodes_main_nodes[6].visible=true
		players_nodes_main_nodes[7].visible=true
		players_nodes_main_nodes[8].visible=true
		players_nodes_main_nodes[9].visible=false
		players_nodes_main_nodes[10].visible=false
		players_nodes_main_nodes[11].visible=false
		players_nodes_main_nodes[12].visible=false
		players_nodes_main_nodes[13].visible=false
		players_nodes_main_nodes[14].visible=false
		players_nodes_main_nodes[15].visible=false
	if players_name.size()==8:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=true
		players_nodes_main_nodes[2].visible=true
		players_nodes_main_nodes[3].visible=true
		players_nodes_main_nodes[4].visible=true
		players_nodes_main_nodes[5].visible=true
		players_nodes_main_nodes[6].visible=true
		players_nodes_main_nodes[7].visible=true
		players_nodes_main_nodes[8].visible=false
		players_nodes_main_nodes[9].visible=false
		players_nodes_main_nodes[10].visible=false
		players_nodes_main_nodes[11].visible=false
		players_nodes_main_nodes[12].visible=false
		players_nodes_main_nodes[13].visible=false
		players_nodes_main_nodes[14].visible=false
		players_nodes_main_nodes[15].visible=false
	if players_name.size()==7:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=true
		players_nodes_main_nodes[2].visible=true
		players_nodes_main_nodes[3].visible=true
		players_nodes_main_nodes[4].visible=true
		players_nodes_main_nodes[5].visible=true
		players_nodes_main_nodes[6].visible=true
		players_nodes_main_nodes[7].visible=false
		players_nodes_main_nodes[8].visible=false
		players_nodes_main_nodes[9].visible=false
		players_nodes_main_nodes[10].visible=false
		players_nodes_main_nodes[11].visible=false
		players_nodes_main_nodes[12].visible=false
		players_nodes_main_nodes[13].visible=false
		players_nodes_main_nodes[14].visible=false
		players_nodes_main_nodes[15].visible=false
	if players_name.size()==6:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=true
		players_nodes_main_nodes[2].visible=true
		players_nodes_main_nodes[3].visible=true
		players_nodes_main_nodes[4].visible=true
		players_nodes_main_nodes[5].visible=true
		players_nodes_main_nodes[6].visible=false
		players_nodes_main_nodes[7].visible=false
		players_nodes_main_nodes[8].visible=false
		players_nodes_main_nodes[9].visible=false
		players_nodes_main_nodes[10].visible=false
		players_nodes_main_nodes[11].visible=false
		players_nodes_main_nodes[12].visible=false
		players_nodes_main_nodes[13].visible=false
		players_nodes_main_nodes[14].visible=false
		players_nodes_main_nodes[15].visible=false
	if players_name.size()==5:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=true
		players_nodes_main_nodes[2].visible=true
		players_nodes_main_nodes[3].visible=true
		players_nodes_main_nodes[4].visible=true
		players_nodes_main_nodes[5].visible=false
		players_nodes_main_nodes[6].visible=false
		players_nodes_main_nodes[7].visible=false
		players_nodes_main_nodes[8].visible=false
		players_nodes_main_nodes[9].visible=false
		players_nodes_main_nodes[10].visible=false
		players_nodes_main_nodes[11].visible=false
		players_nodes_main_nodes[12].visible=false
		players_nodes_main_nodes[13].visible=false
		players_nodes_main_nodes[14].visible=false
		players_nodes_main_nodes[15].visible=false
	if players_name.size()==4:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=true
		players_nodes_main_nodes[2].visible=true
		players_nodes_main_nodes[3].visible=true
		players_nodes_main_nodes[4].visible=false
		players_nodes_main_nodes[5].visible=false
		players_nodes_main_nodes[6].visible=false
		players_nodes_main_nodes[7].visible=false
		players_nodes_main_nodes[8].visible=false
		players_nodes_main_nodes[9].visible=false
		players_nodes_main_nodes[10].visible=false
		players_nodes_main_nodes[11].visible=false
		players_nodes_main_nodes[12].visible=false
		players_nodes_main_nodes[13].visible=false
		players_nodes_main_nodes[14].visible=false
		players_nodes_main_nodes[15].visible=false
	if players_name.size()==3:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=true
		players_nodes_main_nodes[2].visible=true
		players_nodes_main_nodes[3].visible=false
		players_nodes_main_nodes[4].visible=false
		players_nodes_main_nodes[5].visible=false
		players_nodes_main_nodes[6].visible=false
		players_nodes_main_nodes[7].visible=false
		players_nodes_main_nodes[8].visible=false
		players_nodes_main_nodes[9].visible=false
		players_nodes_main_nodes[10].visible=false
		players_nodes_main_nodes[11].visible=false
		players_nodes_main_nodes[12].visible=false
		players_nodes_main_nodes[13].visible=false
		players_nodes_main_nodes[14].visible=false
		players_nodes_main_nodes[15].visible=false
	if players_name.size()==2:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=true
		players_nodes_main_nodes[2].visible=false
		players_nodes_main_nodes[3].visible=false
		players_nodes_main_nodes[4].visible=false
		players_nodes_main_nodes[5].visible=false
		players_nodes_main_nodes[6].visible=false
		players_nodes_main_nodes[7].visible=false
		players_nodes_main_nodes[8].visible=false
		players_nodes_main_nodes[9].visible=false
		players_nodes_main_nodes[10].visible=false
		players_nodes_main_nodes[11].visible=false
		players_nodes_main_nodes[12].visible=false
		players_nodes_main_nodes[13].visible=false
		players_nodes_main_nodes[14].visible=false
		players_nodes_main_nodes[15].visible=false
	if players_name.size()==1:
		players_nodes_main_nodes[0].visible=true
		players_nodes_main_nodes[1].visible=false
		players_nodes_main_nodes[2].visible=false
		players_nodes_main_nodes[3].visible=false
		players_nodes_main_nodes[4].visible=false
		players_nodes_main_nodes[5].visible=false
		players_nodes_main_nodes[6].visible=false
		players_nodes_main_nodes[7].visible=false
		players_nodes_main_nodes[8].visible=false
		players_nodes_main_nodes[9].visible=false
		players_nodes_main_nodes[10].visible=false
		players_nodes_main_nodes[11].visible=false
		players_nodes_main_nodes[12].visible=false
		players_nodes_main_nodes[13].visible=false
		players_nodes_main_nodes[14].visible=false
		players_nodes_main_nodes[15].visible=false
	if players_name.size()==0:
		players_nodes_main_nodes[0].visible=false
		players_nodes_main_nodes[1].visible=false
		players_nodes_main_nodes[2].visible=false
		players_nodes_main_nodes[3].visible=false
		players_nodes_main_nodes[4].visible=false
		players_nodes_main_nodes[5].visible=false
		players_nodes_main_nodes[6].visible=false
		players_nodes_main_nodes[7].visible=false
		players_nodes_main_nodes[8].visible=false
		players_nodes_main_nodes[9].visible=false
		players_nodes_main_nodes[10].visible=false
		players_nodes_main_nodes[11].visible=false
		players_nodes_main_nodes[12].visible=false
		players_nodes_main_nodes[13].visible=false
		players_nodes_main_nodes[14].visible=false
		players_nodes_main_nodes[15].visible=false
	
	set_score_board()
	
func set_score_board():
	if players_nodes_main_nodes[0].visible:
		players_name_ui_nodes[0].text=players_name[0]
		players_kills_ui_nodes[0].text=str(players_kills[0])
		players_die_ui_nodes[0].text=str(players_die[0])
	if players_nodes_main_nodes[1].visible:
		players_name_ui_nodes[1].text=players_name[1]
		players_kills_ui_nodes[1].text=str(players_kills[1])
		players_die_ui_nodes[1].text=str(players_die[1])
	if players_nodes_main_nodes[2].visible:
		players_name_ui_nodes[2].text=players_name[2]
		players_kills_ui_nodes[2].text=str(players_kills[2])
		players_die_ui_nodes[2].text=str(players_die[2])
	if players_nodes_main_nodes[3].visible:
		players_name_ui_nodes[3].text=players_name[3]
		players_kills_ui_nodes[3].text=str(players_kills[3])
		players_die_ui_nodes[3].text=str(players_die[3])
	if players_nodes_main_nodes[4].visible:
		players_name_ui_nodes[4].text=players_name[4]
		players_kills_ui_nodes[4].text=str(players_kills[4])
		players_die_ui_nodes[4].text=str(players_die[4])
	if players_nodes_main_nodes[5].visible:
		players_name_ui_nodes[5].text=players_name[5]
		players_kills_ui_nodes[5].text=str(players_kills[5])
		players_die_ui_nodes[5].text=str(players_die[5])
	if players_nodes_main_nodes[6].visible:
		players_name_ui_nodes[6].text=players_name[6]
		players_kills_ui_nodes[6].text=str(players_kills[6])
		players_die_ui_nodes[6].text=str(players_die[6])
	if players_nodes_main_nodes[7].visible:
		players_name_ui_nodes[7].text=players_name[7]
		players_kills_ui_nodes[7].text=str(players_kills[7])
		players_die_ui_nodes[7].text=str(players_die[7])
	if players_nodes_main_nodes[8].visible:
		players_name_ui_nodes[8].text=players_name[8]
		players_kills_ui_nodes[8].text=str(players_kills[8])
		players_die_ui_nodes[8].text=str(players_die[8])
	if players_nodes_main_nodes[9].visible:
		players_name_ui_nodes[9].text=players_name[9]
		players_kills_ui_nodes[9].text=str(players_kills[9])
		players_die_ui_nodes[9].text=str(players_die[9])
	if players_nodes_main_nodes[10].visible:
		players_name_ui_nodes[10].text=players_name[10]
		players_kills_ui_nodes[10].text=str(players_kills[10])
		players_die_ui_nodes[10].text=str(players_die[10])
	if players_nodes_main_nodes[11].visible:
		players_name_ui_nodes[11].text=players_name[11]
		players_kills_ui_nodes[11].text=str(players_kills[11])
		players_die_ui_nodes[11].text=str(players_die[11])
	if players_nodes_main_nodes[12].visible:
		players_name_ui_nodes[12].text=players_name[12]
		players_kills_ui_nodes[12].text=str(players_kills[12])
		players_die_ui_nodes[12].text=str(players_die[12])
	if players_nodes_main_nodes[13].visible:
		players_name_ui_nodes[13].text=players_name[13]
		players_kills_ui_nodes[13].text=str(players_kills[13])
		players_die_ui_nodes[13].text=str(players_die[13])
	if players_nodes_main_nodes[14].visible:
		players_name_ui_nodes[14].text=players_name[14]
		players_kills_ui_nodes[14].text=str(players_kills[14])
		players_die_ui_nodes[14].text=str(players_die[14])
	if players_nodes_main_nodes[15].visible:
		players_name_ui_nodes[15].text=players_name[15]
		players_kills_ui_nodes[15].text=str(players_kills[15])
		players_die_ui_nodes[15].text=str(players_die[15])

@onready var main_menu_scene:String="res://assets/main_menu/main_menu.tscn"
func _physics_process(delta: float) -> void:
	end_timer+=delta
	if end_timer>=10:
		UserData.user_data_save()
		var progress:Array[float]=[]
		ResourceLoader.load_threaded_request(main_menu_scene)
		ResourceLoader.load_threaded_get_status(main_menu_scene,progress)
		if progress[0]==1:
			var packed_scene:Resource=ResourceLoader.load_threaded_get(main_menu_scene)
			get_tree().change_scene_to_packed(packed_scene)
