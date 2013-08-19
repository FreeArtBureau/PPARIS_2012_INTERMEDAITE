// Objet qui gère box2D
PBox2D box2d;

// Liste de particules Box2D
ArrayList<Box2DParticle> box2dParticles; 

// Surface
Box2DSurface box2dSurface;
boolean isShowSurface = true;

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
  box2d_createScreenBoundaries(true, true, true, false);

  // Création de la liste de particules
  box2dParticles = new ArrayList<Box2DParticle>();

  // Création de la surface
  box2dSurface = new Box2DSurface();

  // Création d'une forme géométrique à partir d'une typo et d'un texte
  typo = new TypoManager(this,"American Typewriter Bold BT.ttf","P",5);

  // Tranformation en surface Box2D
  for (PVector p:typo.listePoints){
    box2dSurface.addPoint(p.x,p.y);
  }  

  // Construction de la surface
  box2dSurface.build();
  
  }

  void draw()
  {
    background(255);

    // Interaction -> création de particules
    if (mousePressed)
    {
      Box2DParticle particule = new Box2DParticle(mouseX, mouseY, 5);
      box2dParticles.add(particule);
    }

    for (Box2DParticle p:box2dParticles) {
      p.done();
    }

    // Mise à jour de Box2D
    box2d.step();

    // Dessin
    if (isShowSurface){
      box2dSurface.display();
    }

    for (Box2DParticle p:box2dParticles) {
      p.display();
    }
  }

void keyPressed()
{
  isShowSurface = !isShowSurface;
}
