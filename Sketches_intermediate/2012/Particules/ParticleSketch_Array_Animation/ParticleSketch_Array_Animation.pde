// Déclaration du tableau de particules
Particle[] particles;

void setup()
{
  size(400, 400);
  smooth();
  
  // Création du tableau de particules
  particles  = new Particle[2];

  // Création des particules
  for (int i=0;i<2;i++){
    particles[i] = new Particle(random(width), random(height));
  }
  
  // Options de dessin
  noStroke();
  fill(0);
}

void draw()
{
  background(255);
  for (int i=0;i<particles.length;i++){
    particles[i].move();
    particles[i].collision();
    particles[i].draw();
  }
}

