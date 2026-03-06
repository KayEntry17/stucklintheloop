extends Node2D
func _on_area_2d_area_entered(area: Area2D) -> void:
	print(3244424)
	if area.is_in_group("bullets"):
		Globavar.manager.mcguffinscollected+=1
		area.queue_free()
