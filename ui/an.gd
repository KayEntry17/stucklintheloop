extends AnimatedSprite2D
@export var mainm:PackedScene
@export var mmtheme: AudioStream
func _ready() -> void:
	Mus.swaptrack(mmtheme,true)
	#TR.change_scene(mainm)
func _on_animation_finished() -> void:
	TR.change_scene(mainm)
