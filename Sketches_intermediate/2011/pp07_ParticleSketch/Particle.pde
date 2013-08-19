class Particle {


  ///position, diametre...=membres de la classe

    //position
  float x;
  float y;

  //diamètre
  float d;

  //couleur
  color c;

  //gravité
  float g=0.3;


  float vx, vy;
  
  float s= 0.3;



  //constructeurs (tous le meme noms!)
  Particle()
  {
    x = random(width);
    y = random(height);

    d = random(50);

    c = color(map(d, 0, 50, 40, 255), 30, 100);

    vx = random(-s, s);
    vy = random(-s, s);
  }

  Particle(float x_, float y_, float d_)
  {
    this.x = x_;
    this.y = y_;
    this.d = d_;
    c = color(map(d, 0, 50, 40, 255), 30, 100);
  }




  //méthode de classe
  void execute() {
    movement();
    colide();
    gravity();
    display();
  }



  void movement() {
    x += vx;
    y += vy;
  }


  void colide() {
    if (x+d/2>width ) {
      vx = -vx;
    }
    if ( x<d/2) {
      vx = -vx;
    }
    if (y+d/2>height) {
      y=height-d/2;
      vy = -vy;
    }
    if ( y<d/2) {
      vy = -vy;
    }
  }

  void gravity() {
    vy += g;
    vx+=random(-g,g);

  }


  //lien entre les particule
  float distance(Particle p)
  {
    return dist(this.x, this.y, p.x, p.y);
  }

  void display() {
    //ellipse(this.x, this.y, this.d, this.d);
  }
};

