class Particle
{
  PVector pos; // position
  PVector speed; // vitesse
  float d; // diamètre
  
  // Cosntructeur
  Particle(float x, float y)
  {
    pos = new PVector(x,y);
    speed = new PVector( random(-10,10), random(-10,10) );
    d = random(20)+2;
  }
  
  // Méthode move
  // A pour but de déplacer notre particule
  void move()
  {
    // Ajout de la vitesse à la position de la particule
    pos.add(speed);
  }

  // Méthode collision
  // A pour but tester les collisions de notre billes avec les
  // bordures de l'écran
  void collision()
  {
    if (pos.x - d/2 <= 0 || pos.x+d/2>=width)
      speed.x = -speed.x;
    if (pos.y - d/2 <= 0 || pos.y+d/2>=height)
      speed.y = -speed.y;
  }
  
  void draw()
  {
    ellipse(pos.x,pos.y,d,d);
  }
  
}
