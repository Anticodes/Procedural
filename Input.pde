class Input{
  
  Joypad joypad;
  
  void setJoypad(PVector pos, float scale){
    joypad = new Joypad(pos, scale);
  }
  
  PVector getJoypadDir(){
    return joypad.getDir();
  }
  
  void update(){
    joypad.render();
  }
  
  void mPress(){
    joypad.mPress();
  }
  
  void mDrag(){
    joypad.mDrag();
  }
  
  void mRel(){
    joypad.mRel();
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
      if (dist(pos.x*scale, pos.y*scale, mouseX, mouseY) < radius) {
        joying = true;
        joypos.x = mouseX - pos.x*scale;
        joypos.y = mouseY - pos.y*scale;
        joypos.limit(radius);
      }
    }
    
    void mDrag(){
      if(!isActive)return;
      if (joying) {
        joypos.x = mouseX - pos.x*scale;
        joypos.y = mouseY - pos.y*scale;
        joypos.limit(radius);
      }
    }
    
    void mRel(){
      if(!isActive)return;
      joying = false;
      joypos.x = 0;
      joypos.y = 0;
    }
    
    PVector getDir(){
      return joypos.copy();
    }
  }
}

void mousePressed(){
  input.mPress();
}
  
void mouseDragged(){
  input.mDrag();
}
  
void mouseReleased(){
  input.mRel();
}
  
void keyPressed(){
    
}
  
void keyReleased(){
    
}