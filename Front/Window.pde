class Window{
  private String Ename;
  private String Edata;
  private String Eplace;
  private String Eday;
  private String EURL;
  private int Enum;
  private String Ehum;
  
  public Window(String Ename,String Edata,String Eplace,String Eday,String EURL,int Enum ,String Ehum){
    this.Ename=Ename;
    this.Edata=Edata;
    this.Eplace=Eplace;
    this.Eday=Eday;
    this.EURL=EURL;
    this.Enum=Enum;
    this.Ehum=Ehum;
  }
  
   public boolean hit(){
    //if(width/8*6.05<mouseX && mouseX<(height/12*(Enum+1))-16+height/16-scrY/( (height/7*6)/wm.windows.size()*10 )*580 &&width/8*1.8<mouseY && mouseY<height/16){
    if(width/8*6.05<mouseX && (height/12*(Enum+1))-16+height/16-scrY/( (height/7*6)/wm.windows.size()*10 )*580<mouseY &&mouseX < width/8*1.8+width/8*6.05 && mouseY<height/16+(height/12*(Enum+1))-16+height/16-scrY/( (height/7*6)/wm.windows.size()*10 )*580){
      return true;
    }
      return false;
    }
  
  public void Text(){
    rect(width/16,-1,width,height+1);
    rect(width/8,60,width/2,height/10);
    rect(width/8,60+height/10+30,width/2,height/10);
    rect(width/8,60+height/10+30+height/10+30,width/2,height/3);
    rect(width/8,60+height/10+30+height/10+30+height/3+30,width/2,height/5);
    fill(0);
    textSize(32);
    text(Ename,width/8,32);
    textSize(24);
    fill(0,0,20);
    text("＜主催者＞",width/8,84);
    text(Ehum,width/8,112);
    text("＜開催日・場所＞",width/8,60+height/10+30+24);
    text(Eday+"  "+Eplace,width/8,60+height/10+30+52);
    text("＜イベント詳細＞",width/8,60+height/10+30+height/10+30+24);
    text(Edata,width/8,60+height/10+30+height/10+30+52);
    text("＜URL＞",width/8,60+height/10+30+height/10+30+height/3+30+24);
    text(EURL,width/8,60+height/10+30+height/10+30+height/3+30+52);
    fill(0,0,95);
  }
  
  public void Draw(){
    if(Enum==WinF-1){
      fill(0,0,75);
      //if(mousePressed)fill(0,0,75);
    }else if(hit()){
      fill(0,0,85);
    }else{
      fill(0,0,95);
    }
    rect(width/8*6.05,(height/12*(Enum+1))-16+height/16-scrY/( (height/7*6)/wm.windows.size()*10 )*580,width/8*1.8,height/16);
    fill(0);
    text(Ename,width/8*6.07,height/12*(Enum+1)+height/16-scrY/( (height/7*6)/wm.windows.size()*10 )*580);
    fill(100);
    text(Edata,width/8*6.07,(height/12*(Enum+1))+16+height/16-scrY/( (height/7*6)/wm.windows.size()*10 )*580);
  }
}
