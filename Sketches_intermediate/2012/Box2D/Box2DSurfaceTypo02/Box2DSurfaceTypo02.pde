// Objet qui gère box2D
PBox2D box2d;

// Liste de particules Box2D
ArrayList<Box2DParticle> box2dParticles; 

// Surface
ArrayList<Box2DSurface> box2dSurfaces;

// TypoManager
TypoManager typo;

void setup()
{
  size(500, 500);

  // Creation de l'univers Box2D
  box2d = new PBox2D(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);

  // (Optionnel) création de limite physique sur l'écran
  //box2d_createScreenBoundaries(true, true, true, false);

  // Création de la liste de particules
  box2dParticles = new ArrayList<Box2DParticle>();

  // Création de la surface
  box2dSurfaces = new ArrayList<Box2DSurface>();

  // Création d'une forme géométrique à partir d'une typo et d'un texte
  typo = new TypoManager(this, "American Typewriter Bold BT.ttf", "P", 5);

  // Tranformation en surface Box2D
  int i, j;  
  for (i=0;i<typo.shapesNb();i++)
  {
    noFill();
    Box2DSurface s = new Box2DSurface(); 
    PVector[] pointsShape = typo.shape(i);
    for (j=0;j<pointsShape.length;j++)
    {
      PVector p = pointsShape[j];
      s.addPoint(p.x,p.y);
    }
    s.build();
    box2dSurfaces.add(s);
  }
}

void draw()
{
  background(255);

  // Interaction -> création de particules
  if (mousePressed)
  {
    Box2DParticle particule = new Box2DParticle(mouseX, mouseY, random(5,15));
    box2dParticles.add(particule);
  }

  for (int i = box2dParticles.size()-1; i >= 0; i--) {
    Box2DParticle p = box2dParticles.get(i); 
    if (p.done())
      box2dParticles.remove(i);
  }

  // Mise à jour de Box2D
  box2d.step();

  // Dessin
  fill(0);
  noStroke();
  for (Box2DParticle p:box2dParticles) {
    p.display();
  }

  for (Box2DSurface s:box2dSurfaces) {
//      s.display();
  }
}

