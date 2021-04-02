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

static final String resData = "{"+
  "  \"minerals\": [            "+
  "  {                          "+
  "    \"name\": \"Rock\",      "+
  "    \"color\": {             "+
  "      \"red\": 63,           "+
  "      \"green\": 63,         "+
  "      \"blue\": 63           "+
  "    }                        "+
  "  },                         "+
  "  {                          "+
  "    \"name\": \"Copper\",    "+
  "    \"color\": {             "+
  "      \"red\": 184,          "+
  "      \"green\": 115,        "+
  "      \"blue\": 51           "+
  "    }                        "+
  "  },                         "+
  "  {                          "+
  "    \"name\": \"Tin\",       "+
  "    \"color\": {             "+
  "      \"red\": 211,          "+
  "      \"green\": 212,        "+
  "      \"blue\": 213          "+
  "    }                        "+
  "  },                         "+
  "  {                          "+
  "    \"name\": \"Iron\",      "+
  "    \"color\": {             "+
  "      \"red\": 161,          "+
  "      \"green\": 157,        "+
  "      \"blue\": 148          "+
  "    }                        "+
  "  },                         "+
  "  {                          "+
  "    \"name\": \"Gold\",      "+
  "    \"color\": {             "+
  "      \"red\": 191,          "+
  "      \"green\": 191,        "+
  "      \"blue\": 31           "+
  "    }                        "+
  "  }                          "+
  "],                           "+
  "\"plants\": [                "+
  "  {                          "+
  "    \"name\": \"Wood\",      "+
  "      \"color\": {           "+
  "      \"red\": 127,          "+
  "      \"green\": 63,         "+
  "      \"blue\": 15           "+
  "    }                        "+
  "  },                         "+
  "  {                          "+
  "    \"name\": \"Rose\",      "+
  "      \"color\": {           "+
  "      \"red\": 255,          "+
  "      \"green\": 0,          "+
  "      \"blue\": 127          "+
  "    }                        "+
  "  }                          "+
  "]                            "+
"}";

JSONObject resourceData = parseJSONObject(resData);
JSONArray mineralData = resourceData.getJSONArray("minerals");
JSONArray plantData = resourceData.getJSONArray("plants");