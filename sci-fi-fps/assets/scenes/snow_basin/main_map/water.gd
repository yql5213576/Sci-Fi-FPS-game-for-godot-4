extends MeshInstance3D

@onready var water_texture_1=$Decal
@onready var water_texture_2=$Decal2

func _physics_process(delta: float) -> void:
	water_texture_1.position.z+=0.03*delta
	water_texture_2.position.z+=0.03*delta
	
	if water_texture_1.position.z>=1.096:
		water_texture_1.position.z=-0.001
	if water_texture_2.position.z>=1.096:
		water_texture_2.position.z=-1.848
