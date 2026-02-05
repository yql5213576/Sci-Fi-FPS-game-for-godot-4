extends RigidBody3D
@onready var fire:Node=$grenade_fire
@onready var smoke:Node=$grenade_smoke
@onready var flash:Node=$grenade_flash

var using_grenade:String=""
var timer:float=0
var exp_time:float=3
var scene_root:Node=null
var player_master:Node=null
var explode:bool=false
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


var ready_to_scene:bool=false

func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var fire_body_material:Resource=preload("res://assets/materials_prefab/grenade/fire/256/body.tres")
			var fire_switch_material:Resource=preload("res://assets/materials_prefab/grenade/fire/256/switch.tres")
			var smoke_body_material:Resource=preload("res://assets/materials_prefab/grenade/smoke/256/body.tres")
			var smoke_switch_material:Resource=preload("res://assets/materials_prefab/grenade/smoke/256/switch.tres")
			var flash_body_material:Resource=preload("res://assets/materials_prefab/grenade/flash/256/body.tres")
			var flash_switch_material:Resource=preload("res://assets/materials_prefab/grenade/flash/256/switch.tres")
			$grenade_fire/body.set_surface_override_material(0,fire_body_material)
			$grenade_fire/body/switch.set_surface_override_material(0,fire_switch_material)
			$grenade_smoke/body.set_surface_override_material(0,smoke_body_material)
			$grenade_smoke/body/switch.set_surface_override_material(0,smoke_switch_material)
			$grenade_flash/body.set_surface_override_material(0,flash_body_material)
			$grenade_flash/body/switch.set_surface_override_material(0,flash_switch_material)
		if UserData.texture_size_data==512:
			var fire_body_material:Resource=preload("res://assets/materials_prefab/grenade/fire/512/body.tres")
			var fire_switch_material:Resource=preload("res://assets/materials_prefab/grenade/fire/512/switch.tres")
			var smoke_body_material:Resource=preload("res://assets/materials_prefab/grenade/smoke/512/body.tres")
			var smoke_switch_material:Resource=preload("res://assets/materials_prefab/grenade/smoke/512/switch.tres")
			var flash_body_material:Resource=preload("res://assets/materials_prefab/grenade/flash/512/body.tres")
			var flash_switch_material:Resource=preload("res://assets/materials_prefab/grenade/flash/512/switch.tres")
			$grenade_fire/body.set_surface_override_material(0,fire_body_material)
			$grenade_fire/body/switch.set_surface_override_material(0,fire_switch_material)
			$grenade_smoke/body.set_surface_override_material(0,smoke_body_material)
			$grenade_smoke/body/switch.set_surface_override_material(0,smoke_switch_material)
			$grenade_flash/body.set_surface_override_material(0,flash_body_material)
			$grenade_flash/body/switch.set_surface_override_material(0,flash_switch_material)
		if UserData.texture_size_data==1024:
			var fire_body_material:Resource=preload("res://assets/materials_prefab/grenade/fire/1024/body.tres")
			var fire_switch_material:Resource=preload("res://assets/materials_prefab/grenade/fire/1024/switch.tres")
			var smoke_body_material:Resource=preload("res://assets/materials_prefab/grenade/smoke/1024/body.tres")
			var smoke_switch_material:Resource=preload("res://assets/materials_prefab/grenade/smoke/1024/switch.tres")
			var flash_body_material:Resource=preload("res://assets/materials_prefab/grenade/flash/1024/body.tres")
			var flash_switch_material:Resource=preload("res://assets/materials_prefab/grenade/flash/1024/switch.tres")
			$grenade_fire/body.set_surface_override_material(0,fire_body_material)
			$grenade_fire/body/switch.set_surface_override_material(0,fire_switch_material)
			$grenade_smoke/body.set_surface_override_material(0,smoke_body_material)
			$grenade_smoke/body/switch.set_surface_override_material(0,smoke_switch_material)
			$grenade_flash/body.set_surface_override_material(0,flash_body_material)
			$grenade_flash/body/switch.set_surface_override_material(0,flash_switch_material)
			
		ready_to_scene=true
	
	if explode==false:
		timer+=delta
	if timer>=exp_time:
		explode=true
		timer=0
		if using_grenade=="fire":
			var grenade_rig:Resource=preload("res://assets/particles/grenade_exp/grenade_exp.tscn").duplicate()
			var gr:Node=grenade_rig.instantiate()
			gr.scene_root=scene_root
			gr.player_master=player_master
			gr.position=self.global_position
			player_master.bullets.append(self)
			player_master.bullets.append(gr)
			scene_root.add_child(gr)
			queue_free()
		if using_grenade=="smoke":
			var grenade_rig:Resource=preload("res://assets/particles/grenade_exp/smoke.tscn").duplicate()
			var gr:Node=grenade_rig.instantiate()
			gr.scene_root=scene_root
			gr.position=self.global_position
			gr.g_mod=self
			scene_root.add_child(gr)
			player_master.bullets.append(self)
			player_master.bullets.append(gr)
		if using_grenade=="flash":
			var grenade_rig:Resource=preload("res://assets/particles/grenade_exp/flash.tscn").duplicate()
			var gr:Node=grenade_rig.instantiate()
			gr.scene_root=scene_root
			gr.position=self.global_position
			scene_root.add_child(gr)
			player_master.bullets.append(self)
			player_master.bullets.append(gr)
			queue_free()
