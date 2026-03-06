@tool
extends NinePatchRect
@export var fullsize: Vector2
@export var text:String
@export var nextbox:PackedScene
@export var blockinputs: bool
@export var moreboxes: bool
@export var pointpos:Vector2
@export var newpose: Vector2

var posttoskip: bool
@export var textspeed:float=2
func _process(delta: float) -> void:
	if !Engine.is_editor_hint():
		if posttoskip:
			if Input.is_action_just_pressed("ui_accept"):
				kill_self()
	else:
		if newpose!=Vector2(0,0):
			pointpos=newpose
		global_position=pointpos-Vector2(0,size.y)
		size=fullsize
		get_child(0).size=Vector2(fullsize.x-6, fullsize.y-8)
		get_child(0).position=Vector2(3,3)
	#get_child(0).text=text
func _ready() -> void:
	

	global_position=pointpos-Vector2(0,size.y)
	#print(global_position)
	size=fullsize
	get_child(0).size=Vector2(fullsize.x-6, fullsize.y-8)
	get_child(0).position=Vector2(3,3)
	posttoskip=false
	$active.wait_time=textspeed
	$active.start()
	Pausem.pause()
	$ColorRect.mouse_filter=MOUSE_FILTER_STOP
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	$Label.visible_ratio=0
	tween.tween_property($Label, "visible_ratio", 1, textspeed)
func next_slide():
	if moreboxes:
		var nb=nextbox.instantiate()
		nb.pointpos=pointpos
		print(nb.moreboxes)
		get_parent().add_child(nb)
		
func kill_self():
	Pausem.unpause()
	next_slide()
	$ColorRect.mouse_filter=MOUSE_FILTER_IGNORE
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "global_position", Vector2(1000,1000), 0.2)
	$death13.start()
	posttoskip=false
	
	
	
	


func _on_active_timeout() -> void:
	posttoskip=true


func _on_death_13_timeout() -> void:
	queue_free()
	#print(34243442432414)
