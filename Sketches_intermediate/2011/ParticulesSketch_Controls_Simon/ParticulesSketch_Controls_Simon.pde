//importinterface
import controlP5.*;



//Particle p, p1, p2;
//tableau statique
Particle[] particules;

int nbParticules = 32; //nombre de particules
float distMinParticules = 200; //distance minimal entre les particules

//interface
ControlP5 userInterface;


void setup(){
  size(600,600);
  smooth();
 /*  
  p = new Particle(); 
  p1 = new Particle(); 
  p2 = new Particle(50,50,10); 
  */
  
  
  //interface utilisateur
  userInterface = new ControlP5(this);
  //"nom",distance min,distance max, x,y, width, height
  Controller sliderDistMin = userInterface.addSlider("dist.minimale", 10, 500, 20, 20,100,10); 
  sliderDistMin.setId(1);

 
  
    
  
  //construction tableau
  particules = new Particle[nbParticules];
  for (int i=0;i<nbParticules;i++)
    particules [i] = new Particle();
    
  println( particules[1].x );
  }





void draw(){
  
  background(0);
  
  fill(0);
 /*
  p.draw();
  p1.draw();
  p2.draw();
*/
  float dpart=0;
  float a=0; // transparence de la ligne
  for (int i=0;i<nbParticules;i++)
  {  
    noStroke(); //pas de contour
    particules[i].move();
    particules[i].collide();
    particules[i].draw();
    
    // connexions ?
    //stroke (150);
    for (int j=i+1;j<nbParticules;j++)
      {
      dpart = particules[i].distance(particules[j]);
      if (dpart <= distMinParticules)
        {
        //dpart varie entre 0 et distMinParticules
        // on veut une transparence qui varie entre 255 et 0 => map
        a = map(dpart,0,distMinParticules,255,50);
        stroke(255, a); //20 = niveau de gris, a = transparence
        strokeWeight (5); //largeur des lignes
        line(particules[i].x, particules[i].y, particules[j].x, particules[j].y);
        }
      }
    }
}
