PImage tvImage;
color black = color(0);
color white = color(255);
color[] staticArray = {black, white};

void setup() {
    tvImage = loadImage("tv.jpg");
    image(tvImage, 0, 0);
    size(1280, 960);
}

void draw() {
    loadPixels();
    for (int i=80; i<1196; i++) {
        for (int j=116; j<712; j++) {
            set(i,j,staticArray[round(random(0,1))]);
        }
    }
}