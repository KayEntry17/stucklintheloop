extends Node2D
@export var target: Node2D
@export var gap: float
var timeremaining
@export var bul:PackedScene
func _ready() -> void:
	timeremaining=gap
func _process(delta: float) -> void:

			
	var angle_radians = global_position.angle_to_point(target.global_position)

	$EyeBackgroundBoss/Node2D.global_rotation=angle_radians
	if Globavar.manager.active:
		timeremaining-=delta
		if timeremaining<=0:
			timeremaining=gap
			var nb=bul.instantiate()
			nb.rotation=angle_radians
			add_child(nb)
