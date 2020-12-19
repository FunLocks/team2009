float scrY=0,scrC=0,scrF=0;
int WinF=0;

class WindowManager{
  private ArrayList<Window> windows;
  
  WindowManager(){
    windows = new ArrayList<Window>();
    for(int i=0; i<30; i++){
      String n=(""+i);
      windows.add(new Window("第"+n+"回日本バードウォッチング大会","とっても楽しいよww","Zoom","12/24","https://japan.bardwtching.com/rstLst/tournament/",windows.size(),"ジャパンマトリクス協会"));
    }
  }
  
  public void ScrHit(){
    if(width/32*32.15-8<mouseX && mouseX<width/32*32.15+8 && height/32*3.5+10+scrY <mouseY && mouseY<height/32*3.5+10+scrY+(height/7*6)/windows.size()*10){
      scrC=10;
    }else{
      scrC=0;
    }
  }
  
  public void Clicking(){
     for(int i=0;i<windows.size();i++){
       if(windows.get(i).hit())WinF=i+1;
     }
  }
  
  public void Clicked(){
     //for(int i=0;i<windows.size();i++){
       if(WinF>0 && !windows.get(WinF-1).hit())WinF=0;
     //}
  }
  

  
  public void ScrollBar(){
    noStroke();
    triangle(width/32*32.15-5,height/32*3.5+5,width/32*32.15+5,height/32*3.5+5,width/32*32.15,height/32*3.5);
    triangle(width/32*32.15-5,height/32*33-5,width/32*32.15+5,height/32*33-5,width/32*32.15,height/32*33);
    if(scrF==0)fill(0,0,80-scrC);
    if(scrF>0){                
      scrY=mouseY-scrF;
      if(scrY<0)scrY=0;
      if(scrY+(height/7*6)/windows.size()*10>(height/7*6))scrY=(height/7*6)-(height/7*6)/windows.size()*10;
      fill(0,0,50);
    }
    if(windows.size()>10)rect(width/32*32.15-8,height/32*3.5+10+scrY,16,(height/7*6)/windows.size()*10);
  }
  
  public void DrawWindow(){
    stroke(0,0,70);
    fill(0,0,95);
    if(WinF>0){
      windows.get(WinF-1).Text();
    }
    rect(width/8*6,-1,width+1,height+1);
    textSize(16);
    for(int i=0;i<windows.size();i++){
      windows.get(i).Draw();
    }
    ScrHit();
    ScrollBar();
  }
}
