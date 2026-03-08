shader_type spatial;
render_mode unshaded,blend_mix, cull_disabled;
//stencil_mode compare_less,2;
uniform sampler2D viewport;

void vertex() {
	
}

void fragment() {
	ALBEDO=texture(viewport,SCREEN_UV).xyz;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
