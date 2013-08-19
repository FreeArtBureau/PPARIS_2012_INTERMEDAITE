/* ****************************************************

Atelier Processing / Cras / 12-13 Avril 2008

Julien 'v3ga' Gachadoat
http://www.v3ga.net

**************************************************** */

import damkjer.ocd.*;
import noc.*;

Timer t;
SystemeParticules systeme;
Camera maCamera;

void setup()
{
  size(400,400,P3D);
  rectMode(CENTER);
  systeme = new SystemeParticules(100, new Vector3D(0,0,0));
  maCamera = new Camera(this,0,-200,300);
  t = new Timer();
}

void draw()
{
  // On applique les forces (gravite)
  // Et on anime (acceleration -> vitesse -> position) pour chaque particule
  systeme.appliqueForces();
  systeme.anime( t.getDeltaS() );

  // Place la camera
  maCamera.aim(0,0,0);
  maCamera.feed();

  // Dessin
  background(255);
  // Transformation globale
  rotateY(float(mouseX)/float(width)*TWO_PI);
  // Dessin des particules
  systeme.dessine();
}

void keyPressed()
{
  saveFrame();
}
