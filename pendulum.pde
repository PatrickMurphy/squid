class pendulum extends mover {
// Attaches to another object and acts as a bouncy pendulum.
  mover parent;
  float restLength;
  pendulum(PVector loc, mover parent) {
    super(loc);
    this.parent = parent;
    
    this.restLength = PVector.dist(this.location, this.parent.location);
  }
  void update() {
    // Push down with gravity.
    PVector gravity = new PVector(GRAVITY,0);
    gravity.div(this.mass);
    this.acceleration.add(gravity);
    
    // Add air-drag.
    this.velocity.mult(1-AIRDRAG);
    this.velocity.limit(5);
    
    // Move it.
    this.velocity.add(this.acceleration);
    this.location.add(this.velocity);
    this.acceleration.mult(0);
    
    // Adjust its spring.
    float currentLength = PVector.dist(this.location, this.parent.location);
    
    PVector spring = new PVector(this.location.x, this.location.y);
    spring.sub(this.parent.location);
    spring.normalize();
    
    float stretchLength = currentLength-this.restLength;
    spring.mult(-ELASTICITY*stretchLength);
    spring.div(this.mass);
    this.acceleration.add(spring);
  }
  
  void display(){
    if (this.parent != null) {
      strokeWeight(1);
      stroke(0);
      line(this.parent.location.x, this.parent.location.y, this.location.x, this.location.y);
    }
    
    strokeWeight(5);
    stroke(0, 255, 0);
    point(this.location.x, this.location.y);
  }
}
