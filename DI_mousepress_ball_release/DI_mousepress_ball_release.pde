ArrayList balls;
int ballWidth = 300;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress remoteLocation;

float btnA = 0;
float yaw;
float pitch;


void setup() {
  size(1280, 1024);
  smooth();
  noStroke();

  balls = new ArrayList();
  balls.add(new Ball(width/2, 0, ballWidth, int(random(0, 3))));

  oscP5 = new OscP5(this, 30000);
  remoteLocation = new NetAddress("localhost", 30001);
}

void draw() {
  background(0, 0);
  for (int i = balls.size()-1; i >= 0; i--) {
    Ball ball = (Ball) balls.get(i);
    ball.move();
    ball.display();
    //    if (ball.finished()) {
    //      balls.remove(i);
    //    }
  }

  if (btnA == 1) {
    balls.add(new Ball(yaw, pitch, random(ballWidth), int(random(0, 3))));
    ;
  }
}





void oscEvent(OscMessage message) {
  if (message.checkAddrPattern("/wii/a") == true) {
    btnA = message.get(0).floatValue();
  }
  else if (message.checkAddrPattern("/wii/yaw") == true) {
    yaw = message.get(0).floatValue();
    yaw = map(yaw, 0, 1, width, 0);
  }
  else if (message.checkAddrPattern("/wii/pitch") == true) {
    pitch = message.get(0).floatValue();
    pitch = map(pitch, 0, 1, 0, height);
  }

  println(btnA);
}

