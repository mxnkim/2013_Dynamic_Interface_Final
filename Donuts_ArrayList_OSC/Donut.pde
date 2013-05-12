class Donut { 
  color c; 
  float xPos;
  float yPos;
  float ySpeed;
  float acc;
  float x,y;

  Donut(float tempX, float tempY) { 
    c = color(209, 67, 15);
    xPos = tempX;
    yPos = tempY;
    ySpeed = 4;
    acc = random(0.05,0.3);
  }

  void display(color tempC) { 
    rectMode(CENTER);
    noStroke();
    fill(tempC);
    smooth();
    ellipse(xPos,yPos,x,y);  
    x +=1;
    y+=1;
    
  }

  void move() { 
    ySpeed += acc;
    yPos +=  ySpeed;
    if ((yPos >= height)||(yPos==0)) {
      ySpeed *= -1;
    }
  }
}
