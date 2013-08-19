Particle[] particles;

void setup()
{
  size(400, 400);
  smooth();
  particles  = new Particle[100];
  for (int i=0;i<100;i++){
    particles[i] = new Particle(random(width), random(height));
  }
  
  noStroke();
  fill(0);
}

void draw()
{
  background(255);
  for (int i=0;i<100;i++){
    particles[i].draw();
  }
}

