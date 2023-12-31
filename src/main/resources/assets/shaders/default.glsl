    #type vertex
    #version 120

    attribute vec3 aPos;
    attribute vec4 aColor;

    varying vec4 fColor;

    void main(){
        fColor = aColor;
        gl_Position = vec4(aPos, 1.0);
    }

    #type fragment
    #version 120

    varying vec4 fColor;

    void main(){
        gl_FragColor = fColor;
    }