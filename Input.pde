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
    joypad.update();
    for(Button button : buttons)
      button.update();
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
  
  boolean isPressed(int button){
    return buttons.get(button).isPressing();
  }
  
  private class Joypad{
    
    float radius;
    PVector pos;
    PVector joypos;
    boolean joying = false;
    boolean isActive = true;
    int touchId;
    
    public Joypad(PVector pos, float radius){
      this.pos = pos;
      this.radius = radius;
      joypos = new PVector(0, 0);
    }
    
    void update(){
      if(!isActive)return;
      if(indexOfId(touchId) == -1){
        relM();
      }
      render();
    }
    
    void render(){
      fill(255, 128);
      ellipse(pos.x*scale, pos.y*scale, getRadius(), getRadius());
      ellipse(pos.x*scale+joypos.x, pos.y*scale+joypos.y, radius, radius);
      text(touches.length, 140, 140);
    }
    
    void mPress(){
      if(!isActive || joying)return;
      for(int i = 0; i < touches.length; i++)
        if(dist(pos.x*scale, pos.y*scale, touches[i].x, touches[i].y) < radius){
          joying = true;
          moveJoy(i);
          touchId = touches[i].id;
          break;
        }
    }
    
    void mDrag(){
      if(!isActive)return;
      if (joying){
        int index = indexOfId(touchId);
        if(index == -1){
          relM();
          return;
        }
        moveJoy(index);
      }
    }
    
    void mRel(){
      if(!isActive)return;
      if(joying){
        if(indexOfId(touchId) == -1){
          relM();
        }
      }
    }
    
    void moveJoy(int index){
      joypos.set(touches[index].x - pos.x*scale, touches[index].y - pos.y*scale);
      joypos.limit(radius);
    }
    
    void relM(){
      joying = false;
      joypos.x = 0;
      joypos.y = 0;
    }
    
    PVector getDir(){
      return joypos.copy();
    }

    PVector getPos(){
      return pos.copy();
    }

    float getRadius(){
      return radius * 2;
    }
  }
  
  class Button{
    float radius;
    PVector pos;
    boolean isActive = true;
    boolean pressing = false;
    int touchId;
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
    
    void update(){
      if(!isActive)return;
      if(indexOfId(touchId) == -1){
        relM();
      }
      render();
    }
    
    void render(){
      fill(255, 128);
      ellipse(pos.x*scale, pos.y*scale, radius*(pressing?1.2:1), radius*(pressing?1.2:1));
      text(text, pos.x*scale, pos.y*scale);
    }
    
    boolean isPressing(){
      return pressing;
    }
    
    void mPress(){
      if(!isActive || pressing)return;
      for(int i = 0; i < touches.length; i++){
        if(dist(pos.x*scale, pos.y*scale, touches[i].x, touches[i].y) < radius){
          pressing = true;
          touchId = touches[i].id;
          return;
        }
      }
    }
    
    void mRel(){
      if(!isActive)return;
      if(indexOfId(touchId) == -1){
        relM();
        return;
      }
    }
    
    void relM(){
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