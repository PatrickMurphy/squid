class spring extends mover {
  PVector target;
  float maxForce;
  spring(PVector loc, float mf){
    super(loc);
    this.target = loc.copy();
    this.maxForce = mf;
  }
  
  void update(){
    float distThreshold = 20;
    
    // Move towards the target.
    PVector push = new PVector(this.target.x, this.target.y);
    float distance = dist(this.location.x, this.location.y, this.target.x, this.target.y);
    float force = map(min(distance, distThreshold), 0, distThreshold, 0, this.maxForce);
    push.sub(this.location);
    push.normalize();
    push.mult(force);
    this.acceleration.add(push);
    
    // Add air-drag.
    this.velocity.mult(1-AIRDRAG);
    
    // Move it.
    this.velocity.add(this.acceleration);
    this.location.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  void display(){
    strokeWeight(1);
    stroke(0);
    line(this.target.x, this.target.y, this.location.x, this.location.y);
    
    strokeWeight(5);
    stroke(0, 255, 0);
    point(this.location.x, this.location.y);
  }
}
  
