@tool
extends Control
@export var ch:Area2D
@export var heartc: Array[Node2D]
@export var healtham:int
func _enter_tree() -> void:
	Globavar.set_health(self)
func _process(delta: float) -> void:
	#healtham=ch.health
	for i in range(heartc.size()):
		if i>healtham-1:
			heartc[i].on=false
		else:
			heartc[i].on=true
