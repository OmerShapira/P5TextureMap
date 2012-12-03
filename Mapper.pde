public class Mapper{
ArrayList<PVector> buffer;
ArrayList<Triangle> triangles;
PApplet parent;

public Mapper(PApplet parent){
  this.parent = parent;
  buffer = new ArrayList<PVector>();
  triangles = new ArrayList<Triangle>();

}

public void render(PImage img){
  parent.noStroke();
  background(0);
  for (Triangle t : triangles){
   t.render(video, 0,480,240,0,480,0);
  }
}

public void mousePressed(PApplet p){
  PVector v = new PVector(p.mouseX, p.mouseY);
  if (buffer.size() == 2){
    triangles.add(
      new Triangle(buffer.get(0), buffer.get(1),v)
    );
  buffer.clear();  
} else {
  buffer.add(v);
}
}

}
