//Button id constants
static final int GATHER = 0;

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