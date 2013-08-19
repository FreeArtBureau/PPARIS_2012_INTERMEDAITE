// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// PBox2D example

// An uneven surface boundary

class Box2DSurface {
  // We'll keep track of all of the surface points
  ArrayList<Vec2> surface;


  Box2DSurface() {
    surface = new ArrayList<Vec2>();
  }
  
  void addPoint(float x, float y){
      surface.add(new Vec2(x,y));
  }

  void build()
  {
    // Build an array of vertices in Box2D coordinates
    // from the ArrayList we made
    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i < vertices.length; i++) {
      Vec2 edge = box2d.coordPixelsToWorld(surface.get(i));
      vertices[i] = edge;
    }
    
    // Create the chain!
    ChainShape chain = new ChainShape();
    chain.createChain(vertices,vertices.length);

    // The edge chain is now attached to a body via a fixture
    BodyDef bd = new BodyDef();
    bd.position.set(0.0f,0.0f);
    Body body = box2d.createBody(bd);
    // Shortcut, we could define a fixture if we
    // want to specify frictions, restitution, etc.
    body.createFixture(chain,1);
  }


  // A simple function to just draw the edge chain as a series of vertex points
  void display() {
    strokeWeight(2);
    stroke(0);
    noFill();
    beginShape();
    for (Vec2 v: surface) {
      vertex(v.x,v.y);
    }
    endShape();
  }

}


