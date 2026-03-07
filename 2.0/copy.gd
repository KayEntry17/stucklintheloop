extends Node3D
@export var copy: Node3D
func _process(delta: float) -> void:
	self.global_transform=copy.global_transform
