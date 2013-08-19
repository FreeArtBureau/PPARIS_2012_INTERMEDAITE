class SystemeParticules
{
  int nombre;
  Particule[] particules;
  Vector3D position;
  Vector3D gravite;
  float tailleSol;
  
  SystemeParticules(int nombre, Vector3D p)
  {
    this.nombre = nombre;
    this.particules = new Particule[nombre];
    for (int i=0;i<nombre; i++)
      this.particules[i] = new Particule(1.0);
    position = p;
    gravite = new Vector3D(0,0.1,0);
    tailleSol = 160;
  }

  
  void dessine()
  {
     // Dessin du sol
     noFill();
     stroke(100);

    beginShape(QUADS);
      vertex(-tailleSol, 0, tailleSol);
      vertex(-tailleSol, 0, -tailleSol);
      vertex(tailleSol, 0, -tailleSol);
      vertex(tailleSol, 0, tailleSol);
    endShape();
     
    
     // Dessin des particules
     noStroke();
     for (int i=0;i<nombre;i++)
       this.particules[i].dessine();
  }

  void appliqueForces()
  {
     for (int i=0;i<nombre;i++)
        this.particules[i].appliqueForce(gravite);
  }

  void anime(float dt)
  {
      Particule p;
     for (int i=0;i<nombre;i++)
     {
       p = this.particules[i];
       p.anime(dt);
       if (p.meurt())
         p.init(position);
     }
  }
  
}
