// NOTE: Shader automatically converted from Godot Engine 4.5.1.stable's StandardMaterial3D.

shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_front, unshaded, fog_disabled;
stencil_mode write, 2;
uniform sampler2D tex;


void fragment() {
	if (!FRONT_FACING){
		ALBEDO=vec3(0.);
	}
	ALBEDO=texture(tex,SCREEN_UV).xyz;
}
