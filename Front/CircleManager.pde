final float R=200;
int CNum=0;
int H=239,S=0,B=100;
int H2=239,S2=0,B2=100;
int CExFlag=0,CEx=0;
//int page=0;
//String EG[]={"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
String EG[]={"音楽","ゲーム","スポーツ","食","配信","映画","プログラミング","企業","ドラマ","アニメ","漫画","YouTube"};

class CircleManager {
  private ArrayList<Circle> circles;

  CircleManager() {
    circles = new ArrayList<Circle>();
    circles.add(new Circle(width/16*6.5, height/2, 200, 100, EG[0]));
  }

  public void SetCircle() {
    for (float i = width/16*6.5; i<width; i+=0.1) {
      float rnd = random(360);
      float x=(i-width/16*6.5)*cos(rnd)+width/16*6.5;
      float y=(i-width/16*6.5)*sin(rnd)+height/2;
      int flag=0;
      if(width/16<x && x<width/16*12 && 0<y && y<height){
        for (int k = 0; k<circles.size(); k++) {
          if ( sqrt(sq(circles.get(k).cx-x)+sq(circles.get(k).cy-y))<(circles.get(k).cr)/2+(R-(i-width/16*6.5)/5)/2*1.2) {
            flag=1;
            break;
          }
        }
        if (flag==0 && EG.length>circles.size())circles.add(new Circle(x, y, R-(i-width/16*6.5)/5, 100-(i-width/16*6.5)/5, EG[circles.size()]));
      }
    }
  }

  public void Clicking(){
    for (int i = 0; i<circles.size(); i++) {
      if(circles.get(i).hit()){
        if(i==CNum-1 && CExFlag==1)CExFlag=2;
        CNum=i+1;
        //println(CExFlag);
      }
    }
  }
  
  public void Clicked(){
    if(CNum>0){
      if(circles.get(CNum-1).hit()){
        if(CExFlag==2){
          CExFlag=3;
        }else{
          CExFlag=1;
        }
      }else{
        CNum=0;
        CExFlag=0;
      }  
    }
  }

  public void DrawCircle() {
    //for (int i = 0; i<circles.size(); i++) {
      noStroke();
      textAlign(CENTER);
      CEx=0;
    for (int i =circles.size()-1; i>=0; i--) {
      if(CNum!=i+1){
        B=0;
      }else{
        B=50;
        //PageColor=-50;
      }
      circles.get(i).Draw();
    }
    if(CExFlag>2 && CExFlag<width*2){
      CExFlag+=100;
      CEx=CExFlag;
      if(CNum>0){B=50;circles.get(CNum-1).Draw();}
    }else if(CExFlag>2 && CExFlag>=width*2){
      //page++;
      //if(CNum>0)PageColor=circles.get(CNum-1).cc-50;
      CExFlag=0;
      CEx=CExFlag;
      CNum=0;
      circles.clear();
      cm.SetCircle();
      background(0,0,50);
    }
    textAlign(LEFT);
  }
}
