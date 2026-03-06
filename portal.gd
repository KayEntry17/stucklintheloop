@tool
extends Area2D
@export var size:Vector2
@onready var colp=$CollisionPolygon2D
@onready var colr=$ColorRect
@export var portallink: Area2D
var colpch
var listofobj
var tracklist
var collist
var sprlist
var numfr=0
var colcol=[]
@export var checkbu:bool
@export var offsdir:int
@export var posoffs:float
func _ready() -> void:
	numfr=0
	listofobj=[]
	tracklist=[]
	collist=[]
	sprlist=[]
func inibullet(i):
		tracklist.append(i)
		var texi=i.get_child(0).texture
		var texcoll=i.get_child(1).get_child(0)
		i.looping=2
		var collink=texcoll.polygon
		var colsame=CollisionPolygon2D.new()
		var colopp=CollisionPolygon2D.new()
		#colsame.build_mode=CollisionPolygon2D.BUILD_SEGMENTS
		#colopp.build_mode=CollisionPolygon2D.BUILD_SEGMENTS
		colsame.polygon=texcoll.polygon
		colopp.polygon=texcoll.polygon
		colsame.set_deferred("disabled",false)
		colopp.set_deferred("disabled",false)
		i.get_child(1).add_child(colsame)
		i.get_child(1).add_child(colopp)
		
		colsame.top_level=true
		colopp.top_level=true
		colsame.global_position=Vector2(0,0)
		colopp.global_position=Vector2(0,0)
		
		collist.append([collink,colsame,colopp])
		##print(tracklist)
		sprlist.append([addchilds(texi),portallink.addchilds(texi)])
		
func _process(delta: float) -> void:
	##print(tracklist)
	numfr+=1
	colr.size=Vector2(size.x,size.y+posoffs-size.y/2)
	colr.position=Vector2(0,-posoffs*offsdir-size.y/2*(offsdir-1))
	
	listofobj=get_overlapping_areas()
	colcol=[Vector2(0,0),Vector2(0+colr.size.x,0),Vector2(colr.size.x,colr.size.y),Vector2(0,colr.size.y)]

	for i in listofobj:
		
		if i.get("looping")!= null:
			
			match i.looping:
				1:
					if !tracklist.has(i) and !portallink.tracklist.has(i):
						
						#print('uiosdfghuijshfg'+name)
						inibullet(i)
				2:
					if tracklist.has(i):
						pass
					else:
						if !portallink.tracklist.has(i):
							##print('uiosdfdfafghuijshfg'+name)
							inibullet(i)
	var ioffset=0

	for i in range(tracklist.size()):
		
		if !listofobj.has(tracklist[i-ioffset]):
			##print(str(numfr)+" del"+str(i)+name)
			##print(tracklist)
			##print(str(numfr)+"  "+str(i)+name)
			#tracklist[i-ioffset].looping=1
			#tracklist.pop_at(i-ioffset)
			#collist[i-ioffset][1].queue_free()
			#collist[i-ioffset][2].queue_free()
			#collist.pop_at(i-ioffset)
			#for j in sprlist[i-ioffset]:
				#j.queue_free()
			#sprlist.pop_at(i-ioffset)
			#ioffset+=1
			pass
		else:
			
			sprlist[i-ioffset][0].global_position=tracklist[i-ioffset].global_position
			sprlist[i-ioffset][0].global_rotation=tracklist[i-ioffset].global_rotation
			sprlist[i-ioffset][1].position=sprlist[i-ioffset][0].position+colr.position-portallink.colr.position
			sprlist[i-ioffset][1].rotation=sprlist[i-ioffset][0].rotation
			if checkbu:
				refreshcoll(collist[i-ioffset][1],collist[i-ioffset][2],rotatepoly(collist[i-ioffset][0],sprlist[i-ioffset][0].global_rotation),rotatepoly(collist[i-ioffset][0],sprlist[i-ioffset][1].global_rotation),sprlist[i-ioffset][0].global_position,sprlist[i-ioffset][1].global_position)
			##print(str(collist[i-ioffset][1].polygon)+"fsf")
			if offsdir==1:
				if sprlist[i-ioffset][0].position.y>size.y/2-colr.position.y:
					##print(sprlist[i-ioffset][0].position.y)
					#portallink.inibullet(tracklist[i-ioffset])
					portallink.tracklist.append(tracklist[i-ioffset])
					portallink.collist.append([collist[i-ioffset][0],collist[i-ioffset][2],collist[i-ioffset][1]])
					portallink.sprlist.append([sprlist[i-ioffset][1],sprlist[i-ioffset][0]])
					tracklist[i-ioffset].global_position=sprlist[i-ioffset][1].global_position
					tracklist[i-ioffset].global_rotation=sprlist[i-ioffset][1].global_rotation
					
					tracklist.pop_at(i-ioffset)
					#collist[i-ioffset][1].queue_free()
					#collist[i-ioffset][2].queue_free()
					collist.pop_at(i-ioffset)
					#for j in sprlist[i-ioffset]:
						#j.queue_free()
					sprlist.pop_at(i-ioffset)
					ioffset+=1
					
					##print(tracklist)
					#print(str(numfr)+" tel")
					

			else:
				if sprlist[i-ioffset][0].position.y<size.y/2-colr.position.y:
					##print(sprlist[i-ioffset][0].position.y)
					#portallink.inibullet(tracklist[i-ioffset])
					portallink.tracklist.append(tracklist[i-ioffset])
					portallink.collist.append([collist[i-ioffset][0],collist[i-ioffset][2],collist[i-ioffset][1]])
					portallink.sprlist.append([sprlist[i-ioffset][1],sprlist[i-ioffset][0]])
					tracklist[i-ioffset].global_position=sprlist[i-ioffset][1].global_position
					tracklist[i-ioffset].global_rotation=sprlist[i-ioffset][1].global_rotation
					
					tracklist.pop_at(i-ioffset)
					#collist[i-ioffset][1].queue_free()
					#collist[i-ioffset][2].queue_free()
					collist.pop_at(i-ioffset)
					#for j in sprlist[i-ioffset]:
						#j.queue_free()
					sprlist.pop_at(i-ioffset)
					ioffset+=1
					##print(tracklist)
					#print(str(numfr)+" tel")
				
