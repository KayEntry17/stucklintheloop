extends Node2D
@export var nextlevel: PackedScene
@export var themee:AudioStream
func _ready() -> void:
	Mus.swaptrack(themee)
	$"Cat/AnimationPlayer".play("begin")
func end():
	TR.change_scene(nextlevel)
