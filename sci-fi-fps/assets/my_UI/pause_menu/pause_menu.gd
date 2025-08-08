extends Control
@onready var player_master_3rd=$"../../..".player_master
@onready var player_master_1st=$"../../.."
func _ready() -> void:
	pass

@onready var label_resume_label=preload("res://assets/my_UI/pause_menu/label_assets/resume_label_settings.tres")
func _on_label_resume_mouse_entered() -> void:
	label_resume_label.font_color=Color(0,0.6,0.8)


func _on_label_resume_mouse_exited() -> void:
	label_resume_label.font_color=Color(1,1,1,1)

@onready var label_restart_label=preload("res://assets/my_UI/pause_menu/label_assets/restart_label_settings.tres")
func _on_label_restart_mouse_entered() -> void:
	label_restart_label.font_color=Color(0,0.6,0.8)


func _on_label_restart_mouse_exited() -> void:
	label_restart_label.font_color=Color(1,1,1,1)



@onready var label_change_class_label=preload("res://assets/my_UI/pause_menu/label_assets/change_class_label_settings.tres")
func _on_label_change_mouse_entered() -> void:
	label_change_class_label.font_color=Color(0,0.6,0.8)


func _on_label_change_mouse_exited() -> void:
	label_change_class_label.font_color=Color(1,1,1,1)



@onready var label_quit_label=preload("res://assets/my_UI/pause_menu/label_assets/quit_label_settings.tres")
func _on_label_quit_mouse_entered() -> void:
	label_quit_label.font_color=Color(0,0.6,0.8)


func _on_label_quit_mouse_exited() -> void:
	label_quit_label.font_color=Color(1,1,1,1)



@onready var label_shutdown_label=preload("res://assets/my_UI/pause_menu/label_assets/shutdown_label_settings.tres")
func _on_label_shutdown_mouse_entered() -> void:
	label_shutdown_label.font_color=Color(0,0.6,0.8)


func _on_label_shutdown_mouse_exited() -> void:
	label_shutdown_label.font_color=Color(1,1,1,1)

#weapon_class
func _on_class_1_mouse_entered() -> void:
	$weapons_change_class2/MarginContainer/VBoxContainer/class1.modulate=Color(0,0.7,0.9)


func _on_class_1_mouse_exited() -> void:
	$weapons_change_class2/MarginContainer/VBoxContainer/class1.modulate=Color(1,1,1,1)


func _on_class_2_mouse_entered() -> void:
	$weapons_change_class2/MarginContainer/VBoxContainer/class2.modulate=Color(0,0.7,0.9)


func _on_class_2_mouse_exited() -> void:
	$weapons_change_class2/MarginContainer/VBoxContainer/class2.modulate=Color(1,1,1,1)


func _on_class_3_mouse_entered() -> void:
	$weapons_change_class2/MarginContainer/VBoxContainer/class3.modulate=Color(0,0.7,0.9)


func _on_class_3_mouse_exited() -> void:
	$weapons_change_class2/MarginContainer/VBoxContainer/class3.modulate=Color(1,1,1,1)


func _on_class_4_mouse_entered() -> void:
	$weapons_change_class2/MarginContainer/VBoxContainer/class4.modulate=Color(0,0.7,0.9)


func _on_class_4_mouse_exited() -> void:
	$weapons_change_class2/MarginContainer/VBoxContainer/class4.modulate=Color(1,1,1,1)


func _on_class_5_mouse_entered() -> void:
	$weapons_change_class2/MarginContainer/VBoxContainer/class5.modulate=Color(0,0.7,0.9)


func _on_class_5_mouse_exited() -> void:
	$weapons_change_class2/MarginContainer/VBoxContainer/class5.modulate=Color(1,1,1,1)
#weapon_class

#input_mouse-------button_panel
func _on_label_resume_gui_input(event: InputEvent) -> void:
	if $button_panel.visible==true:
		if event is InputEventMouseButton and event.pressed:
				match event.button_index:
					MOUSE_BUTTON_LEFT:
						player_master_1st.ui_animation_tree["parameters/pause_state/transition_request"]="continue"
						await get_tree().create_timer(0.5).timeout
						get_tree().paused=false

func _on_label_restart_gui_input(event: InputEvent) -> void:
	if $button_panel.visible==true:
		if event is InputEventMouseButton and event.pressed:
				match event.button_index:
					MOUSE_BUTTON_LEFT:
						get_tree().paused=false
						get_tree().reload_current_scene()

func _on_label_change_gui_input(event: InputEvent) -> void:
	if $button_panel.visible==true:
		if event is InputEventMouseButton and event.pressed:
				match event.button_index:
					MOUSE_BUTTON_LEFT:
						if $weapons_change_class2.visible==false:
							$weapons_change_class2.visible=true
							$button_panel.visible=false
@onready var main_menu="res://assets/main_menu/main_menu.tscn"
var BMM=false
func back_main_menu():
	var progress=[]
	ResourceLoader.load_threaded_request(main_menu)
	ResourceLoader.load_threaded_get_status(main_menu,progress)
	if progress[0]==1:
		var packed_scene=ResourceLoader.load_threaded_get(main_menu)
		get_tree().change_scene_to_packed(packed_scene)

func _process(delta: float) -> void:
	if BMM:
		back_main_menu()

func _on_label_quit_gui_input(event: InputEvent) -> void:
	if $button_panel.visible==true:
		if event is InputEventMouseButton and event.pressed:
				match event.button_index:
					MOUSE_BUTTON_LEFT:
						$button_panel.visible=false
						BMM=true

func _on_label_shutdown_gui_input(event: InputEvent) -> void:
	if $button_panel.visible==true:
		if event is InputEventMouseButton and event.pressed:
				match event.button_index:
					MOUSE_BUTTON_LEFT:
						get_tree().quit()

#input_mouse-------weapon_class_change

func _on_class_1_gui_input(event: InputEvent) -> void:
	if $weapons_change_class2.visible==true:
		if event is InputEventMouseButton and event.pressed:
				match event.button_index:
					MOUSE_BUTTON_LEFT:
						player_master_1st.player_master.set_weapon_type("rifle_man")

func _on_class_2_gui_input(event: InputEvent) -> void:
	if $weapons_change_class2.visible==true:
		if event is InputEventMouseButton and event.pressed:
				match event.button_index:
					MOUSE_BUTTON_LEFT:
						player_master_1st.player_master.set_weapon_type("smg_man")

func _on_class_3_gui_input(event: InputEvent) -> void:
	if $weapons_change_class2.visible==true:
		if event is InputEventMouseButton and event.pressed:
				match event.button_index:
					MOUSE_BUTTON_LEFT:
						player_master_1st.player_master.set_weapon_type("shotgun_man")

func _on_class_4_gui_input(event: InputEvent) -> void:
	if $weapons_change_class2.visible==true:
		if event is InputEventMouseButton and event.pressed:
				match event.button_index:
					MOUSE_BUTTON_LEFT:
						player_master_1st.player_master.set_weapon_type("sniper_man")

func _on_class_5_gui_input(event: InputEvent) -> void:
	if $weapons_change_class2.visible==true:
		if event is InputEventMouseButton and event.pressed:
				match event.button_index:
					MOUSE_BUTTON_LEFT:
						player_master_1st.player_master.set_weapon_type("machine_gun_man")

func _on_button__wp_cancel_button_down() -> void:
	if $weapons_change_class2.visible==true:
		$weapons_change_class2.visible=false
		$button_panel.visible=true
