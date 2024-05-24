shader_type canvas_item;
#include "res://addons/ShaderFunction-Extras/Color/color_adjustment.gdshaderinc"

uniform float factor;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float v = rgb_to_hsv(texture(TEXTURE, UV).rbg).b + 0.1;
	vec4 sample = vec4(hsv_to_rgb(vec3(sin(TIME),.8,.9)),texture(TEXTURE, UV).a);
	COLOR = sample;
	//COLOR = vec4(color,texture(TEXTURE, UV).a);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
