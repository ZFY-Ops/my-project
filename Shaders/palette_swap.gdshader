shader_type spatial;

render_mode blend_mix, cull_disabled, unshaded, specular_disabled;

uniform sampler2D albedo_texture : source_color, filter_nearest;
uniform sampler2D palette : source_color, filter_nearest;
uniform int row = 1;
uniform float fps = 0;
uniform bool skip_first_row = true;
uniform int tolerance = 3;

void fragment() {
	vec4 original_color = texture(albedo_texture, UV);
	ivec3 colori = ivec3(round(original_color.rgb * 255.0));

	ivec2 color_count = textureSize(palette, 0);

	float idx = -1.0;
	for (int i = 0; i < color_count.x; i++) {
		vec3 color2 = texture(palette, vec2(float(i) / float(max(color_count.x - 1, 1)), 0.0)).rgb;
		ivec3 colori2 = ivec3(round(color2 * 255.0));

		if (all(lessThanEqual(abs(colori - colori2), ivec3(tolerance)))) {
			idx = float(i);
			break;
		}
	}

	if (idx >= 0.0) {
		vec2 uv;
		uv.x = idx / float(max(color_count.x - 1, 1));
		if (fps != 0.0) {
			uv.y = (mod(TIME * fps, max(float(color_count.y - 1 - int(skip_first_row)), 1.0)) + float(skip_first_row)) / float(max(color_count.y - 1, 1));
		} else {
			uv.y = float(row) / float(max(color_count.y - 1, 1));
		}

		vec4 palette_color = texture(palette, uv);
		ALBEDO = palette_color.rgb;
		ALPHA = original_color.a;
	} else {
		ALBEDO = original_color.rgb;
		ALPHA = original_color.a;
	}
}
