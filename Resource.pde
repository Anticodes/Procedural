class Mineral extends Resource{
  
  Mineral(PVector pos){
    this.pos = pos;
    colour = mineralColors[rndInt(0, mineralColors.length)];
  }
  
  void render(){
    fill(colour);
    ellipse(pos.x*scale, pos.y*scale, scale, scale/2);
  }
}

class Plant extends Resource{
  
  Plant(PVector pos){
    this.pos = pos;
    colour = plantColors[rndInt(0, plantColors.length)];
  }
  
  void render(){
    fill(colour);
    rect(pos.x*scale, pos.y*scale, scale/2, scale);
  }
}

class Resource{
  
  PVector pos;
  color colour;
  void render(){}
  
  PVector getPos(){
    return pos.copy();
  }
  
  void shine(){
    colour = color(255, 255, 64);
  }
}