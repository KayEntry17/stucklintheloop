@tool
extends Node2D
@export var on:bool
var onst:bool
func _ready() -> void:
	on=true
	onst=true
	#$HeartOn.frame=0
func _process(delta: float) -> void:
	if on and !onst:
		$AnimationPlayer.stop()
		$AnimationPlayer.play("heartgain")
		onst=true
	if !on and onst:
		$AnimationPlayer.stop()
		$AnimationPlayer.play_backwards("heartgain")
		onst=false
