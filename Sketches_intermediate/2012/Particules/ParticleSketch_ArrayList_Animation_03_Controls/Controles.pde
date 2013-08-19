// Méthode qui est appelée lorsqu'un évènements (click souris, mouvement slider, etc...)
// se produit sur un des controles.
void controlEvent(ControlEvent theEvent) 
{
  switch(theEvent.controller().id()) {
    case 1:
      isDrawParticles = ( theEvent.controller().value() == 1.0 );
    break;
    case 2:
      isDrawConnexions = ( theEvent.controller().value() == 1.0 );
    break;  
    case 3:
       speedAmplitude = theEvent.controller().value();
        for (Particle p:particles) {
        p.speed.set( random(-speedAmplitude,speedAmplitude), random(-speedAmplitude,speedAmplitude), 0 );
      }
    break;
  }
}
