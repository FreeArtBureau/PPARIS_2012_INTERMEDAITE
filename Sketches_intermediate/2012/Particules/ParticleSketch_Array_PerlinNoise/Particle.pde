class Particle
{
  PVector pos; // position
  PVector speed; // vitesse
  float d; // diamètre
  float noiseOffset = 0.0;
  float noiseOffsetVel;
  

    
  // Cosntructeur
  Particle(float x, float y)
  {
    pos = new PVector(x,y);
    speed = new PVector( random(-3,3), random(-3,3) );
    d = random(2)+2;
    noiseOffsetVel = random(0.02)+0.01;
  }
  
  // Méthode move
  // A pour but de déplacer notre particule
  void move()
  {
    noiseOffset += noiseOffsetVel;
    float noiseVal = noise( noiseOffset+pos.x*noiseScale,noiseOffset+pos.y*noiseScale );
    float angle = map(noiseVal,0,1,0,TWO_PI);
    speed.x = 1.0*cos(angle);
    speed.y = 1.0*sin(angle);
    // Ajout de la vitesse à la position de la particule
    pos.add(speed);
  }

  // Méthode collision
  // A pour but tester les collisions de notre billes avec les
  // bordures de l'écran
  void collision()
  {
    if (pos.x-d/2>=width)
      pos.x = -d/2;
    else
    if (pos.x+d/2<=0)
      pos.x = width+d/2;

    if (pos.y-d/2>=height)
      pos.y = -d/2;
    else
    if (pos.y+d/2<=0)
      pos.y = height+d/2;
  }
  
  void draw()
  {
    ellipse(pos.x,pos.y,d,d);
  }
  
  void drawConnection(Particle other)
  {
    line(pos.x, pos.y, other.pos.x, other.pos.y);
  }
  
  float distance(Particle other)
  {
    return dist(pos.x, pos.y, other.pos.x, other.pos.y);
  }
  
}
