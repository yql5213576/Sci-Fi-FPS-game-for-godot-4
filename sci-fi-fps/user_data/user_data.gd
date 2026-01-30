extends Node
var user_name_data:String=""
var kills_data:String=""
var kills_data_n:int=0
var death_data:String=""
var death_data_n:int=0

var favorite_data:String=""
var favorite_list:Array[int]=[]
var favorite_wp_name_list:Array[String]=["rifle","smg","sniper","shotgun","machine_gun"]
var favorite_data_rifle:int=0
var favorite_data_smg:int=0
var favorite_data_sniper:int=0
var favorite_data_shotgun:int=0
var favorite_data_machine_gun:int=0


var rank_data:String=""
var rank_data_n:int=0
var battles_data:String=""
var battles_data_n:int=0

var reslution_vec_data:Vector2i=DisplayServer.screen_get_size()
var vsync_data:DisplayServer.VSyncMode=DisplayServer.VSYNC_ENABLED
var anti_aliasing_msaa_data:Viewport.MSAA=Viewport.MSAA_4X
var ssao_data:bool=true
var ssil_data:bool=true
var sdfgi_data:bool=false
var ssr_data:bool=true
var voxelgi_data:bool=true
var glow_data:bool=true
var volumetric_fog_data:bool=true
var mouse_seveitivity_data:float=0.08
var crosshair_data:float=0.125
var grass_density:int=0
var lod_data:float=1
var render_resolution_data:float=1
var language_data:String="chinese"
var texture_size_data:int=1024


var reslution_vec_data_default:Vector2i=DisplayServer.screen_get_size()
var vsync_data_default:DisplayServer.VSyncMode=DisplayServer.VSYNC_ENABLED
var anti_aliasing_msaa_data_default:Viewport.MSAA=Viewport.MSAA_4X
var ssao_data_default:bool=true
var ssil_data_default:bool=true
var sdfgi_data_default:bool=false
var ssr_data_default:bool=false
var voxelgi_data_default:bool=true
var glow_data_default:bool=true
var volumetric_fog_data_default:bool=true
var mouse_seveitivity_data_default:float=0.08
var crosshair_data_default:float=0.125
var grass_density_default:int=2
var lod_data_default:float=1
var render_resolution_data_default:float=1.00
var language_data_default:String="chinese"
var texture_size_data_default:int=1024


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
	var file_user_rank:FileAccess=FileAccess.open("user://SaveUser0.3.data",FileAccess.WRITE)
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
	var file_user_rank:FileAccess=FileAccess.open("user://SaveUser0.3.data",FileAccess.READ)
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
	var file_user_options:FileAccess=FileAccess.open("user://SaveOptions0.4.data",FileAccess.WRITE)
	file_user_options.store_var(reslution_vec_data)
	file_user_options.store_var(vsync_data)
	file_user_options.store_var(anti_aliasing_msaa_data)
	file_user_options.store_var(ssao_data)
	file_user_options.store_var(ssil_data)
	file_user_options.store_var(sdfgi_data)
	file_user_options.store_var(ssr_data)
	file_user_options.store_var(glow_data)
	file_user_options.store_var(volumetric_fog_data)
	file_user_options.store_var(mouse_seveitivity_data)
	file_user_options.store_var(crosshair_data)
	file_user_options.store_var(grass_density)
	file_user_options.store_var(voxelgi_data)
	file_user_options.store_var(lod_data)
	file_user_options.store_var(render_resolution_data)
	file_user_options.store_var(language_data)
	file_user_options.store_var(texture_size_data)
	file_user_options.close()
func user_options_load():
	var file_user_options:FileAccess=FileAccess.open("user://SaveOptions0.4.data",FileAccess.READ)
	reslution_vec_data=file_user_options.get_var()
	vsync_data=file_user_options.get_var()
	anti_aliasing_msaa_data=file_user_options.get_var()
	ssao_data=file_user_options.get_var()
	ssil_data=file_user_options.get_var()
	sdfgi_data=file_user_options.get_var()
	ssr_data=file_user_options.get_var()
	glow_data=file_user_options.get_var()
	volumetric_fog_data=file_user_options.get_var()
	mouse_seveitivity_data=file_user_options.get_var()
	crosshair_data=file_user_options.get_var()
	grass_density=file_user_options.get_var()
	voxelgi_data=file_user_options.get_var()
	lod_data=file_user_options.get_var()
	render_resolution_data=file_user_options.get_var()
	language_data=file_user_options.get_var()
	texture_size_data=file_user_options.get_var()
	file_user_options.close()
