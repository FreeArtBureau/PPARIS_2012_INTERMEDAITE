/*
  Sketch par http://www.boplbopl.com/
  Processing Paris #02
*/

import processing.opengl.*;


//tableau statique
Particle[] particles;
int nbParticles = 50;
int distMin=200;
int cBall;

void setup() {
  size(750, 750, OPENGL);
  smooth();

  //construction du tableau
  particles = new Particle[nbParticles];

  //instanciation de la classe Particle
  for (int i =0;i<nbParticles;i++) {
    particles[i] = new Particle();
  }
  //println(particles[5].x);
}


void draw() {
  background(33);
  noFill();
  strokeWeight(0.2);
  //variable locale
  float dpart=0;
  for (int i =0;i<nbParticles;i++) {
    // connexions
    for (int j =1;j<nbParticles;j++) {
      //stockage de la distance
      dpart = particles[i].distance(particles[j]);
      if (dpart <= distMin) {
        stroke(255, map(dpart, 0, distMin, 150, 0));
        line(particles[i].x, particles[i].y, particles[j].x, particles[j].y);
        ellipse(particles[i].x, particles[i].y, dpart/2, dpart/2);
      }
    }
    particles[i].execute();
  }
}

