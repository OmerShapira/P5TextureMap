import processing.video.*;

Capture video;
PImage img;
int captureLength = 480;
ArrayList<PVector> buffer;
ArrayList<Triangle> triangles;

void setup(){
  buffer = new ArrayList<PVector>();
  triangles = new ArrayList<Triangle>();
  size(displayWidth,displayHeight,P3D);
  frameRate(25);
  video = new Capture(this, 480, 480);
  video.start();
  noStroke();
}

void draw(){
    background(0);
    if (video.available() == true) {
    video.read();
    }
    for (Triangle t : triangles){
    t.render(video, 0,480,240,0,480,0);
  }
}

void mousePressed(){
  PVector v = new PVector(mouseX, mouseY);
  if (buffer.size() == 2){
    triangles.add(
      new Triangle(buffer.get(0), buffer.get(1),v)
    );
  buffer.clear();  
} else {
  buffer.add(v);
}
}

public class Triangle{
  PVector[] points;
  /*
  public Triangle(float x1, float y1, float x2, float y2, float x3, float y3){
    points = {new PVector(x1,y1), new PVector(x2, y2), new PVector(x3,y3)}; 
  }*/
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
