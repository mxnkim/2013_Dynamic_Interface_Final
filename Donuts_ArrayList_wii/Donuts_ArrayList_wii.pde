//hi

ArrayList arraydonuts; 

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress remoteLocation;

float btnA = 0;
float yaw;
float pitch;

void setup() {
  size(500, 500);
  //initialize
  arraydonuts = new ArrayList();
  arraydonuts.add(new Donut(width/2, height/2));
  
  oscP5 = new OscP5(this, 30000);
  remoteLocation = new NetAddress("localhost", 30001);
}

void draw() {
  background(255);
  for (int i = 0; i < arraydonuts.size(); i++) {
    Donut myDonut = (Donut) arraydonuts.get(i);
    myDonut.move();
    myDonut.display(i*10);
  }
  if(btnA == 1){
    arraydonuts.add(new Donut(yaw, pitch));
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
    pitch = map(pitch, 0, 1, width, 0);
  }

println(btnA);

}


