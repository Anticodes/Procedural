class Player{
  PVector pos;
  float speed;
  
  Player(){
    pos = new PVector(0, 0);
    speed = 0.0001;
  }
  
  void update(){
    move();
    render();
  }
  
  void move(){
    pos.add(input.getJoypadDir().mult(frameTime*speed));
  }
  
  void render(){
    fill(253, 217, 181);
    ellipse(0, 0, scale, scale);
    if(debugMode)text("(" + player.getPos().x + ", " + player.getPos().y + ")", 100-width/2, 100-height/2);
  }
  
  PVector getPos(){
    return pos.copy();
  }
}