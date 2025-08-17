#version 460

uniform sampler2D gtexture;
uniform sampler2D lightmap;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

in vec2 texCoord;
in vec3 foliageColor;
in ivec2 lightMapCoords;

void main() {

    vec3 lightColor = texture(lightmap,lightMapCoords).rgb;

    vec4 outputColorData = texture(gtexture,texCoord);
    vec3 outputColor = outputColorData.grb * (foliageColor*1.2);
    float transparency = outputColorData.a;
    if(transparency < 0.1){
        discard;
    }
    outColor0 = vec4(outputColor,transparency);
}