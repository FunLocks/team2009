class ChoseBox{
  private float cx;
  private float cy;
  private float cr;
  private String ct;
  
  public ChoseBox(float cx, float cy, float cr, String ct){
    this.cx=cx;
    this.cy=cy;
    this.cr=cr;
    this.ct=ct;
  }
  
  public void Draw(){
    stroke(0,0,30);
    fill(0,0,30);
    text(ct,cx+16,cy+8);
    fill(0,0,100);
    circle(cx, cy ,cr);
  }
}
