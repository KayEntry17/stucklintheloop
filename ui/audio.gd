extends Control
var paused:=false

var optbutton: TextureButton
var basepos: Vector2
func  _ready() -> void:
	basepos=position
	
func pausemenu():
	if paused:
		
		var tween = create_tween()
		optbutton.grab_focus()
		tween.tween_property(self, "global_position",basepos, 0.5).set_trans(Tween.TRANS_QUART)		
	else:
		var tween = create_tween()
		tween.tween_property(self, "global_position",basepos-Vector2(688,0), 0.5).set_trans(Tween.TRANS_QUART)	
		$General3.value=db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
		$General2.value=db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))
		$General.value=db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
			
		optbutton=get_viewport().gui_get_focus_owner()
		$General.grab_focus()
	paused=!paused
func _on_texture_button_pressed() -> void:
	pausemenu()
	Saveload.save_game()


func _on_texture_button_2_pressed() -> void:
	pausemenu()
	Saveload.load_game()
