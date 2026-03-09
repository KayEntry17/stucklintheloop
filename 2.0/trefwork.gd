#@tool
extends Node
@export var proportion: float=2
func _process(delta: float) -> void:
	proportion=$Node3D.global_position.distance_to($"../Player".global_position)/5-0.5
	#print(proportion)
	if 1.0<=proportion and proportion<2.0:
		$"BézierCurve_005".set_blend_shape_value(0,1+(1-proportion))
		$"../BézierCurve_006".set_blend_shape_value(0,0)
		$"BézierCurve_007".set_blend_shape_value(0,(0))
		$"../BézierCurve_007".set_blend_shape_value(0,0)
		$"BézierCurve_005".visible=true
		#$"../BézierCurve_006".visible=false
		#$"../BézierCurve_007".visible=false
		$"BézierCurve_007".visible=false
	if proportion<1.0:
		$"../BézierCurve_006".set_blend_shape_value(0,(1-proportion))
		$"BézierCurve_007".set_blend_shape_value(0,(1-proportion))
		$"../BézierCurve_007".set_blend_shape_value(0,(1-proportion))

		$"BézierCurve_005".visible=false
		#$"../BézierCurve_006".visible=true
		$"BézierCurve_007".visible=true
		#$"../BézierCurve_007".visible=true
	if proportion<0.2:
		$"../BézierCurve_006".set_blend_shape_value(0,(1-proportion))
		$"BézierCurve_007".set_blend_shape_value(0,(1-proportion))
		$"../BézierCurve_007".set_blend_shape_value(0,0.8)

		$"BézierCurve_005".visible=false
		#$"../BézierCurve_006".visible=true
		$"BézierCurve_007".visible=true
	if proportion>2.0:
		$"BézierCurve_005".set_blend_shape_value(0,0)
		$"../BézierCurve_006".set_blend_shape_value(0,0)
		$"BézierCurve_007".set_blend_shape_value(0,(0))
		$"../BézierCurve_007".set_blend_shape_value(0,0)
		$"BézierCurve_005".visible=true
		#$"../BézierCurve_006".visible=false
		$"BézierCurve_007".visible=false
		#$"../BézierCurve_007".visible=false
	if proportion<=0:
		$"../Player/rotation_helper/Camera3D/MeshInstance3D".queue_free()
		$"BézierCurve_007".visible=false
		$"BézierCurve_005".visible=false
		$"../BézierCurve_007".visible=false
		$"../BézierCurve_006".visible=false
		#$"../Player/rotation_helper/Camera3D/MeshInstance3D".queue_free()
		self.queue_free()
	if proportion<=1.7:
		$SpotLight3D2/MeshInstance3D.get_active_material(0).set_shader_parameter("transparency",max(0,0.6-1.7+proportion))
		#$SpotLight3D2/MeshInstance3D.visible=false
	else:
		$SpotLight3D2/MeshInstance3D.get_active_material(0).set_shader_parameter("transparency",0.6)
