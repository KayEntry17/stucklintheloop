extends Sprite2D
@export var speed:=1.0
func _process(delta: float) -> void:
	self.material.set_shader_parameter("offset",self.material.get_shader_parameter("offset")+delta*speed*0.3)
