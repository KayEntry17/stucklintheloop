extends Node2D
@export var speed:float
@export var dmg:int
var time
var looping:=1
@export var sdtime=5
var sttime
func _ready() -> void:
	sttime=Globavar.manager.time
func _process(delta: float) -> void:
	time=Globavar.manager.time
	
	var movevect=Vector2(speed*delta,0).rotated(rotation)
	global_position+=movevect
	if time>sdtime+sttime:
		queue_free()
