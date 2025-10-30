extends RigidBody3D
@onready var fire=$grenade_fire
@onready var smoke=$grenade_smoke
@onready var flash=$grenade_flash

var using_grenade=""
var timer=0
var exp_time=3
var scene_root=null
var player_master=null
var explode=false
func _ready() -> void:
	if using_grenade=="fire":
		$grenade_fire.visible=true
		$grenade_smoke.visible=false
		$grenade_flash.visible=false
	if using_grenade=="smoke":
		$grenade_fire.visible=false
		$grenade_smoke.visible=true
		$grenade_flash.visible=false
	if using_grenade=="flash":
		$grenade_fire.visible=false
		$grenade_smoke.visible=false
		$grenade_flash.visible=true



func _physics_process(delta: float) -> void:
	if explode==false:
		timer+=delta
	if timer>=exp_time:
		explode=true
		timer=0
		if using_grenade=="fire":
			var grenade_rig=preload("res://assets/particles/grenade_exp/grenade_exp.tscn").duplicate()
			var gr=grenade_rig.instantiate()
			gr.scene_root=scene_root
			gr.player_master=player_master
			gr.position=self.global_position
			player_master.bullets.append(self)
			player_master.bullets.append(gr)
			scene_root.add_child(gr)
			queue_free()
		if using_grenade=="smoke":
			var grenade_rig=preload("res://assets/particles/grenade_exp/smoke.tscn").duplicate()
			var gr=grenade_rig.instantiate()
			gr.scene_root=scene_root
			gr.position=self.global_position
			gr.g_mod=self
			scene_root.add_child(gr)
			player_master.bullets.append(self)
			player_master.bullets.append(gr)
		if using_grenade=="flash":
			var grenade_rig=preload("res://assets/particles/grenade_exp/flash.tscn").duplicate()
			var gr=grenade_rig.instantiate()
			gr.scene_root=scene_root
			gr.position=self.global_position
			scene_root.add_child(gr)
			player_master.bullets.append(self)
			player_master.bullets.append(gr)
			queue_free()
