extends Node3D
@onready var particle_node_main=$GPUParticles3D
var shoot_point_pos=null
var pos=Vector3()
var rot=Vector3()
func _ready() -> void:
	particle_node_main.restart()

func _physics_process(delta: float) -> void:
	self.position=pos
	self.rotation_degrees=rot
	self.pos=shoot_point_pos.global_position

func _on_gpu_particles_3d_finished() -> void:
	queue_free()
