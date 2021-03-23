class World{
  
  HashMap<PVector, Chunk> chunks;
  HashMap<PVector, Chunk> lastSeen;
  float chunkSize;
  PVector lastCenterChunk;
  Player view;
  
  public World(Player view){
    chunks = new HashMap<PVector, Chunk>();
    lastSeen = new HashMap<PVector, Chunk>();
    lastCenterChunk = new PVector(-1000, 1000);
    chunkSize = scale;
    this.view = view;
  }
  
  Chunk newChunk(PVector pos){
    return new Chunk(pos);
  }
  
  void checkChunks(PVector pos){
    PVector chunkPos = pos.div(chunkSize);
    chunkPos.x = floor(chunkPos.x);
    chunkPos.y = floor(chunkPos.y);
    /*if(chunkPos.x == lastCenterChunk.x && chunkPos.y == lastCenterChunk.y){
      return;
    }
    lastCenterChunk = chunkPos.copy();*/
    chunks.clear();
    for(int i = -1; i < 2; i++){
      for(int j = -1; j < 2; j++){
        PVector currentPos = new PVector(chunkPos.x + j, chunkPos.y + i);
        if(lastSeen.containsKey(currentPos)){
          chunks.put(currentPos, lastSeen.get(currentPos));
        }else{
          chunks.put(currentPos, newChunk(currentPos));
        }
      }
    }
    lastSeen.clear();
    lastSeen = copyHashMap(chunks);
  }
  
  void update(){
    checkChunks(view.getPos());
    render();
  }
  
  void render(){
    for(Chunk chunk : chunks.values()){
      chunk.render();
    }
  }
  
  class Chunk{
    PVector pos;
    ArrayList<Resource> resources;
  
    public Chunk(PVector pos){
      this.pos = pos;
      resources = new ArrayList<Resource>();
      generateChunk();
    }
    
    void generateChunk(){
      randomSeed((long)(pos.y*width+pos.x));
      for(int i = 0; i < chunkSize; i++){
        for(int j = 0; j < chunkSize; j++){
          PVector position = new PVector(pos.x * chunkSize + j, pos.y * chunkSize + i);
          if(random(0, 1) < 0.01){
            resources.add(new Mineral(position));
          }else if(random(0, 1) < 0.02){
            resources.add(new Plant(position));
          }
        }
      }
    }
  
    void render(){
      if(debugMode){
        rectMode(CORNER);
        fill(255, 64);
        float size = chunkSize*scale;
        rect(pos.x*size, pos.y*size, size, size);
        fill(0);
        text("(" + pos.x + ", " + pos.y + ")", pos.x*size+20, pos.y*size+20);
        rectMode(CENTER);
      }
      for(Resource res : resources){
        res.render();
      }
    }
  
    PVector getPos(){
      return pos.copy();
    }
  }
}