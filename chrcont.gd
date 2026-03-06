extends Node
@export var mode:int
@export var controllable:Node2D
@export var speed:float
@export var fallspeed:float
func _process(delta: float) -> void:
	match mode:
		1:
			if Globavar.manager.active:
		#break
				controllable.global_position+=(Input.get_vector("ui_left","ui_right","ui_up","ui_down").normalized()*Vector2(delta,delta)*speed)
		0:
			if Globavar.manager.active:
		#break
				controllable.global_position.x+=(Input.get_vector("ui_left","ui_right","ui_up","ui_down").normalized().x*delta)*speed
				controllable.global_position.y+=delta*fallspeed
		2:
			if Globavar.manager.active:
		#break
				controllable.global_position.x+=(Input.get_vector("ui_left","ui_right","ui_up","ui_down").normalized().x*delta)*speed
				#controllable.global_position.y+=delta*fallspeed
