class ParticleSystem
{
  Particle[] particles;
  PVector pos;
  PImage img;

  ParticleSystem(int nb, float x, float y, PImage img)
  {
    this.pos = new PVector(x, y);
    this.img = img;
    this.particles = new Particle[nb];
    for (int i=0;i<nb;i++)
      this.particles[i] = new Particle(x, y);
  }

  void update()
  {
    for (int i=0;i<particles.length;i++)
    {
      this.particles[i].move();
      if (this.particles[i].pos.y-this.particles[i].d/2 >= height)
      {
        this.particles[i].initialSpeed();
        this.particles[i].pos.set(this.pos.x, this.pos.y, 0);
      }
     }
  }

  void draw()
  {
    for (int i=0;i<particles.length;i++)
      this.particles[i].draw();
  }
}

