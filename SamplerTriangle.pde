class SamplerTriangle {
  public PVector[] points;
  public SamplerTriangle(PVector p1, PVector p2, PVector p3) {
    points = new PVector[3];
    points[0] = p1;
    points[1] = p2;
    points[2] = p3;
  }
}

