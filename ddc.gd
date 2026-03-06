@tool
extends Node2D
@export var num:int
func _process(delta: float) -> void:
	if !fmod(num,10)-1==-1:
		
		$Sprite2D.frame=fmod(num,10)-1
	else:
		$Sprite2D.frame=9
	if num<10:
		$Sprite2D2.visible=false
	else:
		$Sprite2D2.visible=true
		$Sprite2D2.frame=int(num/10)-1
	
