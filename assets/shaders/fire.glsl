precision mediump float;

#define FBM_OCTAVES 5
#define FBM_NOISE_FNC(UV) gnoise(UV)

#include "lygia/generative/fbm.glsl"

uniform vec2 u_resolution;
uniform float u_time;
uniform sampler2D u_card; // ./images/placeholder.png

vec4 fire(vec2 _st, float _time) {
    float time = _time * 0.9;
    vec3 p = vec3(_st.x * 2., _st.y * 1. - _time * 2., time);

    // Domain distortion
    vec3 q = vec3( fbm( p + vec3(0.0,0.0, time)),
                fbm( p + vec3(0.3, 1.3, time) ), time );
    return fbm(p + q * 0.3) * 10.0 * vec4(0.9765, 0.2784, 0.0, 1.0);
}

void main() {
    vec2 st = gl_FragCoord.xy / u_resolution.xy;
    vec4 color = fire(st, u_time);
    vec4 tex = texture2D(u_card, st);
    color.rgb = color.rgb * tex.rgb;
    color.a = tex.a * color.a;
    gl_FragColor = color;
}