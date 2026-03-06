extends Area2D

#func _ready() -> void:
		#$"../Area2D232/CollisionPolygon2D3".polygon=(Geometry2D.intersect_polygons($CollisionPolygon2D2.polygon,$"../Area2D2/CollisionPolygon2D".polygon))

func _physics_process(delta: float) -> void:
	var p1=$CollisionPolygon2D2.polygon
	for i in range(p1.size()):
		p1.set(i,p1[i]+Vector2(global_position))
		#print(i)
	var p2=$"../Area2D2/CollisionPolygon2D".polygon
	for i in range(p2.size()):
		p2.set(i,p2[i]+Vector2($"../Area2D2".global_position))
		#print(i)
	
	var wwb=Geometry2D.intersect_polygons(p1,p2)
	$"../Area2D232/CollisionPolygon2D3".polygon=[]
	if wwb.size()!=0:
		$"../Area2D232/CollisionPolygon2D3".polygon=wwb[0]
	else:
		$"../Area2D232/CollisionPolygon2D3".polygon=[]
	#print(wwb)
	#print($"../Area2D232/CollisionPolygon2D3".polygon)
	#$"../Area2D232/CollisionPolygon2D3".polygon=wwb
	#var o1=[]
	
	
	##print(o1)

	#$"../Area2D232/CollisionPolygon2D3".global_position=Vector2(50,50)
	#print($"../Area2D232/CollisionPolygon2D3".polygon)
	#print(Geometry2D.intersect_polygons($CollisionPolygon2D2.polygon,$"../Area2D2/CollisionPolygon2D".polygon))
