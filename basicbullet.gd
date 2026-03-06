extends Area2D
@export var speed:float
@export var dmg:int
@export var starttime:float
var active
var time:=0
var manager
@export var looping:int
@export var warnp:float
@export var selfd:float
func _ready() -> void:
	active=false
	$SubViewport/Bullet2.visible=false
	$SubViewport/WarningSign.visible=false
	$Area2D/CollisionPolygon2D.disabled=true
func _process(delta: float) -> void:
	
	time=Globavar.manager.time
	if time>=starttime-warnp:
		$SubViewport/AnimationPlayer.play("warning")
	if time>=starttime:
		$SubViewport/AnimationPlayer.stop()
		$Area2D/CollisionPolygon2D.disabled=false
		$SubViewport/Bullet2.visible=true
		active=true
		$SubViewport/WarningSign.visible=false
		#$SubViewport/AnimationPlayer.play("bulapp")
	if time>=starttime+selfd and selfd!=0:
		queue_free()
	if active:
			var movevect=Vector2(0,speed*delta).rotated(rotation)
			global_position+=movevect
