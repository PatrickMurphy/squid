// Uses a series of dynamic objects but displays them as a single line.
class tentacle {
  ArrayList<mover> objs;
  
  tentacle(PVector loc, int count) {
    
    this.objs = new ArrayList<mover>();
    
    this.objs.add(new spring(loc, 1.0));
  
    for (int i = 0; i < count; i++) {
      this.objs.add(new pendulum(new PVector(loc.x, loc.y+i*15), this.objs.get(this.objs.size()-1)));
    }
  }
  
  
  void update(){
  }
  
  void display() {
    noFill();
    stroke(0);
    strokeWeight(1);
    
    beginShape();
    curveVertex(this.objs.get(0).location.x, this.objs.get(0).location.y);
    
    for (int i = 0; i < this.objs.size(); i++) {
      this.objs.get(i).update();
      curveVertex(this.objs.get(i).location.x, this.objs.get(i).location.y);
    }
    
    curveVertex(this.getLastObj().location.x, this.getLastObj().location.y);
    endShape();
  }
  
  mover getLastObj(){
    return this.objs.get(this.objs.size()-1);
  }
  
  mover getNObj(int n){
    if(this.objs.size() >= n){
      return this.objs.get(n-1);
    }else{
      return null;
    }
  }
}
