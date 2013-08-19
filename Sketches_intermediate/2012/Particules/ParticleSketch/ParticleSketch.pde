Particle p,p1,p2,p3,p4;

void setup()
{
  size(400, 400);
  smooth();
  p  = new Particle(width/2, height/2);
  p1 = new Particle(30, 60);
  p2 = new Particle(130, 200);
  p3 = new Particle(random(width), random(height));
  p4 = new Particle(340, 300);
  noStroke();
  fill(0);
}

void draw()
{
  background(255);
  p.draw();
  p1.draw();
  p2.draw();
  p3.draw();
  p4.draw();
}

