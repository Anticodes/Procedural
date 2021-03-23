float resolution = 20;
boolean debugMode = false;
float scale, resx, resy;
Input input;
Player player;
World world;

void setup(){
  size(displayWidth, displayHeight);
  orientation(LANDSCAPE);
  rectMode(CENTER);
  frameRate(60);
  if(height > width){
    scale = width/resolution;
    resx = resolution;
    resy = height/scale;
  }else {
    scale = height/resolution;
    resy = resolution;
    resx = width/scale;
  }
  input = new Input();
  player = new Player();
  world = new World(player);
  input.setJoypad(new PVector(4, resy - 4), scale*3);
}

void draw(){
  background(192, 64, 192);
  translate(width/2, height/2);
  translate(-player.pos.x*scale, -player.pos.y*scale);
  world.update();
  translate(player.pos.x*scale, player.pos.y*scale);
  player.update();
  translate(-width/2, -height/2);
  input.update();
  text(frameRate, 150, 150);
}