shader_type canvas_item;

uniform vec4 color : hint_color;
uniform float mixer : hint_range(0, 10);
uniform float radio : hint_range(0, 10);

uniform vec2 VIEWPORT_SIZE;

void fragment() {
	vec4 textura = texture(TEXTURE,  UV.xy);
	// if (FRAGCOORD.x < radio || FRAGCOORD.x > float(imageSize) - radio) {
	//	textura = mix(textura,vec4(1,1,1,1), mixer/10.0);
	//}
	COLOR = vec4(step(0.5, FRAGCOORD.x) * textura.xy, textura.z, textura.a);
}