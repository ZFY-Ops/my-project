shader_type canvas_item;

uniform float scanline_intensity : hint_range(0.0, 1.0, 0.01) = 0.3;
uniform float scanline_count : hint_range(100.0, 1000.0, 10.0) = 300.0;
uniform vec3 tint_color : source_color = vec3(0.8, 0.9, 1.0);

void fragment() {
    vec4 color = texture(TEXTURE, UV);
    float scanline = sin(UV.y * scanline_count) * 0.5 + 0.5;
    color.rgb = mix(color.rgb, color.rgb * tint_color, scanline * scanline_intensity);
    COLOR = color;
}
