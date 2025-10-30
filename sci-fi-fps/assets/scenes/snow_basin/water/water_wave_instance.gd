extends Node3D

var over=false
var timer=0
var num=0
var water_height=10

var wave_timer=0
var wave_over=false
var wwism1=preload("res://assets/scenes/snow_basin/water/water_wave_instance_process_material(1).tres").duplicate()
var wwism2=preload("res://assets/scenes/snow_basin/water/water_wave_instance_process_material(2).tres").duplicate()
func _ready() -> void:
	$water_smoke/GPUParticles3D.process_material=wwism1
	$water_smoke/GPUParticles3D2.process_material=wwism2
	$water_smoke/GPUParticles3D.visible=true
	$water_smoke/GPUParticles3D.emitting=true
	$water_smoke/GPUParticles3D.process_material.gravity.y=0
	$water_smoke/GPUParticles3D2.process_material.gravity.y=0
	self.rotation_degrees=Vector3(0,0,0)
	self.global_rotation_degrees==Vector3(0,0,0)
func _physics_process(delta: float) -> void:
	self.rotation_degrees=Vector3(0,0,0)
	self.global_rotation_degrees==Vector3(0,0,0)
	$wave.size.x+=0.08
	$wave.size.z+=0.08
	$wave.modulate=$wave.modulate.lerp(Color(0.0, 0.0, 0.0, 0.0),0.004)
	wave_timer+=delta
	if wave_timer>=8:
		wave_over=true
	timer+=delta
	if timer<0.05:
		$water_smoke/GPUParticles3D.process_material.gravity=$water_smoke/GPUParticles3D.process_material.gravity.lerp(Vector3(0,water_height,0),0.3)
		$water_smoke/GPUParticles3D2.process_material.gravity=$water_smoke/GPUParticles3D2.process_material.gravity.lerp(Vector3(0,water_height,0),0.3)
		
	if timer>=0.05:
		$water_smoke/GPUParticles3D2.visible=true
		$water_smoke/GPUParticles3D2.emitting=true
		
	if timer>=0.2:
		$water_smoke/GPUParticles3D.process_material.gravity=$water_smoke/GPUParticles3D.process_material.gravity.lerp(Vector3(0,0,0),0.3)
		$water_smoke/GPUParticles3D2.process_material.gravity=$water_smoke/GPUParticles3D2.process_material.gravity.lerp(Vector3(0,0,0),0.3)
		
	if timer>=0.4:
		$water_smoke/GPUParticles3D.emitting=false
		
	if timer>=0.5:
		$water_smoke/GPUParticles3D2.emitting=false
		num=2
		
		
	if num==2&&wave_over==true:
		queue_free()
		timer=0
