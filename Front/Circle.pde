float moveX=0,moveY=0;

class Circle {
  private float cx;
  private float cy;
  private float cr;
  private float cc;
  private String ct;
  
  public Circle(float cx, float cy, float cr, float cc, String ct) {
    this.cx=cx;
    this.cy=cy;
    this.cr=cr;
    this.cc=cc;
    this.ct=ct;
  }
  
  public boolean hit(){
    if( sqrt(sq(mouseX-(cx+moveX))+sq(mouseY-(cy+moveY)))<cr/2 ){
      return true;
    }
      return false;
  }
  
  public void Draw(){
    fill(H,100,cc-B);
    if(hit()){
      circle(cx+moveX,cy+moveY,cr*1.2+CEx);
    }else{
      circle(cx+moveX,cy+moveY,cr+CEx);
    }
    fill(H,0,100);
    if((cr-CEx/10)/4>0){
      textSize((cr-CEx/10)/(ct.length()*2)*1.5);
      text(ct,cx+moveX,cy+moveY+((cr-CEx/10)/(ct.length()*2)*1.5)/4);
    }
  }
}
