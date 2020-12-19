CircleManager cm;
TabManager tm;
ETBManager em;
WindowManager wm;


void settings(){
  size(displayWidth, displayHeight-66);
}

void setup() {
  noStroke();
  colorMode(HSB,360,100,100);
  //PFont font=createFont("Meiryo",50);
  textFont(createFont("Gothic",100));
  //textAlign(CENTER);
  surface.setLocation(-3,0);
  cm=new CircleManager();
  cm.SetCircle();
  tm=new TabManager();
  em=new ETBManager();
  wm=new WindowManager();
}


void draw(){
  background(0,0,100);
  moveX+=((width/16*6.5-mouseX)/16-moveX)/10;
  moveY+=((height/2-mouseY)/16-moveY)/10;
  cm.DrawCircle();
  tm.TabDraw();
  wm.DrawWindow();
  em.DrawETBs();
  //line(width/16*6.5,0,width/16*6.5,height);
}


void mousePressed(){
  
  if(CExFlag<3){
    if(Tpage==2){
      cm.Clicking();
      wm.Clicking();
      if(scrC==10)scrF=mouseY-scrY;
    }
    tm.Clicking();
  }
}

void mouseReleased(){
  //wm.Clicked();
  if(CExFlag<3){
    if(Tpage==2){
      cm.Clicked();
      scrF=0;
    }
    tm.Clicked();
  }
}
