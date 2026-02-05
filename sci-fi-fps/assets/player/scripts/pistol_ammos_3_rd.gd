extends Node3D
var speed:float=0
var trail:Node=null

var ready_to_scene:bool=false
func _physics_process(delta: float) -> void:
	translate(Vector3(0,0,speed*delta))
	if trail!=null:
		look_at(trail.global_position,Vector3.UP,true)
	
	if ready_to_scene==false:
		if UserData.texture_size_data==256:
			var ammo:Resource=preload("res://assets/materials_prefab/pistol/ammo/256/ammo.tres")
			$ammo_pistol.set_surface_override_material(0,ammo)
		if UserData.texture_size_data==512:
			var ammo:Resource=preload("res://assets/materials_prefab/pistol/ammo/512/ammo.tres")
			$ammo_pistol.set_surface_override_material(0,ammo)
		if UserData.texture_size_data==1024:
			var ammo:Resource=preload("res://assets/materials_prefab/pistol/ammo/1024/ammo.tres")
			$ammo_pistol.set_surface_override_material(0,ammo)
		ready_to_scene=true
