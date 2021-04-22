import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup() {
    fullScreen();
    
    fill(0, 255, 0);
    textSize(32);

    minim = new Minim(this);
    player = minim.loadFile("sample3.mp3", 1024);
    player.play();
}

void draw() {
    background(0);
    // I honestly have no idea why I have to divide the length by 2000
    // I suspect it has something to do with bitrate? Hard to say though since 
    // there is very little documentation. 1000 is what I was expecting since
    // length returns an amount of time in milliseconds
    text("seconds remaining: " + ((player.length() / 2000) - (player.position()) / 1000), 32, 32);

    // Control which speaker the music is coming out of using the x position of the cursor. Between -1 and 1
    player.setBalance((float(mouseX - (width/2)) / float(width/2)));
}

void stop() {
    player.close();
}