color[] colors = {
  color(64, 64, 64), color(128, 128, 32), color(128, 32, 128), color(32, 128, 128)
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