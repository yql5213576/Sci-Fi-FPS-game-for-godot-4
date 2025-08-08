extends Node3D
var end=0
func _ready() -> void:
	$GPUParticles3D.restart()
	$GPUParticles3D/GPUParticles3D2.restart()

func _on_gpu_particles_3d_finished() -> void:
	end=1

func _process(delta: float) -> void:
	if end==2:
		queue_free()


func _on_gpu_particles_3d_2_finished() -> void:
	end=2
