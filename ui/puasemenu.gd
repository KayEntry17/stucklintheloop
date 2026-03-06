extends Control
var paused
var basepos: Vector2


func ready():
	paused=false
	#basepos=global_position
func _process(delta: float) -> void:
		if Input.is_action_just_pressed("pause"):
			pausemenu()
			print(paused)
			print(Pausem.pauses)
func pausemenu():
	if paused:
		Pausem.unpause()
		var tween = create_tween()
		tween.tween_property(self, "position",Vector2(-1002,-180), 0.5).set_trans(Tween.TRANS_QUART)		
	else:
		Pausem.pause()
		$button.grab_focus()

		var tween = create_tween()
		tween.tween_property(self, "position",Vector2(-314.0,-180), 0.5).set_trans(Tween.TRANS_QUART)	
		
	paused=!paused
	#print(paused)


func _on_button_pressed() -> void:
	if paused:
		pausemenu()
		print(32442)

func _on_button_2_pressed() -> void:
	if paused:
		TR.changemainmenu()
