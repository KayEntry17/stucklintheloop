extends Node2D
@export var nextlevel: PackedScene
func _ready() -> void:
	$"Cat/AnimationPlayer".play("begin")
func end():
	TR.change_scene(nextlevel)
