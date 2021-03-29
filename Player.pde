class Player{
  PVector pos;
  float speed;
  float reach;
  
  Player(){
    pos = new PVector(0, 0);
    speed = 0.0001;
    reach = 5;
  }
  
  void update(){
    move();
    gather();
    render();
  }
  
  void gather(){
    if(!input.isPressed(GATHER))return;
    ArrayList<Resource> resources = world.getChunkFromPos(getPos()).getResources();
    for(Resource res : resources){
      if(PVector.dist(getPos(), res.getPos()) < reach){
        res.shine();
      }
    }
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