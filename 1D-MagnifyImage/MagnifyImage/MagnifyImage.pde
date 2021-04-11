PImage img;
boolean magnifying = false;
PImage mag;

void setup()
{
  size(2000,1111);
  img = loadImage("crowd.jpg");
  stroke(0);
}

void draw()
{
  background(0);
  
  image(img,0,0);
  
  if (!magnifying)
  {
    return;
  }
  
  rect(mouseX-101,mouseY-101,201,201);
  
  mag = img.get(mouseX-50,mouseY-50,100,100);
  mag.resize(200,200);
  image(mag,mouseX-100,mouseY-100);
}

void mousePressed()
{
  magnifying = !magnifying;
}
