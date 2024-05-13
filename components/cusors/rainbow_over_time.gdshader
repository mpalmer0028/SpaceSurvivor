shader_type canvas_item;
#include "res://addons/ShaderFunction-Extras/Color/color_adjustment.gdshaderinc"
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 sample = vec4(hsv_to_rgb(vec3(sin(TIME),.5,1)),texture(TEXTURE, UV).a);

	COLOR = sample;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
