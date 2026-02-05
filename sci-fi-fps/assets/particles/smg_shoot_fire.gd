extends Node3D

@onready var particle_node_main1:Node=$GPUParticles3D
@onready var particle_node_main2:Node=$GPUParticles3D2
var one:bool=false
var two:bool=false
var shoot_point_pos:Node=null
var pos:Vector3=Vector3()
var rot:Vector3=Vector3()
func _on_gpu_particles_3d_finished() -> void:
	one=true


func _on_gpu_particles_3d_2_finished() -> void:
	two=true
	
func _process(delta: float) -> void:
	if one&&two:
		queue_free()

func _ready() -> void:
	particle_node_main1.restart()
	particle_node_main2.restart()

func _physics_process(delta: float) -> void:
	self.position=pos
	self.rotation_degrees=rot
	self.pos=shoot_point_pos.global_position
