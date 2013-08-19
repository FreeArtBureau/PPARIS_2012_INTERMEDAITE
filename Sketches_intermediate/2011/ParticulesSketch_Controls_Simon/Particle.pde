class Particle{
  //Position de la particule sur l'écran
  float x;
  float y;
  //vitesse
  float vx,vy;

  //diamètre
  float d;
  //couleur
  color c;
  
  //Constructeur
  Particle()
  {
    this.x = random(width);
    this.y = random(height);
    vx = random(-5,5);
    vy = random(-5,5);
    
    this.d = random(100); // diametre des particules
    
    // calcule de la valeur d comprise entre 0 et 100
    // en une valeur comprise entre 0,255 :
    //this. c = color ( map(d,0,100,255,0) );
    
    //multi couleurs :
    //this. c = color ( random(255), random(255), random(255), random(255) );
    this. c = color (255);

  }
  
  //valeur constante
  Particle(float x_, float y_, float d_)
  {
  this.x = x_;
  this.y = y_;
  this.d = d_;
  }
  
  
  
  //vitesse
  void collide(){
      if (x+d/2>width)
      {
        x = width - d/2;
        vx = -vx;
      }
      if (x<d/2)
      {
        x = d/2;
        vx = -vx;
      }
      
      if (y+d/2>height)
      {
        y = height - d/2;
        vy = -vy;
      }
      if (y<d/2)
      {
        y = d/2;
        vy = -vy;
      }
  }
  
  
  
  void move()
  {
    // x = x + vx;
    x += vx;
    y += vy;
    vy +=0.05; // vitesse des particules
  }  
  
  
  // distance
  float distance (Particle p)
  {
    return dist (this.x, this.y, p.x, p.y);
  }

  //draw
  void draw()
  {
    //
    fill(c);
    ellipse(this.x, this.y, this.d, this.d);  
  }

  
};
