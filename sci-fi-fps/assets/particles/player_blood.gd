extends Node3D
func _ready() -> void:
	$GPUParticles3D.restart()


func _on_gpu_particles_3d_finished() -> void:
	queue_free()
