import geomerative.*;
boolean TypoManager_isGeomerativeInit = false;
class TypoManager
{
  // programme parent
  PApplet applet;

  // Variable qui va stocker notre fonte TTF
  RFont fonte;

  // Forme du texte
  RShape forme;
  
  // Liste des points
  ArrayList<PVector> listePoints;
  
  TypoManager(PApplet applet_, String fontName_, String texte, float segmentLength){
    this.applet = applet_;
    if (TypoManager_isGeomerativeInit == false){
      TypoManager_isGeomerativeInit = true;
      RG.init(applet);
    }
   
    fonte = new RFont(fontName_, 200, RFont.CENTER);
    RCommand.setSegmentLength(segmentLength);
    RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

    forme= fonte.toShape(texte);
    forme = RG.centerIn(forme,applet.g,50);

    RPoint[] points = forme.getPoints();
    listePoints = new ArrayList<PVector>();
    for (int i=0;i<points.length;i++){
      listePoints.add( new PVector(points[i].x+width/2,points[i].y+height/2) );
    }
  }
  
  void draw()
  {
    for (PVector p:listePoints){
      ellipse(p.x,p.y,5,5);
    }
  }
}
