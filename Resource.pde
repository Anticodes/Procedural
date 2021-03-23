class Mineral extends Resource{
  
  Mineral(PVector pos){
    this.pos = pos;
    colour = colors[rndInt(0, 4)];
  }
  
  void render(){
    fill(colour);
    ellipse(pos.x*scale, pos.y*scale, scale, scale/2);
  }
}

class Plant extends Resource{
  
  Plant(PVector pos){
    this.pos = pos;
    colour = colors[rndInt(0, 4)];
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
}