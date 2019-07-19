class mover {  
  PVector location, velocity, acceleration;
  float mass;
  mover(PVector loc){
    this.location = loc;
    this.velocity = new PVector();
    this.acceleration = new PVector();
    this.mass = 2.0;
  }
  
  void display(){}
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  boolean inBounds(){
    return (this.location.x < width + this.mass && this.location.x > -this.mass 
        && this.location.y < height + this.mass && this.location.y > -this.mass);
  }

  float distance(mover e){
    return dist(e.location.x,e.location.y,this.location.x,this.location.y);
  }
  
  //boolean containsPoint(PVector point){
    //point.add(new PVector(GRID_WIDTH/2, GRID_WIDTH/2));  // correct for center rect mode
   // return (point.x >= this.location.x && point.x <= (this.location.x + this.size.x)) 
   //          && (point.y >= this.location.y && point.y <= (this.location.y + this.size.y));
 // }
  
  
  void update() {
    this.velocity.add(this.acceleration);
    this.location.add(this.velocity);
    this.acceleration.mult(0);
  }

}
