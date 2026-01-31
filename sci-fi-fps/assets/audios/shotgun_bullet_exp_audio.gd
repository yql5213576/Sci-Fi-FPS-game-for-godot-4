extends Node3D
var del_id:int=0
func _on_glass_finished() -> void:
	del_id=1


func _on_hit_finished() -> void:
	del_id=2
func _physics_process(delta: float) -> void:
	if del_id==2:
		queue_free()
