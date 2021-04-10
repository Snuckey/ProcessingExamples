PImage img;
String input;

void setup()
{
  img = loadImage("shaq.jpg");
  input = "";
  size(600,491);
  textSize(32);
  fill(255,0,0);
}

void draw()
{
  // Clear the background before redrawing
  background(0);
  
  if (input.toLowerCase().equals("shaq"))
  {
    image(img,0,0);
  }
  text(input,10,481);
}

void keyTyped()
{
  int keyCode = int(key);
  
  if (keyCode == 8)
  {
    if (input.length() > 0) {
      input = input.substring(0,input.length()-1);
    }
    return;
  }
  
  println(key);
  
  input += key;
}
