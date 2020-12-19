PImage icon;

class Tab{
  private String ttype;
  private float ty;
  
  public Tab(String ttype,float ty){
    this.ttype=ttype;
    this.ty=ty;
  }
  
  public boolean hit(){
    if(mouseX<width/16+1 && height/5*ty-1<mouseY && mouseY<height/5*(ty+1)){
      return true;
    }
      return false;
  }
  
  public void Draw(){
    stroke(0,0,70);
    if(hit() && ty==TNum-1){
      fill(0,0,75);
    }else if(hit()){
      fill(0,0,85);
    }else{
      fill(0,0,95);
    }
    rect(0,height/5*ty-1,width/16,(height/5*ty-1)-(height/5*(ty-1)-1));
    noStroke();
    image(loadImage(ttype),width/16-50,height/5*ty);
  }
}
