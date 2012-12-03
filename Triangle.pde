public class Triangle{
  
  PVector[] points;
  
  public Triangle(PVector p1, PVector p2, PVector p3){
    points = new PVector[3];
    points[0] = p1;
    points[1] = p2;
    points[2] = p3; 
  }
  
  public void render(PImage img, float x1, float y1, float x2, float y2, float x3, float y3){
    beginShape();
    texture(img);
    vertex(points[0].x, points[0].y, x1, y1);
    vertex(points[1].x, points[1].y, x2, y2);
    vertex(points[2].x, points[2].y, x3, y3);
    endShape();
  }

}
