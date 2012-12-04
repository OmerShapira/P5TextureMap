public class Triangle{
  boolean editable = false;
  PVector[] points;
  
  public Triangle(PVector p1, PVector p2, PVector p3){
    points = new PVector[3];
    points[0] = p1;
    points[1] = p2;
    points[2] = p3; 
  }
  
  public void render(PImage img, PVector rp1,PVector rp2,PVector rp3){
    beginShape();
    texture(img);
    vertex(points[0].x, points[0].y, rp1.x, rp1.y);
    vertex(points[1].x, points[1].y, rp2.x, rp2.y);
    vertex(points[2].x, points[2].y, rp3.x, rp3.y);
    endShape();
    if (editable) displayControlPoints();
  }
  
  public void setEditable(boolean b){
    editable = b;
  }
  
  public void displayControlPoints(){
  pushStyle();
    fill(0,255,0);
  for (PVector p : points){
     ellipse(p.x, p.y, 10,10);
    }
    popStyle();
  }

}
