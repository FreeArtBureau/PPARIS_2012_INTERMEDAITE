// Objet qui gère box2D
PBox2D box2d;

// Liste de particules Box2D
ArrayList<Box2DParticle> box2dParticles; 

// Surface
Box2DSurface box2dSurface;

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

  // Création des points de la surface
  float xoff = 0.0;
  for (float x = width+10; x > -10; x -= 5) {
    float y;
    if (x > width/2) {
      y = height/2 + (width - x)*1.1 + map(noise(xoff), 0, 1, -80, 80);
    } 
    else {
      y = height/2 + x*1.1 + map(noise(xoff), 0, 1, -80, 80);
    }
    
    box2dSurface.addPoint(x,y);
    xoff += 0.2;
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
    box2dSurface.display();
    for (Box2DParticle p:box2dParticles) {
      p.display();
    }
  }

