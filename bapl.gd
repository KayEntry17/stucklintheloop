extends Area2D
@export var speed:float
var looping:=1
@export var health:int=5
@export var healtime:float
@export var pausem:Control
var healrem
var alive=true
@export var maxhealth:int
func csochka():
	TR.reload_scene()
func _ready() -> void:
	alive=true
	#$"../Cat/AnimationPlayer".play("begin")
	health=maxhealth
	#process_mode=Node.PROCESS_MODE_PAUSABLE
	healrem=0
func kms():
	#process_mode=Node.PROCESS_MODE_ALWAYS
	Globavar.manager.active=false
	#Pausem.pause()
	$SubViewport/MobiusTrefoil2/AnimationPlayer.stop()
	$SubViewport/MobiusTrefoil2/AnimationPlayer.play("death")
func _process(delta: float) -> void:
	
		
	if health<=0 and alive:
		alive=false
		kms()
	Globavar.health.healtham=health
	healrem-=delta
	#print(get_overlapping_areas())
	#if Globavar.manager.active:
		##break
		#global_position+=(Input.get_vector("ui_left","ui_right","ui_up","ui_down").normalized()*Vector2(delta,delta)*speed)
	for i in $collision.get_children():
		i.disabled=false
	if looping==2:
		$MobiusTrefoil.visible=false
		#$collision/CollisionPolygon2D.disabled=true
	else:
		$MobiusTrefoil.visible=true
		#$collision/CollisionPolygon2D.disabled=false
	#print(Input.get_vector("ui_left","ui_right","ui_up","ui_down").normalized()*Vector2(delta,delta))
#
#
#func _on_area_entered(area: Area2D) -> void:
	#
	#if area.is_in_group("bullets"):
		#print("coll")
		#if healrem<=0:
			#health-=area.damage
			#healrem=healtime
			#$SubViewport/MobiusTrefoil2/AnimationPlayer.stop()
			#$SubViewport/MobiusTrefoil2/AnimationPlayer.speed_scale=(1/healtime)
			#$SubViewport/MobiusTrefoil2/AnimationPlayer.play("damg")
			#
			#
			
		
func _physics_process(delta: float) -> void:
	await get_tree().physics_frame
	#print($collision.get_overlapping_areas())
	#print($collision.get_children())

func _on_collision_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullets") and Globavar.manager.active:
		
		if healrem<=0:
			
			Pausem.frame_freeze(0.1,0.2)
			$AudioStreamPlayer2D.play()
			health-=area.damage
			healrem=healtime
			$SubViewport/MobiusTrefoil2/AnimationPlayer.stop()
			#$SubViewport/MobiusTrefoil2/AnimationPlayer.speed_scale=(1/healtime)
			$SubViewport/MobiusTrefoil2/AnimationPlayer.play("damg")
