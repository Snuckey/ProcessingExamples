import ddf.minim.*;

class Key {
    float keyWidth;
    float hz;
    float keyX;
    boolean heldDown = false;
    final int keyRounding = 12;
    
    Key(int index, float width, float hertz) {
        keyWidth = width;
        keyX = index * keyWidth;
        hz = hertz;
    }

    float getHz() {
        return hz;
    }

    boolean isHeldDown() {
        return heldDown;
    }

    void draw() {
        fill(255);
        stroke(0);
        rect(keyX, 0, keyWidth, height, 0, 0, keyRounding, keyRounding);
    }

    void mousePressed(float x) {
        if (mouseX >= keyX && mouseX < (keyX + keyWidth)) {
            heldDown = true;
        }
    }

    void mouseReleased() {
        heldDown = false;
    }
}