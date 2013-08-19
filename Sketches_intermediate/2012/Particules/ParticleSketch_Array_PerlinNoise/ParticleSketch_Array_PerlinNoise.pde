// Déclaration du tableau de particules
Particle[] particles;

float noiseScale = 0.02;

void setup()
{
  size(400, 400);
  smooth();
  
  // Création du tableau de particules
  particles  = new Particle[100];

  // Création des particules
  for (int i=0;i<particles.length;i++){
    particles[i] = new Particle(random(width), random(height));
  }
  
  // Options de dessin
  noStroke();
  fill(0,10);
  background(255);
}

void draw()
{

//  background(255);
  noStroke();
  for (int i=0;i<particles.length;i++){
    particles[i].move();
    particles[i].collision();
    particles[i].draw();
  }
  
//  filter(BLUR,1);
}

