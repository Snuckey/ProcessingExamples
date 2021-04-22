import ddf.minim.*;

Minim minim;
AudioPlayer mp3;

void setup() {
    fullScreen();
    
    fill(0, 255, 0);
    textSize(32);

    minim = new Minim(this);
    mp3 = minim.loadFile("sample3.mp3", 1024);
    mp3.play();
}

void draw() {
    background(0);
    // I honestly have no idea why I have to divide the length by 2000
    // I suspect it has something to do with bitrate? Hard to say though since 
    // there is very little documentation. 1000 is what I was expecting since
    // length returns an amount of time in milliseconds
    text("seconds remaining: " + ((mp3.length() / 2000) - (mp3.position()) / 1000), 32, 32);
}

void stop() {
    mp3.close();
}