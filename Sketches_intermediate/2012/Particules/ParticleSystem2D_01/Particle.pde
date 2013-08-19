class Particle
{
  PVector pos; // position
  PVector speed; // vitesse
  PVector acc; // accélération
  PVector force; // force appliqué à l'objet (dépend de la masse)
  float d; // diamètre
  float mass; // fonction du diamètre
  
  // Cosntructeur
  Particle(float x, float y)
  {
    pos = new PVector(x,y);
    d = random(20)+10;
    mass = 0.1*d;
    force = new PVector();
    acc = new PVector();
    initialSpeed();
  }
  
  void initialSpeed()
  {
    float angle = -PI/2 - random(-PI/10, PI/10);
    float speed0 = 2.0f;
    speed = new PVector( speed0*cos(angle), speed0*sin(angle) );
  }
  
  // Méthode move
  // A pour but de déplacer notre particule
  void move()
  {
    // Calcule la force appliqué à l'objet
    force.set(g);
    
    // Calcule l'accélération (loi de Newton)
    acc.set(force.x / mass, force.y / mass,0);
    
    // Ajoute l'accélération à la vitesse de la particule
    speed.add(acc);
    
    // Ajout de la vitesse à la position de la particule
    pos.add(speed);
  }
  void draw()
  {
    ellipse(pos.x,pos.y,d,d);
//    image(img,pos.x,pos.y,d,d);
  }
    
}
