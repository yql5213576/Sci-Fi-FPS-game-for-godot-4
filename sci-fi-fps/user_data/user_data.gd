extends Node
var user_name_data=""
var kills_data=""
var kills_data_n=0
var death_data=""
var death_data_n=0

var favorite_data=""
var favorite_list=[]
var favorite_wp_name_list=["rifle","smg","sniper","shotgun","machine_gun"]
var favorite_data_rifle=0
var favorite_data_smg=0
var favorite_data_sniper=0
var favorite_data_shotgun=0
var favorite_data_machine_gun=0


var rank_data=""
var rank_data_n=0
var battles_data=""
var battles_data_n=0

var reslution_vec_data=DisplayServer.screen_get_size()
var vsync_data=DisplayServer.VSYNC_ENABLED
var anti_aliasing_msaa_data=Viewport.MSAA_4X
var anti_aliasing_fxaa_data=Viewport.SCREEN_SPACE_AA_DISABLED
var ssao_data=true
var ssil_data=true
var sdfgi_data=true
var glow_data=true
var volumetric_fog_data=true

var mouse_seveitivity_data=0.08
var crosshair_data=0.125

var grass_density=0


var reslution_vec_data_default=DisplayServer.screen_get_size()
var vsync_data_default=DisplayServer.VSYNC_ENABLED
var anti_aliasing_msaa_data_default=Viewport.MSAA_4X
var anti_aliasing_fxaa_data_default=Viewport.SCREEN_SPACE_AA_DISABLED
var ssao_data_default=true
var ssil_data_default=true
var sdfgi_data_default=true
var glow_data_default=true
var volumetric_fog_data_default=true

var mouse_seveitivity_data_default=0.08
var crosshair_data_default=0.125

var grass_density_default=0


func _ready() -> void:
	pass
		

func _process(delta: float) -> void:
	favorite_list=[favorite_data_rifle,favorite_data_smg,favorite_data_sniper,favorite_data_shotgun,favorite_data_machine_gun]
	kills_data=str(kills_data_n)
	death_data=str(death_data_n)
	favorite_data=favorite_wp_name_list[favorite_list.find(favorite_list.max())]
	
	if kills_data_n%100==0:
		rank_data_n=kills_data_n/100
	rank_data=str(rank_data_n)
	battles_data=str(battles_data_n)


func user_data_save():
	var file_user_rank=FileAccess.open("user://SaveUser.data",FileAccess.WRITE)
	file_user_rank.store_var(user_name_data)
	file_user_rank.store_var(kills_data)
	file_user_rank.store_var(kills_data_n)
	file_user_rank.store_var(death_data)
	file_user_rank.store_var(death_data_n)
	file_user_rank.store_var(favorite_data)
	file_user_rank.store_var(favorite_list)
	file_user_rank.store_var(favorite_wp_name_list)
	file_user_rank.store_var(favorite_data_rifle)
	file_user_rank.store_var(favorite_data_smg)
	file_user_rank.store_var(favorite_data_sniper)
	file_user_rank.store_var(favorite_data_shotgun)
	file_user_rank.store_var(favorite_data_machine_gun)
	file_user_rank.store_var(rank_data)
	file_user_rank.store_var(rank_data_n)
	file_user_rank.store_var(battles_data)
	file_user_rank.store_var(battles_data_n)
	file_user_rank.close()
func user_data_load():
	var file_user_rank=FileAccess.open("user://SaveUser.data",FileAccess.READ)
	user_name_data=file_user_rank.get_var()
	kills_data=file_user_rank.get_var()
	kills_data_n=file_user_rank.get_var()
	death_data=file_user_rank.get_var()
	death_data_n=file_user_rank.get_var()
	favorite_data=file_user_rank.get_var()
	favorite_list=file_user_rank.get_var()
	favorite_wp_name_list=file_user_rank.get_var()
	favorite_data_rifle=file_user_rank.get_var()
	favorite_data_smg=file_user_rank.get_var()
	favorite_data_sniper=file_user_rank.get_var()
	favorite_data_shotgun=file_user_rank.get_var()
	favorite_data_machine_gun=file_user_rank.get_var()
	rank_data=file_user_rank.get_var()
	rank_data_n=file_user_rank.get_var()
	battles_data=file_user_rank.get_var()
	battles_data_n=file_user_rank.get_var()
	file_user_rank.close()

func user_options_save():
	var file_user_options=FileAccess.open("user://SaveOptions.data",FileAccess.WRITE)
	file_user_options.store_var(reslution_vec_data)
	file_user_options.store_var(vsync_data)
	file_user_options.store_var(anti_aliasing_msaa_data)
	file_user_options.store_var(anti_aliasing_fxaa_data)
	file_user_options.store_var(ssao_data)
	file_user_options.store_var(ssil_data)
	file_user_options.store_var(sdfgi_data)
	file_user_options.store_var(glow_data)
	file_user_options.store_var(volumetric_fog_data)
	file_user_options.store_var(mouse_seveitivity_data)
	file_user_options.store_var(crosshair_data)
	file_user_options.store_var(grass_density)
	file_user_options.store_var(reslution_vec_data_default)
	file_user_options.store_var(vsync_data_default)
	file_user_options.store_var(anti_aliasing_msaa_data_default)
	file_user_options.store_var(anti_aliasing_fxaa_data_default)
	file_user_options.store_var(ssao_data_default)
	file_user_options.store_var(ssil_data_default)
	file_user_options.store_var(sdfgi_data_default)
	file_user_options.store_var(glow_data_default)
	file_user_options.store_var(volumetric_fog_data_default)
	file_user_options.store_var(mouse_seveitivity_data_default)
	file_user_options.store_var(crosshair_data_default)
	file_user_options.store_var(grass_density_default)
	file_user_options.close()
func user_options_load():
	var file_user_options=FileAccess.open("user://SaveOptions.data",FileAccess.READ)
	reslution_vec_data=file_user_options.get_var()
	vsync_data=file_user_options.get_var()
	anti_aliasing_msaa_data=file_user_options.get_var()
	anti_aliasing_fxaa_data=file_user_options.get_var()
	ssao_data=file_user_options.get_var()
	ssil_data=file_user_options.get_var()
	sdfgi_data=file_user_options.get_var()
	glow_data=file_user_options.get_var()
	volumetric_fog_data=file_user_options.get_var()
	mouse_seveitivity_data=file_user_options.get_var()
	crosshair_data=file_user_options.get_var()
	grass_density=file_user_options.get_var()
	reslution_vec_data_default=file_user_options.get_var()
	vsync_data_default=file_user_options.get_var()
	anti_aliasing_msaa_data_default=file_user_options.get_var()
	anti_aliasing_fxaa_data_default=file_user_options.get_var()
	ssao_data_default=file_user_options.get_var()
	ssil_data_default=file_user_options.get_var()
	sdfgi_data_default=file_user_options.get_var()
	glow_data_default=file_user_options.get_var()
	volumetric_fog_data_default=file_user_options.get_var()
	mouse_seveitivity_data_default=file_user_options.get_var()
	crosshair_data_default=file_user_options.get_var()
	grass_density_default=file_user_options.get_var()
	file_user_options.close()
