import processing.video.*;
import processing.data.XML;

Capture video;
Mapper mapper;
int captureLength = 480;

void setup(){
  //Init Mapper
  mapper = new Mapper(this, captureLength, captureLength);
  //rest of code
  size(displayWidth,displayHeight,P3D);
  frameRate(25);
  video = new Capture(this, captureLength, captureLength);
  video.start();
}

void draw(){
    if (video.available() == true) {
    video.read();
    mapper.render(video);
    }
}


