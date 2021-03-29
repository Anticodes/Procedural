//Resource constants

//Minerals
final color DARKGRAY = color(63, 63, 63);
final color GOLD = color(191, 191, 31);
final color IRON = color(161, 157, 148);
final color COPPER = color(184, 115, 51);
final color TIN = color(211, 212, 213);
final color BRONZE = color(239, 155, 15);

//Plants
final color WOOD = color(127, 63, 15);
final color ROSE = color(255, 0, 127);

//Button id constants
static final int GATHER = 0;

color[] mineralColors = {
  DARKGRAY,
  GOLD,
  IRON,
  COPPER,
  TIN
};

color[] plantColors = {
  WOOD,
  ROSE
};

int rndInt(int min, int max){
  return floor(random(min, max));
}

HashMap<PVector, World.Chunk> copyHashMap(HashMap<PVector, World.Chunk> one){
  HashMap<PVector, World.Chunk> two = new HashMap<PVector, World.Chunk>();
  for(PVector i : one.keySet()){
    two.put(i, one.get(i));
  }
  return two;
}

int indexOfId(float id){
  for(int i = 0; i < touches.length; i++){
    if(touches[i].id == id)return i;
  }
  return -1;
}