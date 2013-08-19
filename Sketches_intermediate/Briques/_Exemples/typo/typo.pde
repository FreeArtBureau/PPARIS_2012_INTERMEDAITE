TypoManager typo01;
TypoManager typo02;

void setup()
{
    // Fenetre du sketch
  size(600, 300);

  typo01 = new TypoManager(this,"American Typewriter Bold BT.ttf","Processing Paris",8);
  typo02 = new TypoManager(this,"American Typewriter Bold BT.ttf","2012",8);

  // Mode de dessin
  smooth();
  rectMode(CENTER);
}

void draw()
{
  background(255);
  
  noStroke();
  fill(200,0,0,200);
  typo02.drawPoints();

  noFill();
  stroke(10);
//  typo01.drawShapes();
  typo01.drawPoints();
}

