class Particule
{
  Vector3D position;
  Vector3D vitesse;
  Vector3D acceleration;
  float masse;
  int taille;
  float age;
  float ageMax;

  Particule(float m)
  {
    masse = m;
    taille = 10;
    age = 0;
    ageMax = random(2,5);
    position       = new Vector3D();
    vitesse        = new Vector3D();
    acceleration   = new Vector3D();
  
    rndVitesse();
  }
  
  void init(Vector3D p)
  {
     age = 0;
     position = p.copy();
     rndVitesse();
  }
  
  void rndVitesse()
  {
     vitesse.x = random(-1,1);
     vitesse.y = -random(3,5);
     vitesse.z = random(-1,1);
  }

  void appliqueForce(Vector3D f)
  {
    acceleration.x = f.x / masse;
    acceleration.y = f.y / masse;
    acceleration.z = f.z / masse;
  }

  void anime(float dt)
  {
     age+=dt;
     position.add(vitesse);
     vitesse.add(acceleration);

     if (position.y >= 0.0 && vitesse.y > 0.0)
     {
       position.y = 0.0;
       vitesse.y *= -0.7;
     }
  }

  void dessine()
  {
    fill(200,0,0,(1.0-age/ageMax)*255);
    pushMatrix();
      translate(position.x, position.y, position.z);
      box(taille);
    popMatrix();
  }

  boolean meurt()
  {
    return (age >= ageMax);
  }
}
