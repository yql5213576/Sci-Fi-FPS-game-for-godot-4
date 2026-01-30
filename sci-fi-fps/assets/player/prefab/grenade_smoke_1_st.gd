extends Node3D
var player_models:Array[Node]=[]
func _ready() -> void:
	player_models.append($body)
	player_models.append($body/switch)
	
	for pm in range(player_models.size()):
		player_models[pm].set_cast_shadows_setting(0)

var ready_to_scene:bool=false
func _physics_process(delta: float) -> void:
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var body_material:Resource=preload("res://assets/materials_prefab/grenade/smoke/256/body.tres")
			var switch_material:Resource=preload("res://assets/materials_prefab/grenade/smoke/256/switch.tres")
			$body.set_surface_override_material(0,body_material)
			$body/switch.set_surface_override_material(0,switch_material)
		if UserData.texture_size_data==512:
			var body_material:Resource=preload("res://assets/materials_prefab/grenade/smoke/512/body.tres")
			var switch_material:Resource=preload("res://assets/materials_prefab/grenade/smoke/512/switch.tres")
			$body.set_surface_override_material(0,body_material)
			$body/switch.set_surface_override_material(0,switch_material)
		if UserData.texture_size_data==1024:
			var body_material:Resource=preload("res://assets/materials_prefab/grenade/smoke/1024/body.tres")
			var switch_material:Resource=preload("res://assets/materials_prefab/grenade/smoke/1024/switch.tres")
			$body.set_surface_override_material(0,body_material)
			$body/switch.set_surface_override_material(0,switch_material)
			
		ready_to_scene=true
