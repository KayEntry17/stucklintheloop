extends CanvasLayer
var i
@export var mainmenu: PackedScene
func _ready() -> void:
	#call_deferred("_fix_alignment")
	$SubViewport/AnimatedSprite2D.frame=0
func change_scene(scene):
	Pausem.pause()
	$SubViewport/AnimatedSprite2D.play("default")
	$Timer.start()
	$Timer2.stop()
	i=scene
func changemainmenu():
	change_scene(mainmenu)
func _on_timer_timeout() -> void:
	$SubViewport/AnimatedSprite2D.play_backwards("default")
	get_tree().change_scene_to_packed(i)
	get_tree().paused=false
	Pausem.pauses=0
func reload_scene():
	Pausem.pause()
	$SubViewport/AnimatedSprite2D.play("default")
	$Timer2.start()
	$Timer.stop()
	i=get_tree().current_scene.scene_file_path

func _on_timer_2_timeout() -> void:
	$SubViewport/AnimatedSprite2D.play_backwards("default")
	get_tree().change_scene_to_file(i)
	get_tree().paused=false
	Pausem.pauses=0
