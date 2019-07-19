float AIRDRAG = 0.2;
float GRAVITY = 2.0;
float ELASTICITY = 0.1;

ArrayList<tentacle> arms;

void setup(){
  size(800,500);
  ellipseMode(CENTER);
  
  arms = new ArrayList<tentacle>();
  addArm(new PVector(width*0.35+40,height/2+random(-20,20)));
  addArm(new PVector(width*0.35+40,height/2+random(-20,20)));
  addArm(new PVector(width*0.35+40,height/2+random(-20,20)));
  addArm(new PVector(width*0.35+40,height/2+random(-20,20)));
}

void draw(){
  background(0, 119, 190);
  noFill();
  stroke(255);
  update();
  drawHead();
  drawMantle();
  drawFin();
  drawArms();
}

void update(){
  for(int i = 0; i<arms.size();i++){
    // make the 2nd and 5th segment wiggle in random directions, other segments will follow
    arms.get(i).getNObj(2).applyForce(PVector.random2D().setMag(3));
    arms.get(i).getNObj(5).applyForce(PVector.random2D().setMag(3));
  }
}

void drawHead(){
  ellipse(width*0.35,height/2,90,90);
}

void drawMantle(){
  ellipse(width*0.25,height/2,250,100);
}

void drawFin(){
  beginShape();;
  vertex(width*.1,height/2-40);
  vertex(width*.05,height/2);
  vertex(width*.1,height/2+40);
  endShape(CLOSE);
}

void drawArms(){
  // for each spring draw
  for(int i = 0; i<arms.size(); i++){
    arms.get(i).display();
  }
}

void addArm(PVector anchor){
  arms.add(new tentacle(anchor, 10));
}
