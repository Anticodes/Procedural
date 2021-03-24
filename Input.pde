class Input{
  
  Joypad joypad;
  ArrayList<Button> buttons = new ArrayList<Button>();
  
  void setJoypad(PVector pos, float scale){
    joypad = new Joypad(pos, scale);
  }
  
  void addButton(PVector pos, float scale, String text){
    buttons.add(new Button(pos, scale, text));
  }
  
  void addButton(PVector pos, float scale){
    buttons.add(new Button(pos, scale));
  }
  
  PVector getJoypadDir(){
    return joypad.getDir();
  }
  
  void update(){
    joypad.render();
    for(Button button : buttons)
      button.render();
  }
  
  void mPress(){
    joypad.mPress();
    for(Button button : buttons)
      button.mPress();
  }
  
  void mDrag(){
    joypad.mDrag();
  }
  
  void mRel(){
    joypad.mRel();
    for(Button button : buttons)
      button.mRel();
  }
  
  void kPress(){
    
  }
  
  void kRel(){
    
  }
  
  private class Joypad{
    
    float radius;
    PVector pos;
    PVector joypos;
    boolean joying = false;
    boolean isActive = true;
    int touchIndex = 0;
    
    public Joypad(PVector pos, float radius){
      this.pos = pos;
      this.radius = radius;
      joypos = new PVector(0, 0);
    }
    
    void render(){
      if(!isActive)return;
      fill(255, 128);
      ellipse(pos.x*scale, pos.y*scale, radius*2, radius*2);
      ellipse(pos.x*scale+joypos.x, pos.y*scale+joypos.y, radius, radius);
    }
    
    void mPress(){
      if(!isActive)return;
      for(int i = 0; i < touches.length; i++)
        if(dist(pos.x*scale, pos.y*scale, touches[i].x, touches[i].y) < radius){
          joying = true;
          joypos.x = mouseX - pos.x*scale;
          joypos.y = mouseY - pos.y*scale;
          joypos.limit(radius);
          touchIndex = i;
          break;
        }
    }
    
    void mDrag(){
      if(!isActive)return;
      if (joying) {
        joypos.x = touches[touchIndex].x - pos.x*scale;
        joypos.y = touches[touchIndex].y - pos.y*scale;
        joypos.limit(radius);
      }
    }
    
    void mRel(){
      if(!isActive)return;
      if(joying && dist(pos.x*scale, pos.y*scale, mouseX, mouseY) < radius){
        joying = false;
        joypos.x = 0;
        joypos.y = 0;
      }
    }
    
    PVector getDir(){
      return joypos.copy();
    }
  }
  
  class Button{
    float radius;
    PVector pos;
    boolean isActive = true;
    boolean pressing = false;
    String text;
    
    Button(PVector pos, float radius, String text){
      this.pos = pos;
      this.radius = radius;
      this.text = text;
    }
    
    Button(PVector pos, float radius){
      this.pos = pos;
      this.radius = radius;
      this.text = "";
    }
    
    void render(){
      if(!isActive)return;
      fill(255, 128);
      ellipse(pos.x*scale, pos.y*scale, radius*(pressing?1.2:1), radius*(pressing?1.2:1));
      text(text, pos.x*scale, pos.y*scale);
    }
    
    boolean isPressing(){
      return pressing;
    }
    
    void mPress(){
      if(!isActive)return;
      for(int i = 0; i < touches.length; i++)
        if(dist(pos.x*scale, pos.y*scale, touches[i].x, touches[i].y) < radius)
          pressing = true;
    }
    
    void mRel(){
      if(!isActive)return;
      for(int i = 0; i < touches.length; i++)
        if(dist(pos.x*scale, pos.y*scale, touches[i].x, touches[i].y) < radius)
          pressing = false;
    }
  }
}

void touchStarted(){
  input.mPress();
}
  
void touchMoved(){
  input.mDrag();
}
  
void touchEnded(){
  input.mRel();
}
  
void keyPressed(){
    
}
  
void keyReleased(){
    
}