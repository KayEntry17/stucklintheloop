extends Node2D
@export var type:int

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		Globavar.manager.mcguffinscollected+=1
		queue_free()
func _ready() -> void:
	$Sprite2D.frame=type