func _physics_process(delta: float) -> void:	
	
	colp.polygon=[Vector2(0,0),Vector2(0+size.x,0),Vector2(0+size.x,0+size.y),Vector2(0,0+size.y)]
func addchilds(tex):
	var newc=Sprite2D.new()
	newc.texture=tex
	colr.add_child(newc)
	return newc
func rotatepoly(poly, am):
	var polyn=[]
	#var i2:Vector2=Vector2(0,0)
	for i in poly:
		polyn.append(i.rotated(am))
	return polyn
func relposcalc(pos, rot):
	var posf=pos-global_position+Vector2(0,size.y)
	var rotf=rot-global_rotation
	return [posf,rotf]
func refreshcoll(coll1,coll2,orcoll1,orcoll2,orpos1,orpos2):
	var l1=get_intersection(orcoll1,orpos1,rotatepoly(colcol,global_rotation),colr.global_position)
	if l1.size()>=1:
		coll1.polygon=l1[0]
	else:
		coll1.polygon=[]
	##print(str(coll1.polygon)+"fsf")
	var l2=get_intersection(orcoll2,orpos2,rotatepoly(portallink.colcol,portallink.global_rotation),portallink.colr.global_position)
	if l2.size()>=1:
		coll2.polygon=l2[0]
	else:
		coll2.polygon=[]
func get_intersection(coll1,pos1,coll2,pos2):
	var p1=coll1.duplicate()
	for i in range(p1.size()):
		p1.set(i,p1[i]+pos1)
		##print(i)
	var p2=coll2.duplicate()
	for i in range(p2.size()):
		p2.set(i,p2[i]+pos2)	
	return Geometry2D.intersect_polygons(p1,p2)
#func calculatenewpos(pos,rot):
	
	


func _on_area_exited(area: Area2D) -> void:
	##print("sdgklfhjnskjdghnsojklghs")
	if portallink.tracklist.has(area):
		#print(portallink.name)
		##print(4857926)
		return
		#print(4857926)
	var i=tracklist.find(area)
	if tracklist.has(area):
					##print(str(numfr)+" del"+str(i)+name)
#
			area.looping=1
			tracklist.pop_at(i)
			collist[i][1].queue_free()
			collist[i][2].queue_free()
			collist.pop_at(i)
			for j in sprlist[i]:
				j.queue_free()
			sprlist.pop_at(i)
	
