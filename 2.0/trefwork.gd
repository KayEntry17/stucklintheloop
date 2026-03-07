@tool
extends Node3D
@export var proportion: float=2
func _process(delta: float) -> void:
	proportion=$Node3D.global_position.distance_to($Player.global_position)/5-0.5
	#print(proportion)
	if 1.0<=proportion and proportion<2.0:
		$"BézierCurve_005".set_blend_shape_value(0,1+(1-proportion))
		$"BézierCurve_005".visible=true
		$"BézierCurve_006".visible=false
		$"BézierCurve_007".visible=false
	if proportion<1.0:
		$"BézierCurve_006".set_blend_shape_value(0,(1-proportion))
		$"BézierCurve_007".set_blend_shape_value(0,(1-proportion))
		$"BézierCurve_005".visible=false
		$"BézierCurve_006".visible=true
		$"BézierCurve_007".visible=true
	if proportion>2.0:
		$"BézierCurve_005".set_blend_shape_value(0,0)
		$"BézierCurve_005".visible=true
		$"BézierCurve_006".visible=false
		$"BézierCurve_007".visible=false
