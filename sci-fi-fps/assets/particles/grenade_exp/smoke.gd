extends Node3D
#var smoke_amount=0
#var smoke_min_amount=0
#var smoke_max_amount=100
var smoke_tag=""
var scene_root=null
var player_master=null
var smoke_size=0.005
var smoke_min_size=0.005
var smoke_max_size=15

var smoke_speed=0.1
var smoke_min_speed=0.1
var smoke_max_speed=2

var smoke_life_time=0.1
var smoke_min_life_time=0.1
var smoke_max_life_time=2

var smoke_spawn_radius=0
var smoke_min_spawn_radius=0
var smoke_max_spawn_radius=10

var trigger_size_max=Vector3(7.365,7.365,7.365)
var trigger_size_min=Vector3(1,1,1)

var model_file=preload("res://assets/particles/grenade_exp/smoke_model.tres").duplicate()
var particle_material_file=preload("res://assets/particles/grenade_exp/smoke_pm.tres").duplicate()
var timer=0

var g_mod=null
@onready var particle_node=$GPUParticles3D
@onready var area_col_node=$Area3D/CollisionShape3D
@onready var area_node=$Area3D
func _ready() -> void: 
	particle_node.emitting=true
	particle_node.draw_pass_1=model_file
	#particle_node.amount=smoke_min_amount
	model_file.set_size(Vector2(smoke_min_size,smoke_min_size))
	particle_node.speed_scale=smoke_min_speed
	particle_node.lifetime=smoke_min_life_time
	particle_material_file.emission_sphere_radius=smoke_min_spawn_radius
func _physics_process(delta: float) -> void:
	timer+=delta
	self.global_position=g_mod.global_position
	#particle_node.amount=smoke_amount
	model_file.set_size(Vector2(smoke_size,smoke_size))
	particle_node.speed_scale=smoke_speed
	particle_node.lifetime=smoke_life_time
	particle_material_file.emission_sphere_radius=smoke_spawn_radius
	

	#smoke_amount=Vector2(smoke_amount,0).lerp(Vector2(smoke_max_amount,0),0.01).x
	if timer<40:
		smoke_size=Vector2(smoke_size,0).lerp(Vector2(smoke_max_size,0),0.001).x
		smoke_speed=Vector2(smoke_speed,0).lerp(Vector2(smoke_max_speed,0),0.01).x
		smoke_life_time=Vector2(smoke_life_time,0).lerp(Vector2(smoke_max_life_time,0),0.01).x
		smoke_spawn_radius=Vector2(smoke_spawn_radius,0).lerp(Vector2(smoke_max_spawn_radius,0),0.01).x
		area_col_node.scale=area_col_node.scale.lerp(trigger_size_max,0.001)
	if timer>=50:
		smoke_size=Vector2(smoke_size,0).lerp(Vector2(smoke_min_size,0),0.01).x
		smoke_speed=Vector2(smoke_speed,0).lerp(Vector2(smoke_min_speed,0),0.01).x
		smoke_life_time=Vector2(smoke_life_time,0).lerp(Vector2(smoke_min_life_time,0),0.001).x
		smoke_spawn_radius=Vector2(smoke_spawn_radius,0).lerp(Vector2(smoke_min_spawn_radius,0),0.01).x
		area_col_node.scale=area_col_node.scale.lerp(trigger_size_min,0.001)
	if timer>=65:
		particle_node.emitting=false
		area_col_node.disabled=true
	if timer>=70:
		g_mod.queue_free()
		queue_free()
		
	if area_node.has_overlapping_bodies():
		for sm in area_node.get_overlapping_bodies():
			if sm.has_method("smoke_my_eyes"):
				sm.smoke_my_eyes()
	#print(self," ","amount=",particle_node.amount," ","size=",particle_node.draw_pass_1.get_size()," ","speed=",particle_node.speed_scale," ","life_time=",particle_node.lifetime," ","radius=",particle_material_file.emission_sphere_radius)
