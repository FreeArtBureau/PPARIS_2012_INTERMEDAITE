//fonction appelé automatiquement pour noter instance
// de ControlP5 (objet userInterface)

void controlEvent(ControlEvent e)
  {
    if(e.controller().id() == 1)
    {
     distMinParticules = e.controller().value(); 
    }
  }
 
