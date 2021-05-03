class Mineral extends Resource{
  
  Mineral(PVector pos){
    this.pos = pos;
    data = mineralData.getJSONObject(rndInt(0, mineralData.size()));
    JSONObject col = data.getJSONObject("color");
    colour = color(col.getInt("red"), col.getInt("green"), col.getInt("blue"));
  }
  
  void render(){
    if(gathered)return;
    fill(colour);
    ellipse(pos.x*scale, pos.y*scale, scale, scale/2);
  }
}

class Plant extends Resource{
  
  Plant(PVector pos){
    this.pos = pos;
    data = plantData.getJSONObject(rndInt(0, plantData.size()));
    JSONObject col = data.getJSONObject("color");
    colour = color(col.getInt("red"), col.getInt("green"), col.getInt("blue"));
  }
  
  void render(){
    if(gathered)return;
    fill(colour);
    rect(pos.x*scale, pos.y*scale, scale/2, scale);
  }
}

abstract class Resource{
  
  PVector pos;
  JSONObject data;
  color colour;
  boolean gathered = false;
  void render(){}
  
  PVector getPos(){
    return pos.copy();
  }
  
  void gather(){
    gathered = true;
  }
}

void initResourceData(){
  resourceData = loadJSONObject("resources.json");
  mineralData = resourceData.getJSONArray("minerals");
  plantData = resourceData.getJSONArray("plants");
}

JSONObject resourceData;
JSONArray mineralData;
JSONArray plantData;