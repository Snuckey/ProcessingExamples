import ddf.minim.*;

Minim minim;
AudioOutput output;
ArrayList<Key> keys = new ArrayList<Key>();

void setup() {
    fullScreen();
    
    background(117, 203, 221);
    fill(255);
    stroke(0);

    minim = new Minim(this);
    output = minim.getLineOut(Minim.STEREO, 4096);

    keys.add(new Key(0, float(width) / 7.0, 440));
    keys.add(new Key(1, float(width) / 7.0, 493.9));
    keys.add(new Key(2, float(width) / 7.0, 523.3));
    keys.add(new Key(3, float(width) / 7.0, 587.3));
    keys.add(new Key(4, float(width) / 7.0, 659.3));
    keys.add(new Key(5, float(width) / 7.0, 698.5));
    keys.add(new Key(6, float(width) / 7.0, 784));

    for (Key key : keys) {
        key.draw();
    }
}

void draw() {
    output.pauseNotes();
    for (Key key : keys) {
        if (key.isHeldDown()) {
            output.playNote(key.getHz());
        }
    }
    output.resumeNotes();
}

void stop() {
    output.close();
    super.stop();
}

void mousePressed() {
    for (Key key : keys) {
        key.mousePressed(mouseX);
    }
}

void mouseReleased() {
    for (Key key : keys) {
        key.mouseReleased();
    }
}