ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
int lastFrameMs = 0;
int thisFrameMs = 0;
int nextBubbleInMs;

void setup() {
  stroke(255);
  fill(47,130,134,180); // Cause overlapping bubbles to render as translucent
  size(1024,768);  
  bubbles.add(new Bubble());
  nextBubbleInMs = (int)random(10,500);
}

void draw() {
  background(47,130,134);
  
  lastFrameMs = thisFrameMs;
  thisFrameMs = millis();
  
  nextBubbleInMs -= thisFrameMs-lastFrameMs;
  
  ArrayList<Bubble> updatedBubbles = new ArrayList<Bubble>();
  for (Bubble bubble : bubbles) {
    bubble.render();
    if(!bubble.shouldPop()) {
      updatedBubbles.add(bubble);
    }
  }
  
  if (nextBubbleInMs<=0) {
    updatedBubbles.add(new Bubble());
    nextBubbleInMs = (int)random(10,500);
  }
  
  bubbles = updatedBubbles;
}

class Bubble {
  
  private float xPos, yPos, radius, speedPxPerMs;
  
  Bubble() {
    radius = 5;
    xPos = (int)random(0, width);
    yPos = height - radius;
    speedPxPerMs = height/4000.0;
  }
  
  boolean shouldPop() {
    boolean x = yPos<=radius;
    return x;
  }
  
  void render() {
    float oldYPos = yPos;
    yPos = yPos - ((thisFrameMs - lastFrameMs)*speedPxPerMs);
    radius += (oldYPos-yPos) / 10;
    //xPos = xPos + random(-1,1); // Slight shake back and forth as the bubble rises
    
    circle(xPos,yPos,radius);
  }
}
