extends Node2D
@export var mus: AudioStream
func _ready() -> void:
	Mus.swaptrack(mus)
func end():
	TR.changemainmenu()
