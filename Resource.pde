class Mineral extends Resource{
  
  Mineral(PVector pos){
    this.pos = pos;
    data = mineralData.getJSONObject(rndInt(0, mineralData.size()));
    colour = color(data.getInt("red"), data.getInt("green"), data.getInt("blue"));
  }
  
  void render(){
    fill(colour);
    ellipse(pos.x*scale, pos.y*scale, scale, scale/2);
    text(shiny ? "ok" : "", pos.x*scale, pos.y*scale);
  }
}

class Plant extends Resource{
  
  Plant(PVector pos){
    this.pos = pos;
    data = plantData.getJSONObject(rndInt(0, plantData.size()));
    colour = color(data.getInt("red"), data.getInt("green"), data.getInt("blue"));
  }
  
  void render(){
    fill(colour);
    rect(pos.x*scale, pos.y*scale, scale/2, scale);
    text(shiny ? "ok" : "", pos.x*scale, pos.y*scale);
  }
}

abstract class Resource{
  
  PVector pos;
  JSONObject data;
  color colour;
  boolean shiny = false;
  void render(){}
  
  PVector getPos(){
    return pos.copy();
  }
  
  void shine(){
    shiny = true;
  }
}

static final String resData = "{"+
  "  \"minerals\": [            "+
  "  {                          "+
  "    \"name\": \"Rock\",      "+
  "    \"red\": 63,             "+
  "    \"green\": 63,           "+
  "    \"blue\": 63             "+
  "  },                         "+
  "  {                          "+
  "    \"name\": \"Copper\",    "+
  "    \"red\": 184,            "+
  "    \"green\": 115,          "+
  "    \"blue\": 51             "+
  "  },                         "+
  "  {                          "+
  "    \"name\": \"Tin\",       "+
  "    \"red\": 211,            "+
  "    \"green\": 212,          "+
  "    \"blue\": 213            "+
  "  },                         "+
  "  {                          "+
  "    \"name\": \"Iron\",      "+
  "    \"red\": 161,            "+
  "    \"green\": 157,          "+
  "    \"blue\": 148            "+
  "  },                         "+
  "  {                          "+
  "    \"name\": \"Gold\",      "+
  "    \"red\": 191,            "+
  "    \"green\": 191,          "+
  "    \"blue\": 31             "+
  "  }                          "+
  "],                           "+
  "\"plants\": [                "+
  "  {                          "+
  "    \"name\": \"Wood\",      "+
  "    \"red\": 127,            "+
  "    \"green\": 63,           "+
  "    \"blue\": 15             "+
  "  },                         "+
  "  {                          "+
  "    \"name\": \"Rose\",      "+
  "    \"red\": 255,            "+
  "    \"green\": 0,            "+
  "    \"blue\": 127            "+
  "  }                          "+
  "]                            "+
"}";

JSONObject resourceData = parseJSONObject(resData);
JSONArray mineralData = resourceData.getJSONArray("minerals");
JSONArray plantData = resourceData.getJSONArray("plants");