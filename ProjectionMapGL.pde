import processing.video.*;

Capture video;
Mapper mapper;
int captureLength = 480;


void setup(){
  mapper = new Mapper(this);
  size(displayWidth,displayHeight,P3D);
  frameRate(25);
  video = new Capture(this, 480, 480);
  video.start();
}

void draw(){
    if (video.available() == true) {
    video.read();
    mapper.render(video);
    }
}

void mouseClicked(){
mapper.mousePressed(this);
}




