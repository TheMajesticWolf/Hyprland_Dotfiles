//
// Example blue light filter shader.
// 

precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {

    vec4 pixColor = texture2D(tex, v_texcoord);

    pixColor[2] *= 0.5;

    gl_FragColor = pixColor;
}

/*precision highp float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec4 pixColor = texture2D(tex, v_texcoord);
    gl_FragColor = vec4(1.0 - pixColor.r, 1.0 - pixColor.g, 1.0 - pixColor.b, pixColor.a);
}*/
