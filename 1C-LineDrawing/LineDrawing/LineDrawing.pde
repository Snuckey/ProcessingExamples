int startX;
int startY;
int endX;
int endY;
boolean drawLine = false;

void setup()
{
  size(510,510);
  background(255);
  fill(0);
  stroke(0);
}

void draw()
{
  if (drawLine)
  {
    line(startX,startY,endX,endY);
    drawLine = false;
  }
}

void mousePressed()
{
  startX=mouseX;
  startY=mouseY;
}

void mouseReleased()
{
  endX = mouseX;
  endY = mouseY;
  drawLine = true;
}
