// Objet qui gère box2D
PBox2D box2d;

// Liste de particules Box2D
ArrayList<Box2DParticle> box2dParticles; 

PVector gravity;

void setup()
{
  size(500,500);

  gravity = new PVector(0,-10);

  // Creation de l'univers Box2D
  box2d = new PBox2D(this);
  box2d.createWorld();
  box2d.setGravity(gravity.x, gravity.z);

  // (Optionnel) création de limite physique sur l'écran
  box2d_createScreenBoundaries(true,true,true,true);

  // Création de la liste de particules
  box2dParticles = new ArrayList<Box2DParticle>();
}

void draw()
{
  background(255);

  // Interaction -> création de particules
  if (mousePressed)
  {
    Box2DParticle particule = new Box2DParticle(mouseX,mouseY,5);
    box2dParticles.add(particule);
  }

/*  for (Box2DParticle p:box2dParticles){
    p.done();
  }
*/

  // Mise à jour de Box2D
  box2d.step();

  // Dessin
  for (Box2DParticle p:box2dParticles){
    p.display();
  }
}

