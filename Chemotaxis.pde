class Nematode{
  int x, y, myColor;
  Boolean edge;
  Nematode(){
    x = (int)(Math.random()*25+190);
    y = (int)(Math.random()*25+320);
    edge = false;
    myColor = color((int)(Math.random()*20)+170, (int)(Math.random()*15)+160, (int)(Math.random()*20)+215);
  }
  void walk(){
    if(edge == false){
      x = x + (int)(Math.random()*3)-2;
      y = y + (int)(Math.random()*3)-2;
    }
  }
  void distance(){
    if(dist(x, y, 200, 200) < 150){
      edge = false;
    }
    else
      edge = true;
  }
  void show(){
    fill(myColor);
    ellipse(x, y, 10, 10);
  }
}

Nematode [] worm;

void setup(){
  size(400,400);
  //frameRate(7);
  worm = new Nematode [100];
  for(int i = 0; i < 100; i++){
    worm[i] = new Nematode();
  }
}

void draw(){
  background(200);
  stroke(21, 19, 28);
  fill(200);
  //drawing plate
  ellipse(200, 200, 300, 300);
  line(60, 150, 150, 150); //left box top
  line(150, 150, 150, 250); //left box side
  line(60, 250, 150, 250); //left box bottom
  line(340, 150, 250, 150); //right box top
  line(250, 150, 250, 250); //right box side
  line(250, 250, 340, 250); //right box bottom
  arc(200,350,75,75, PI+.18, 2*PI-.18);
  //end of drawing plate
  for(int i = 0; i < 100; i++){
    worm[i].show();
    worm[i].distance();
    worm[i].walk();
  }
}
