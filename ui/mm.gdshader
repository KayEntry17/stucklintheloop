shader_type canvas_item;
uniform vec4[16] colorList:source_color;
void vertex() {
	// Called for every vertex the material is visible on.
}
//
void fragment() {
	vec4 color = texture(TEXTURE, UV).rgba;
	float min_dist = distance(color.rgb,colorList[0].rgb);
	COLOR = colorList[0];
	for(int i=0;i<colorList.length(); i++) {
		float dist = distance(color,colorList[i]);
		if (dist < min_dist) {
			min_dist = dist;
			COLOR = colorList[i];
			if (colorList[i]==vec4(1,1,1,1)){
				COLOR.a=0.;}
		}
	}
	//COLOR=colorList[0];
}
//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
