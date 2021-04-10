void setup()
{
  size(510,510);
}

void draw()
{
  int red = mouseX/2;
  int green = mouseY/2;
  int blue = abs(mouseX/2 - 255);
  background(red,green,blue);
}
