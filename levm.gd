extends NinePatchRect
@export var leveltype:int
@export var timertot:float
@export var mmtheme: AudioStream

@export var mcguffinstotal:int
var mcguffinscollected
var timeleft
var time
@export var lvlunl:int
@export var nextlevel:PackedScene
@export var active:bool
@export var catstart:bool
func _enter_tree() -> void:
	Globavar.set_manage(self)
	
func _ready() -> void:
	Mus.swaptrack(mmtheme)
	time=0
	mcguffinscollected=0
	timeleft=timertot-time
	$surv/Node2D.num=timeleft
	$surv/HSlider.value=timeleft/timertot*100
	$"../Thee won".position.y=2000
	if catstart:
		$"../Cat/AnimationPlayer".play("begin")
	else:
		start()

	#time=0
	match leveltype:
		1:
			timeleft=timertot
			$surv.visible=true
		2:
			mcguffinscollected=0
func _process(delta: float) -> void:
	if active:
		time+=delta
		match leveltype:
			1:
				$surv.visible=true
				$coll.visible=false
				timeleft=timertot-time
				$surv/Node2D.num=timeleft
				$surv/HSlider.value=timeleft/timertot*100
				if timeleft<=0:
					LevelComplete()
			2:
				$coll.visible=true
				$surv.visible=false
				$coll/Node2D.num=mcguffinstotal
				$coll/Node2D2.num=mcguffinscollected
				if mcguffinscollected==mcguffinstotal:
					LevelComplete()
func LevelComplete():
	$"../Thee won/WindowWin/TextureButton".grab_focus()
	active=false
	Saveload.lvunl=max(Saveload.lvunl,lvlunl)
	Saveload.save_game()
	var tween = create_tween()
	tween.tween_property($"../Thee won", "position",Vector2(0,0), 0.5).set_trans(Tween.TRANS_QUART)		


func _on_texture_button_pressed() -> void:
	TR.change_scene(nextlevel)
func start():
	$"../Thee won2/WindowWin/AnimationPlayer".play("new_animation")
