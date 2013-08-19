Twitter tw;

// ------------------------------------------------------------
// setup
// ------------------------------------------------------------
void setup()
{
  tw = new Twitter("#pp2012", 1); // mot clé, délai avant de recevoir le prochain message
  tw.setup();
}

// ------------------------------------------------------------
// draw
// ------------------------------------------------------------
void draw()
{
  // Mise à jour (recherche de nouveaux tweets etc...)
  String txt = tw.update();
  // Si on a un nouveau message alors ...
  if (txt!=null)
  {
    println(txt);
  }
  
}

