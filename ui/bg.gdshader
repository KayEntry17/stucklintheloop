shader_type canvas_item;
uniform float speed;
uniform float fallspeed;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float uvy=UV.y+TIME*fallspeed;
	COLOR=max(vec4(texture(TEXTURE,vec2(UV.x,uvy-speed*TIME))),max(texture(TEXTURE,vec2(UV.x,uvy)+speed*TIME),vec4(texture(TEXTURE,vec2(UV.x-speed*TIME,uvy)))));
	//COLOR=vec4(1);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
