PVector g;
PImage img;
ParticleSystem ps;

void setup()
{
  size(400,400);
  smooth();
  
  g = new PVector(0,0.05);
  img = loadImage("Glow.png");
  ps = new ParticleSystem(100,width/2, 3*height/4, img);
}

void draw()
{
  background(255);
  noStroke();
  fill(0);
  
  ps.update();
  ps.draw();
}



