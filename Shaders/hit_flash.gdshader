shader_type spatial;

render_mode blend_mix, unshaded;

uniform sampler2D albedo_texture : source_color, filter_nearest;
uniform vec4 flash_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float flash_intensity : hint_range(0.0, 1.0, 0.01) = 0.0;

void fragment() {
    vec4 albedo_tex = texture(albedo_texture, UV);
    vec3 mixed = mix(albedo_tex.rgb, flash_color.rgb, flash_intensity);
    ALBEDO = mixed;
    ALPHA = albedo_tex.a;
}
