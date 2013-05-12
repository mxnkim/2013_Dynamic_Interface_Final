import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress remoteLocation;

float btnA = 0;
float btnB = 0;
float pitch;
float yaw;

ArrayList arraydonuts; 

void setup() {
  size(500, 500);

  arraydonuts = new ArrayList();
  arraydonuts.add(new Donut(width/2, height/2));
  
  oscP5 = new OscP5(this, 30000);
  remoteLocation = new NetAddress("localhost", 30001);
}

void draw() {
//  background(255);
//  for (int i = 0; i < arraydonuts.size(); i++) {
//    Donut myDonut = (Donut) arraydonuts.get(i);
//    myDonut.move();
//    myDonut.display(i*10);
//  }
  
 
     if(btnA == 1){
 
      for (int i = 0; i < arraydonuts.size(); i++) {
        Donut myDonut = (Donut) arraydonuts.get(i);
//        myDonut.move();
        myDonut.display(i*10);
        }
     
        arraydonuts.add(new Donut(random(0,width), 200));
      }
  println(btnA);
    
}

void oscEvent(OscMessage message) {
  if (message.checkAddrPattern("/wii/a") == true) {
    btnA = message.get(0).floatValue();
  }
  else if (message.checkAddrPattern("/wii/b") == true) {
    btnB = message.get(0).floatValue();
  }
}
