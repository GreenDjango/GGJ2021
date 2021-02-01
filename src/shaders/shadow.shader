shader_type canvas_item;

uniform float break_factor = 0.81;

void fragment() {
	if (UV.y > break_factor) {
		COLOR = texture(TEXTURE, vec2(UV.x, break_factor - (UV.y - break_factor) ));
		float new_alpha = 1.0 - (UV.y - break_factor + 0.05) * (1.0 / (1.0 - break_factor));
		if (COLOR.a > new_alpha)
			COLOR.a = new_alpha
	} else {
		COLOR = texture(TEXTURE, UV);
	}
	
	/* half2 displacement1 = tex2D( _Displacement1Tex, i.uv.xy );
	float2 adjusted = i.uv.xy + (displacement1.rg - .5);
	half4 output = tex2D(_MainTex, adjusted);*/
}