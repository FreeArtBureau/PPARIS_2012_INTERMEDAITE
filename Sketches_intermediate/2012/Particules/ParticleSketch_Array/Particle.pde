class Particle
{
  PVector pos; // position
  
  Particle(float x, float y)
  {
    pos = new PVector(x,y);
  }
  
  void draw()
  {
    ellipse(pos.x,pos.y,50,50);
  }
  
}
