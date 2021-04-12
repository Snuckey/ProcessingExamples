PImage original;
PImage clip;
boolean makeClipping = false;
int startX;
int startY;
int endX;
int endY;

void setup()
{
  original = loadImage("doggy.jpg");
  size(851,1134);
}

void draw()
{
  background(0);
  if (!makeClipping)
  {
    if (clip == null)
    {
      image(original,0,0);
    } else {
      image(clip,0,0);
    }
    return;
  }
  
  clip = original.get(startX, startY, endX-startX, endY-startY);
  
  double widthRatio = (double)width / (double)clip.width;
  double heightRatio = (double)height / (double)clip.height;

  if (clip.width != 0 && clip.height != 0)
  {
    if (heightRatio > widthRatio && widthRatio != 0)
    {
      clip.resize((int)(clip.width * widthRatio), (int)(clip.height * widthRatio));
    }
    else if (heightRatio != 0)
    {
      clip.resize((int)(clip.width * heightRatio), (int)(clip.height * heightRatio));
    }
  }
  
  makeClipping = false;
}

void mousePressed()
{
  startX = mouseX;
  startY = mouseY;
}

void mouseReleased()
{
  endX = mouseX;
  endY = mouseY;
  makeClipping = true;
}

void keyTyped()
{
  if (int(key) == 10) // Enter
  {
    save("clip.jpg");
  }
}
