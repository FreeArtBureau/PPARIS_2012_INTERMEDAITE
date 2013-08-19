// Déclaration du tableau de particules
Particle[] particles;

void setup()
{
  size(400, 400);
  smooth();
  
  // Création du tableau de particules
  particles  = new Particle[120];

  // Création des particules
  for (int i=0;i<120;i++){
    particles[i] = new Particle(random(width), random(height));
  }
  
  // Options de dessin
  noStroke();
  fill(0);
}

void draw()
{
  background(255);
  noStroke();
  for (int i=0;i<particles.length;i++){
    particles[i].move();
    particles[i].collision();
    particles[i].draw();
  }
  
  stroke(128,128);
  Particle pi,pj;
  for (int i=0;i<particles.length;i++)
  {
    pi = particles[i];
    for (int j=i+1;j<particles.length;j++)
    {
      pj = particles[j];
      if (pi.distance(pj) <= 20){
        pi.drawConnection(pj);
      }
    }
  }
}

