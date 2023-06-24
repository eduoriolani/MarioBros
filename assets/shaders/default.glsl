    #type vertex
    #version 120

    attribute vec3 aPos;
    attribute vec4 aColor;

    uniform mat4 uProjection;
    uniform mat4 uView;

    varying vec4 fColor;

    void main(){
        fColor = aColor;
        gl_Position = uProjection * uView * vec4(aPos, 1.0);
    }

    #type fragment
    #version 120

    uniform float uTime;
    attribute vec4 color;
    varying vec4 fColor;

    void main(){
        gl_FragColor = sin(uTime) * fColor;

        float avg = (fColor.r + fColor.g + fColor.b) / 3;
        color = vec4(avg + avg + avg + 1);
    }