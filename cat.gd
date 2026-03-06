extends Sprite2D
@export var textbox: PackedScene
var childplanned
@export var catstart:bool

func kms():
	
	Pausem.unpause()
	if catstart:
		Globavar.manager.start()
	$AnimationPlayer.play("kms")
func talk():
	childplanned=true
	Pausem.pause()
	var tb=textbox.instantiate()
	#tb.pointpos=Vector2(-61,59)
	self.add_child(tb)
func _process(delta: float) -> void:
	if childplanned and get_children().size()==1:
		kms()
func _ready() -> void:
	childplanned=false
