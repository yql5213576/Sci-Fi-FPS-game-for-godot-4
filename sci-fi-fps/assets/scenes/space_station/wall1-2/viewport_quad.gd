extends MeshInstance3D
func _ready() -> void:
	# Clear the viewport.
	var viewport:SubViewport=$"../SubViewport"
	viewport.render_target_clear_mode = SubViewport.CLEAR_MODE_ONCE
	self.material_override.albedo_texture=viewport.get_texture()
