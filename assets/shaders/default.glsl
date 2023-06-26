    #type vertex
    #version 120

    attribute vec3 aPos;
    attribute vec4 aColor;
    attribute vec2 aTexCoords;

    uniform mat4 uProjection;
    uniform mat4 uView;

    varying vec4 fColor;
    varying vec2 fTexCoords;

    void main(){
        fColor = aColor;
        // Aplicar rotación de 90 grados en sentido antihorario
        mat2 rotationMatrix = mat2(cos(-1.5708), -sin(-1.5708), sin(-1.5708), cos(-1.5708));
        fTexCoords = rotationMatrix * aTexCoords;
        gl_Position = uProjection * uView * vec4(aPos, 1.0);
    }

    #type fragment
    #version 120

    uniform float uTime;
    uniform sampler2D TEX_SAMPLER;
    varying vec4 fColor;
    varying vec2 fTexCoords;


    vec4 texture(sampler2D TEX_SAMPLER, vec2 fTexCoords)
    {
        return texture2D(TEX_SAMPLER, fTexCoords);
    }


    void main(){
        gl_FragColor = texture2D(TEX_SAMPLER, fTexCoords);
    }