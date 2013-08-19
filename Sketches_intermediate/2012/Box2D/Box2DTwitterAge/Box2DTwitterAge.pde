PBox2D box2d;
Twitter twitter;
ArrayList<Box2DParticle> box2dParticles;
PFont font;
int nbMaxParticles = 10;

void setup()
{
  size(800, 600);
  smooth();

  // Creation de l'univers Box2D
  box2d = new PBox2D(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);

  // (Optionnel) création de limite physique sur l'écran
  box2d_createScreenBoundaries(true,true,true,false);

  // Fonte
  font = loadFont("Futura-Medium-24.vlw");
  textFont(font,12);
  
  // Liste de particules
  box2dParticles = new ArrayList<Box2DParticle>();

  // Initialisation de twitter
  twitter = new Twitter("#pp2012", 1, true);
  twitter.setup();
  
}

void draw()
{
  
  // Récupétation d'un message
  String message = twitter.update();
  if (message !=null)
  {
    String[] words = splitTokens(message);
    for (int i=0;i<words.length;i++){
      box2dParticles.add( new  Box2DParticle(random(width),height/3,words[i]) );
    }
  }
  
  if (box2dParticles.size() > nbMaxParticles)
  {
    int nbDiff =  box2dParticles.size() - nbMaxParticles;
    for (int i=0;i<nbDiff;i++){
      Box2DParticle p = box2dParticles.get(i);
      p.killBody();
      box2dParticles.remove(i);
    }
  }
  
  
  // Mise à jour de Box2D
  box2d.step();

  // Dessin
  background(255);
  for (Box2DParticle p:box2dParticles){
    p.display();
  }
  
}
