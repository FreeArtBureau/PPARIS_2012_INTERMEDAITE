// Importation des librairies liées au son
// dans le menu, Sketch > Import Library > Minim audio
// pour générer automatiquement ces lignes de code

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

// Variable qui stocke l'objet qui va contenir
// les données relatives à l'entrée micro, FFT, etc...
SoundAnalysis sa;

// setup
void setup()
{
  size(500,500);
  // Sound analysis avec 512 bandes par défaut pour la FFT
  //sa = new SoundAnalysis(this); 
  
  // Sound analysis avec 30 bandes par défaut pour la FFT
  sa = new SoundAnalysis(this,50); 
}

// draw
void draw()
{
  // On met à jour les données internes l'objet stocké dans la variable
  sa.update();
  
  // Utilisation variable niveau Micro
  background(255);
  noStroke();
  fill(#FF0000);
  
  // On dessine un cercle dont le diamètre dépend directement du niveau sonore
  ellipse(width/2,height/2,100+sa.getMicroLevel()*500,100+sa.getMicroLevel()*500);
  
  // Dessin du spectre
  stroke(0);
  sa.drawFFT(100);
  
  // Imprime la valeur de la bande
  fill(0);
  text("niveau de la bande 4 = "+sa.getFFTLevel(4),0,10);
}



