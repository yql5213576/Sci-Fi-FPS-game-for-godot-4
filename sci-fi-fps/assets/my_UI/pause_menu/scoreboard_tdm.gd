extends Control

var players_nodes_main_nodes_blue:Array[Node]=[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var players_name_blue:Array[String]=[]
var players_name_ui_nodes_blue:Array[Node]=[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var players_kills_blue:Array[int]=[]
var players_kills_ui_nodes_blue:Array[Node]=[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var players_die_blue:Array[int]=[]
var players_die_ui_nodes_blue:Array[Node]=[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]


var players_nodes_main_nodes_red:Array[Node]=[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var players_name_red:Array[String]=[]
var players_name_ui_nodes_red:Array[Node]=[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var players_kills_red:Array[int]=[]
var players_kills_ui_nodes_red:Array[Node]=[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var players_die_red:Array[int]=[]
var players_die_ui_nodes_red:Array[Node]=[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]

var end_timer:float=0
func _ready() -> void:
	visible=true
	players_name_blue=ScoreBoardTDMGlobal.players_name_blue
	players_kills_blue=ScoreBoardTDMGlobal.players_kills_blue
	players_die_blue=ScoreBoardTDMGlobal.players_die_blue
	
	players_name_red=ScoreBoardTDMGlobal.players_name_red
	players_kills_red=ScoreBoardTDMGlobal.players_kills_red
	players_die_red=ScoreBoardTDMGlobal.players_die_red
	
	
	players_nodes_main_nodes_blue[0]=$PanelContainer/MarginContainer/VBoxContainer/blue_player1
	players_nodes_main_nodes_blue[1]=$PanelContainer/MarginContainer/VBoxContainer/blue_player2
	players_nodes_main_nodes_blue[2]=$PanelContainer/MarginContainer/VBoxContainer/blue_player3
	players_nodes_main_nodes_blue[3]=$PanelContainer/MarginContainer/VBoxContainer/blue_player4
	players_nodes_main_nodes_blue[4]=$PanelContainer/MarginContainer/VBoxContainer/blue_player5
	players_nodes_main_nodes_blue[5]=$PanelContainer/MarginContainer/VBoxContainer/blue_player6
	players_nodes_main_nodes_blue[6]=$PanelContainer/MarginContainer/VBoxContainer/blue_player7
	players_nodes_main_nodes_blue[7]=$PanelContainer/MarginContainer/VBoxContainer/blue_player8
	
	players_nodes_main_nodes_red[0]=$PanelContainer/MarginContainer/VBoxContainer/red_player1
	players_nodes_main_nodes_red[1]=$PanelContainer/MarginContainer/VBoxContainer/red_player2
	players_nodes_main_nodes_red[2]=$PanelContainer/MarginContainer/VBoxContainer/red_player3
	players_nodes_main_nodes_red[3]=$PanelContainer/MarginContainer/VBoxContainer/red_player4
	players_nodes_main_nodes_red[4]=$PanelContainer/MarginContainer/VBoxContainer/red_player5
	players_nodes_main_nodes_red[5]=$PanelContainer/MarginContainer/VBoxContainer/red_player6
	players_nodes_main_nodes_red[6]=$PanelContainer/MarginContainer/VBoxContainer/red_player7
	players_nodes_main_nodes_red[7]=$PanelContainer/MarginContainer/VBoxContainer/red_player8
	
	players_name_ui_nodes_blue[0]=$PanelContainer/MarginContainer/VBoxContainer/blue_player1/blue_player
	players_name_ui_nodes_blue[1]=$PanelContainer/MarginContainer/VBoxContainer/blue_player2/blue_player
	players_name_ui_nodes_blue[2]=$PanelContainer/MarginContainer/VBoxContainer/blue_player3/blue_player
	players_name_ui_nodes_blue[3]=$PanelContainer/MarginContainer/VBoxContainer/blue_player4/blue_player
	players_name_ui_nodes_blue[4]=$PanelContainer/MarginContainer/VBoxContainer/blue_player5/blue_player
	players_name_ui_nodes_blue[5]=$PanelContainer/MarginContainer/VBoxContainer/blue_player6/blue_player
	players_name_ui_nodes_blue[6]=$PanelContainer/MarginContainer/VBoxContainer/blue_player7/blue_player
	players_name_ui_nodes_blue[7]=$PanelContainer/MarginContainer/VBoxContainer/blue_player8/blue_player
	
	players_name_ui_nodes_red[0]=$PanelContainer/MarginContainer/VBoxContainer/red_player1/red_player
	players_name_ui_nodes_red[1]=$PanelContainer/MarginContainer/VBoxContainer/red_player2/red_player
	players_name_ui_nodes_red[2]=$PanelContainer/MarginContainer/VBoxContainer/red_player3/red_player
	players_name_ui_nodes_red[3]=$PanelContainer/MarginContainer/VBoxContainer/red_player4/red_player
	players_name_ui_nodes_red[4]=$PanelContainer/MarginContainer/VBoxContainer/red_player5/red_player
	players_name_ui_nodes_red[5]=$PanelContainer/MarginContainer/VBoxContainer/red_player6/red_player
	players_name_ui_nodes_red[6]=$PanelContainer/MarginContainer/VBoxContainer/red_player7/red_player
	players_name_ui_nodes_red[7]=$PanelContainer/MarginContainer/VBoxContainer/red_player8/red_player
	
	players_kills_ui_nodes_blue[0]=$PanelContainer/MarginContainer/VBoxContainer/blue_player1/kills_text
	players_kills_ui_nodes_blue[1]=$PanelContainer/MarginContainer/VBoxContainer/blue_player2/kills_text
	players_kills_ui_nodes_blue[2]=$PanelContainer/MarginContainer/VBoxContainer/blue_player3/kills_text
	players_kills_ui_nodes_blue[3]=$PanelContainer/MarginContainer/VBoxContainer/blue_player4/kills_text
	players_kills_ui_nodes_blue[4]=$PanelContainer/MarginContainer/VBoxContainer/blue_player5/kills_text
	players_kills_ui_nodes_blue[5]=$PanelContainer/MarginContainer/VBoxContainer/blue_player6/kills_text
	players_kills_ui_nodes_blue[6]=$PanelContainer/MarginContainer/VBoxContainer/blue_player7/kills_text
	players_kills_ui_nodes_blue[7]=$PanelContainer/MarginContainer/VBoxContainer/blue_player8/kills_text
	
	players_kills_ui_nodes_red[0]=$PanelContainer/MarginContainer/VBoxContainer/red_player1/kills_text
	players_kills_ui_nodes_red[1]=$PanelContainer/MarginContainer/VBoxContainer/red_player2/kills_text
	players_kills_ui_nodes_red[2]=$PanelContainer/MarginContainer/VBoxContainer/red_player3/kills_text
	players_kills_ui_nodes_red[3]=$PanelContainer/MarginContainer/VBoxContainer/red_player4/kills_text
	players_kills_ui_nodes_red[4]=$PanelContainer/MarginContainer/VBoxContainer/red_player5/kills_text
	players_kills_ui_nodes_red[5]=$PanelContainer/MarginContainer/VBoxContainer/red_player6/kills_text
	players_kills_ui_nodes_red[6]=$PanelContainer/MarginContainer/VBoxContainer/red_player7/kills_text
	players_kills_ui_nodes_red[7]=$PanelContainer/MarginContainer/VBoxContainer/red_player8/kills_text
	
	players_die_ui_nodes_blue[0]=$PanelContainer/MarginContainer/VBoxContainer/blue_player1/die_text
	players_die_ui_nodes_blue[1]=$PanelContainer/MarginContainer/VBoxContainer/blue_player2/die_text
	players_die_ui_nodes_blue[2]=$PanelContainer/MarginContainer/VBoxContainer/blue_player3/die_text
	players_die_ui_nodes_blue[3]=$PanelContainer/MarginContainer/VBoxContainer/blue_player4/die_text
	players_die_ui_nodes_blue[4]=$PanelContainer/MarginContainer/VBoxContainer/blue_player5/die_text
	players_die_ui_nodes_blue[5]=$PanelContainer/MarginContainer/VBoxContainer/blue_player6/die_text
	players_die_ui_nodes_blue[6]=$PanelContainer/MarginContainer/VBoxContainer/blue_player7/die_text
	players_die_ui_nodes_blue[7]=$PanelContainer/MarginContainer/VBoxContainer/blue_player8/die_text
	
	players_die_ui_nodes_red[0]=$PanelContainer/MarginContainer/VBoxContainer/red_player1/die_text
	players_die_ui_nodes_red[1]=$PanelContainer/MarginContainer/VBoxContainer/red_player2/die_text
	players_die_ui_nodes_red[2]=$PanelContainer/MarginContainer/VBoxContainer/red_player3/die_text
	players_die_ui_nodes_red[3]=$PanelContainer/MarginContainer/VBoxContainer/red_player4/die_text
	players_die_ui_nodes_red[4]=$PanelContainer/MarginContainer/VBoxContainer/red_player5/die_text
	players_die_ui_nodes_red[5]=$PanelContainer/MarginContainer/VBoxContainer/red_player6/die_text
	players_die_ui_nodes_red[6]=$PanelContainer/MarginContainer/VBoxContainer/red_player7/die_text
	players_die_ui_nodes_red[7]=$PanelContainer/MarginContainer/VBoxContainer/red_player8/die_text
	
	if players_name_blue.size()==8:
		players_nodes_main_nodes_blue[0].visible=true
		players_nodes_main_nodes_blue[1].visible=true
		players_nodes_main_nodes_blue[2].visible=true
		players_nodes_main_nodes_blue[3].visible=true
		players_nodes_main_nodes_blue[4].visible=true
		players_nodes_main_nodes_blue[5].visible=true
		players_nodes_main_nodes_blue[6].visible=true
		players_nodes_main_nodes_blue[7].visible=true
	if players_name_blue.size()==7:
		players_nodes_main_nodes_blue[0].visible=true
		players_nodes_main_nodes_blue[1].visible=true
		players_nodes_main_nodes_blue[2].visible=true
		players_nodes_main_nodes_blue[3].visible=true
		players_nodes_main_nodes_blue[4].visible=true
		players_nodes_main_nodes_blue[5].visible=true
		players_nodes_main_nodes_blue[6].visible=true
		players_nodes_main_nodes_blue[7].visible=false
	if players_name_blue.size()==6:
		players_nodes_main_nodes_blue[0].visible=true
		players_nodes_main_nodes_blue[1].visible=true
		players_nodes_main_nodes_blue[2].visible=true
		players_nodes_main_nodes_blue[3].visible=true
		players_nodes_main_nodes_blue[4].visible=true
		players_nodes_main_nodes_blue[5].visible=true
		players_nodes_main_nodes_blue[6].visible=false
		players_nodes_main_nodes_blue[7].visible=false
	if players_name_blue.size()==5:
		players_nodes_main_nodes_blue[0].visible=true
		players_nodes_main_nodes_blue[1].visible=true
		players_nodes_main_nodes_blue[2].visible=true
		players_nodes_main_nodes_blue[3].visible=true
		players_nodes_main_nodes_blue[4].visible=true
		players_nodes_main_nodes_blue[5].visible=false
		players_nodes_main_nodes_blue[6].visible=false
		players_nodes_main_nodes_blue[7].visible=false
	if players_name_blue.size()==4:
		players_nodes_main_nodes_blue[0].visible=true
		players_nodes_main_nodes_blue[1].visible=true
		players_nodes_main_nodes_blue[2].visible=true
		players_nodes_main_nodes_blue[3].visible=true
		players_nodes_main_nodes_blue[4].visible=false
		players_nodes_main_nodes_blue[5].visible=false
		players_nodes_main_nodes_blue[6].visible=false
		players_nodes_main_nodes_blue[7].visible=false
	if players_name_blue.size()==3:
		players_nodes_main_nodes_blue[0].visible=true
		players_nodes_main_nodes_blue[1].visible=true
		players_nodes_main_nodes_blue[2].visible=true
		players_nodes_main_nodes_blue[3].visible=false
		players_nodes_main_nodes_blue[4].visible=false
		players_nodes_main_nodes_blue[5].visible=false
		players_nodes_main_nodes_blue[6].visible=false
		players_nodes_main_nodes_blue[7].visible=false
	if players_name_blue.size()==2:
		players_nodes_main_nodes_blue[0].visible=true
		players_nodes_main_nodes_blue[1].visible=true
		players_nodes_main_nodes_blue[2].visible=false
		players_nodes_main_nodes_blue[3].visible=false
		players_nodes_main_nodes_blue[4].visible=false
		players_nodes_main_nodes_blue[5].visible=false
		players_nodes_main_nodes_blue[6].visible=false
		players_nodes_main_nodes_blue[7].visible=false
	if players_name_blue.size()==1:
		players_nodes_main_nodes_blue[0].visible=true
		players_nodes_main_nodes_blue[1].visible=false
		players_nodes_main_nodes_blue[2].visible=false
		players_nodes_main_nodes_blue[3].visible=false
		players_nodes_main_nodes_blue[4].visible=false
		players_nodes_main_nodes_blue[5].visible=false
		players_nodes_main_nodes_blue[6].visible=false
		players_nodes_main_nodes_blue[7].visible=false
	if players_name_blue.size()==0:
		players_nodes_main_nodes_blue[0].visible=false
		players_nodes_main_nodes_blue[1].visible=false
		players_nodes_main_nodes_blue[2].visible=false
		players_nodes_main_nodes_blue[3].visible=false
		players_nodes_main_nodes_blue[4].visible=false
		players_nodes_main_nodes_blue[5].visible=false
		players_nodes_main_nodes_blue[6].visible=false
		players_nodes_main_nodes_blue[7].visible=false
	
	if players_name_red.size()==8:
		players_nodes_main_nodes_red[0].visible=true
		players_nodes_main_nodes_red[1].visible=true
		players_nodes_main_nodes_red[2].visible=true
		players_nodes_main_nodes_red[3].visible=true
		players_nodes_main_nodes_red[4].visible=true
		players_nodes_main_nodes_red[5].visible=true
		players_nodes_main_nodes_red[6].visible=true
		players_nodes_main_nodes_red[7].visible=true
	if players_name_red.size()==7:
		players_nodes_main_nodes_red[0].visible=true
		players_nodes_main_nodes_red[1].visible=true
		players_nodes_main_nodes_red[2].visible=true
		players_nodes_main_nodes_red[3].visible=true
		players_nodes_main_nodes_red[4].visible=true
		players_nodes_main_nodes_red[5].visible=true
		players_nodes_main_nodes_red[6].visible=true
		players_nodes_main_nodes_red[7].visible=false
	if players_name_red.size()==6:
		players_nodes_main_nodes_red[0].visible=true
		players_nodes_main_nodes_red[1].visible=true
		players_nodes_main_nodes_red[2].visible=true
		players_nodes_main_nodes_red[3].visible=true
		players_nodes_main_nodes_red[4].visible=true
		players_nodes_main_nodes_red[5].visible=true
		players_nodes_main_nodes_red[6].visible=false
		players_nodes_main_nodes_red[7].visible=false
	if players_name_red.size()==5:
		players_nodes_main_nodes_red[0].visible=true
		players_nodes_main_nodes_red[1].visible=true
		players_nodes_main_nodes_red[2].visible=true
		players_nodes_main_nodes_red[3].visible=true
		players_nodes_main_nodes_red[4].visible=true
		players_nodes_main_nodes_red[5].visible=false
		players_nodes_main_nodes_red[6].visible=false
		players_nodes_main_nodes_red[7].visible=false
	if players_name_red.size()==4:
		players_nodes_main_nodes_red[0].visible=true
		players_nodes_main_nodes_red[1].visible=true
		players_nodes_main_nodes_red[2].visible=true
		players_nodes_main_nodes_red[3].visible=true
		players_nodes_main_nodes_red[4].visible=false
		players_nodes_main_nodes_red[5].visible=false
		players_nodes_main_nodes_red[6].visible=false
		players_nodes_main_nodes_red[7].visible=false
	if players_name_red.size()==3:
		players_nodes_main_nodes_red[0].visible=true
		players_nodes_main_nodes_red[1].visible=true
		players_nodes_main_nodes_red[2].visible=true
		players_nodes_main_nodes_red[3].visible=false
		players_nodes_main_nodes_red[4].visible=false
		players_nodes_main_nodes_red[5].visible=false
		players_nodes_main_nodes_red[6].visible=false
		players_nodes_main_nodes_red[7].visible=false
	if players_name_red.size()==2:
		players_nodes_main_nodes_red[0].visible=true
		players_nodes_main_nodes_red[1].visible=true
		players_nodes_main_nodes_red[2].visible=false
		players_nodes_main_nodes_red[3].visible=false
		players_nodes_main_nodes_red[4].visible=false
		players_nodes_main_nodes_red[5].visible=false
		players_nodes_main_nodes_red[6].visible=false
		players_nodes_main_nodes_red[7].visible=false
	if players_name_red.size()==1:
		players_nodes_main_nodes_red[0].visible=true
		players_nodes_main_nodes_red[1].visible=false
		players_nodes_main_nodes_red[2].visible=false
		players_nodes_main_nodes_red[3].visible=false
		players_nodes_main_nodes_red[4].visible=false
		players_nodes_main_nodes_red[5].visible=false
		players_nodes_main_nodes_red[6].visible=false
		players_nodes_main_nodes_red[7].visible=false
	if players_name_red.size()==0:
		players_nodes_main_nodes_red[0].visible=false
		players_nodes_main_nodes_red[1].visible=false
		players_nodes_main_nodes_red[2].visible=false
		players_nodes_main_nodes_red[3].visible=false
		players_nodes_main_nodes_red[4].visible=false
		players_nodes_main_nodes_red[5].visible=false
		players_nodes_main_nodes_red[6].visible=false
		players_nodes_main_nodes_red[7].visible=false
	set_score_board()


func set_score_board():
	if players_nodes_main_nodes_blue[0].visible:
		players_name_ui_nodes_blue[0].text=players_name_blue[0]
		players_kills_ui_nodes_blue[0].text=str(players_kills_blue[0])
		players_die_ui_nodes_blue[0].text=str(players_die_blue[0])
	if players_nodes_main_nodes_blue[1].visible:
		players_name_ui_nodes_blue[1].text=players_name_blue[1]
		players_kills_ui_nodes_blue[1].text=str(players_kills_blue[1])
		players_die_ui_nodes_blue[1].text=str(players_die_blue[1])
	if players_nodes_main_nodes_blue[2].visible:
		players_name_ui_nodes_blue[2].text=players_name_blue[2]
		players_kills_ui_nodes_blue[2].text=str(players_kills_blue[2])
		players_die_ui_nodes_blue[2].text=str(players_die_blue[2])
	if players_nodes_main_nodes_blue[3].visible:
		players_name_ui_nodes_blue[3].text=players_name_blue[3]
		players_kills_ui_nodes_blue[3].text=str(players_kills_blue[3])
		players_die_ui_nodes_blue[3].text=str(players_die_blue[3])
	if players_nodes_main_nodes_blue[4].visible:
		players_name_ui_nodes_blue[4].text=players_name_blue[4]
		players_kills_ui_nodes_blue[4].text=str(players_kills_blue[4])
		players_die_ui_nodes_blue[4].text=str(players_die_blue[4])
	if players_nodes_main_nodes_blue[5].visible:
		players_name_ui_nodes_blue[5].text=players_name_blue[5]
		players_kills_ui_nodes_blue[5].text=str(players_kills_blue[5])
		players_die_ui_nodes_blue[5].text=str(players_die_blue[5])
	if players_nodes_main_nodes_blue[6].visible:
		players_name_ui_nodes_blue[6].text=players_name_blue[6]
		players_kills_ui_nodes_blue[6].text=str(players_kills_blue[6])
		players_die_ui_nodes_blue[6].text=str(players_die_blue[6])
	if players_nodes_main_nodes_blue[7].visible:
		players_name_ui_nodes_blue[7].text=players_name_blue[7]
		players_kills_ui_nodes_blue[7].text=str(players_kills_blue[7])
		players_die_ui_nodes_blue[7].text=str(players_die_blue[7])

	if players_nodes_main_nodes_red[0].visible:
		players_name_ui_nodes_red[0].text=players_name_red[0]
		players_kills_ui_nodes_red[0].text=str(players_kills_red[0])
		players_die_ui_nodes_red[0].text=str(players_die_red[0])
	if players_nodes_main_nodes_red[1].visible:
		players_name_ui_nodes_red[1].text=players_name_red[1]
		players_kills_ui_nodes_red[1].text=str(players_kills_red[1])
		players_die_ui_nodes_red[1].text=str(players_die_red[1])
	if players_nodes_main_nodes_red[2].visible:
		players_name_ui_nodes_red[2].text=players_name_red[2]
		players_kills_ui_nodes_red[2].text=str(players_kills_red[2])
		players_die_ui_nodes_red[2].text=str(players_die_red[2])
	if players_nodes_main_nodes_red[3].visible:
		players_name_ui_nodes_red[3].text=players_name_red[3]
		players_kills_ui_nodes_red[3].text=str(players_kills_red[3])
		players_die_ui_nodes_red[3].text=str(players_die_red[3])
	if players_nodes_main_nodes_red[4].visible:
		players_name_ui_nodes_red[4].text=players_name_red[4]
		players_kills_ui_nodes_red[4].text=str(players_kills_red[4])
		players_die_ui_nodes_red[4].text=str(players_die_red[4])
	if players_nodes_main_nodes_red[5].visible:
		players_name_ui_nodes_red[5].text=players_name_red[5]
		players_kills_ui_nodes_red[5].text=str(players_kills_red[5])
		players_die_ui_nodes_red[5].text=str(players_die_red[5])
	if players_nodes_main_nodes_red[6].visible:
		players_name_ui_nodes_red[6].text=players_name_red[6]
		players_kills_ui_nodes_red[6].text=str(players_kills_red[6])
		players_die_ui_nodes_red[6].text=str(players_die_red[6])
	if players_nodes_main_nodes_red[7].visible:
		players_name_ui_nodes_red[7].text=players_name_red[7]
		players_kills_ui_nodes_red[7].text=str(players_kills_red[7])
		players_die_ui_nodes_red[7].text=str(players_die_red[7])
	
	blue_score_ui.text=str(ScoreBoardTDMGlobal.blue_team_score)
	red_score_ui.text=str(ScoreBoardTDMGlobal.red_team_score)
@onready var main_menu_scene:String="res://assets/main_menu/main_menu.tscn"

@onready var blue_score_ui:Node=$PanelContainer/MarginContainer/VBoxContainer/blue_score
@onready var red_score_ui:Node=$PanelContainer/MarginContainer/VBoxContainer/red_score
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

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("mouse_wheel_up"):
		if scale.x>=0.1:
			scale.x+=0.05
			scale.y+=0.05
	if Input.is_action_just_pressed("mouse_wheel_down"):
		if scale.x<=1:
			scale.x-=0.05
			scale.y-=0.05
