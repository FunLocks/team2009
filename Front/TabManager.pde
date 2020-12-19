int TNum=0;
int Tpage=2;

class TabManager{
  private ArrayList<Tab> tabs;
  
  TabManager() {
    tabs = new ArrayList<Tab>();
    //tabs.add(new Tab("loupe.png",0));
    tabs.add(new Tab("megaphone.png",0));
    //tabs.add(new Tab("star.png",0));
    tabs.add(new Tab("user.png",0));
    //tabs.add(new Tab("config.png",0));
    tabs.add(new Tab("arrow.png",0));
    //PImage ;
  }
  
  public void Clicking(){
    for (int i = 0; i<tabs.size(); i++) {
      if(mouseX<width/16+1)CNum=0;
      if(tabs.get(i).hit()){
        TNum=i+1;
        Tpage=i;
        WinF=0;
        em.ClearETBs();
        em=new ETBManager();
      }
    }
  }
  
  public void Clicked(){
    TNum=0;
  }
  
  public void TabDraw(){
    stroke(0,0,70);
    fill(0,0,95);
    rect(-1,-1,width/16+1,height+1);
    noStroke();
    for (int i = 0; i<tabs.size(); i++) {
      tabs.get(i).ty=i;
      tabs.get(i).Draw();
    }
  }
}
