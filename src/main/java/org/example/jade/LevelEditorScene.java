package org.example.jade;


import org.example.components.SpriteRenderer;
import org.joml.Vector2f;
import org.joml.Vector4f;

public class LevelEditorScene extends Scene{

    public LevelEditorScene(){
        this.init();
    }

    @Override
    public void init(){
        this.camera = new Camera(new Vector2f());

        int xOffset = 10;
        int yOffset = 10;

        float totalWidth = (float)(600 - xOffset * 2);
        float totalHeight = (float)(300 - yOffset * 2);
        float xSize = totalWidth / 100.0f;
        float ySize = totalHeight / 100.0f;

        for(int x=0; x < 100 ; x++){
            for(int y=0; y < 100; y++){
                float xPos = xOffset + ( x * xSize);
                float yPos = yOffset + ( y * ySize);

                GameObject go = new GameObject( "Obj" + x + " " + y, new Transform(new Vector2f(xPos,yPos),new Vector2f(xSize,ySize)));
                go.addComponent(new SpriteRenderer(new Vector4f(xSize / totalWidth ,ySize / totalHeight ,1 , 1)));
                this.addGameObjectToScene(go);

            }
        }
    }
    @Override
    public void update(float dt) {

        for (GameObject go : gameObjects){
            go.update(dt);
        }
        this.renderer.render();

    }
}
