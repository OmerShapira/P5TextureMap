

public class Mapper {
  ArrayList<PVector> buffer;
  HashSet<Triangle> triangles;
  PApplet parent;
  SamplerTriangle st;
  int w, h;
  boolean  generateTriangles = true;
  
  Triangle editedTriangle;
  boolean pointDragging = false;
  PVector pointDragged;
/**
* Constructor
* @param parent The parent applet
* @param w the width of the sampling canvas
* @param h the height of the sampling canvas
*/

  public Mapper(PApplet parent, int w, int h) {
    //Init 
    this.parent = parent;
    buffer = new ArrayList<PVector>();
    triangles = new HashSet<Triangle>();

    //Set constraints for sampling the image
    this.w = w;
    this.h = h;
    //Set up default sample triangle
    st = new SamplerTriangle(
    new PVector(0, h), 
    new PVector(w/2, 0), 
    new PVector(w, h)
      );

    //Sign up for events
    parent.registerMouseEvent(this);
    parent.registerKeyEvent(this);
  }

  public void render(PImage img) {
    parent.noStroke();
    background(0);
    for (Triangle t : triangles) {
      t.render(img, st.points[0], st.points[1], st.points[2]);
    }
  }

  private void mouseClicked(PApplet p, int x, int y) {
    PVector v = new PVector(x,y);
    //Triangle Generator Mode
    if (generateTriangles){
      if (buffer.size() == 2) {
        triangles.add(
        new Triangle(buffer.get(0), buffer.get(1), v)
          );
        buffer.clear();
      } 
      else {
        buffer.add(v);
      }
    } else {
      //Triangle Editor Mode
      /**
      * Find the last triangle added and change it. Set the rest off
      */
      PVector pv = new PVector(x,y);
      for (Triangle t : triangles){
        if (contains(pv, t.points)){
          t.setEditable(true);
          editedTriangle = t;
        } else {
          t.setEditable(false);
        }
      }
    
  }
}

  public boolean save(String filename){
    //TODO Write
    //TODO return significant info
    return true;
  }

  public boolean load(String filename){
    //TODO Write
    //TODO return significant info
  return true;
  }

  void mouseEvent(MouseEvent event) {
    // get the x and y pos of the event
    int x = event.getX();
    int y = event.getY();
    PVector v = new PVector(x,y);
    switch (event.getID()) {
    case MouseEvent.MOUSE_PRESSED:
      try{
        if (editedTriangle.editable){
        for (PVector p : editedTriangle.points){
          println(p.dist(v));
          if (p.dist(v)< 10){
            pointDragging = true;
            pointDragged = p;
            println("point caught!");
            }
          }
        }
      } catch (NullPointerException e) {
        //do nothing
      }
      break;
    case MouseEvent.MOUSE_RELEASED:
      pointDragging = false;
      try {
        editedTriangle.setEditable(false);  
      } catch (NullPointerException e) {
        
      }
      
      break;
    case MouseEvent.MOUSE_CLICKED:
      mouseClicked(parent,x,y);
      break;
    case MouseEvent.MOUSE_DRAGGED:
      if (pointDragging){
              pointDragged.set(v);
            }
      // do something...
      break;
    case MouseEvent.MOUSE_MOVED:
      // do something...
      break;
    }
  }

  void keyEvent(KeyEvent event){
    switch(event.getID()){
      case KeyEvent.KEY_PRESSED:
      if (event.getKeyChar() == 'e') {
        generateTriangles=!generateTriangles;
      } else if (event.getKeyCode()==KeyEvent.VK_BACK_SPACE){
        println("trying to delete");
        try {
          if(editedTriangle.editable){
            triangles.remove(editedTriangle);
          }
        } catch (NullPointerException e) {
          
        }
      }
      break;
      default:
      break;
    }
  }

    /**
     * Return true if the given point is contained inside the boundary.
     * See: http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
     * @param test The point to check
     * @return true if the point is inside the boundary, false otherwise
     *
     */
  private boolean contains(PVector test, PVector[] points) {
    int i;
    int j;
    boolean result = false;
    for (i = 0, j = 2; i < 3; j = i++) {
      if ((points[i].y > test.y) != (points[j].y > test.y) &&
          (test.x < (points[j].x - points[i].x) * (test.y - points[i].y) / (points[j].y-points[i].y) + points[i].x)) {
        result = !result;
       }
    }
    return result;
  }


}

