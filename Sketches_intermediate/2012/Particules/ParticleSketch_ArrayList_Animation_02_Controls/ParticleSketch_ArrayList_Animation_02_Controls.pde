// Importation de la librairie
import controlP5.*;

// Déclaration du tableau de particules
ArrayList particles;

// Instance de la classe ControlP5
ControlP5 controlP5;
ControlWindow controlWindow;
boolean controlP5Window = true;

// Données associées à ces controles
boolean isDrawParticles = false;
boolean isDrawConnexions = true;
float speedAmplitude = 2.0;


void setup()
{
  size(400, 400);
  smooth();

  // Objet qui va gérer les controles
  controlP5 = new ControlP5(this);

  // Création des controles
  // toggle pour controler le dessin des particules
  Controller tgDrawParticles = controlP5.addToggle("Draw particles?", isDrawParticles, 10, 10, 10, 10);
  tgDrawParticles.setId(1);

  // toggle pour controler le dessin des connexions
  Controller tgDrawConnec = controlP5.addToggle("Draw connexions?", isDrawConnexions, 10, 40, 10, 10);
  tgDrawConnec.setId(2);

  // slider pour controler l'amplitude de la vitesse
  Controller sliderSpeed = controlP5.addSlider("Speed", 0, 10, speedAmplitude, 10,70,150,10);
  sliderSpeed.setId(3);


  // Fenêtre externe ? 
  if (controlP5Window)
  {
    controlP5.setAutoDraw(false);
    controlWindow = controlP5.addControlWindow("Interface", 100, 100, 200, 200);
    controlWindow.setBackground( color(0) );

    tgDrawParticles.setWindow(controlWindow);
    tgDrawConnec.setWindow(controlWindow);
    sliderSpeed.setWindow(controlWindow);
  }

  // Création du tableau de particules
  particles  = new ArrayList();
}

void draw()
{
  background(255);
//  filter(BLUR,1);

  fill(0);
  noStroke();
  Particle p;
  for (int i=0;i<particles.size();i++) {
    p = (Particle)particles.get(i);
    p.move();
    p.collision();
    if (isDrawParticles)
      p.draw();
  }

  if (isDrawConnexions)
  {
    stroke(128, 128);
    Particle pi, pj;
    float d;
    for (int i=0;i<particles.size();i++)
    {
      pi = (Particle) particles.get(i);
      for (int j=i+1;j<particles.size();j++)
      {
        pj = (Particle) particles.get(j);
        d = pi.distance(pj);
        if ( d <= 70) {
          pi.drawConnection(pj,d);
        }
      }
    }
  }
}

void mouseDragged()
{
 particles.add( new Particle(mouseX, mouseY) ); 
}

void keyPressed()
{
  if (keyCode == BACKSPACE)
  {
    if (particles.size()>0)
     particles.remove( 0 ); 

  }  
}

