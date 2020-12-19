class ETBManager{
  
  private ArrayList<EvTextBox> ETBs;
  ETBManager(){
    ETBs = new ArrayList<EvTextBox>();

    if(Tpage==0){
      ETBs.add(new EvTextBox(width/16*2,height/10,width/2,height/12,"イベント名",0));
      ETBs.add(new EvTextBox(width/16*2,height/10*2.5,width/2,height/5,"イベント詳細",1));
      ETBs.add(new EvTextBox(width/16*2,height/10*5.25,width/2,height/12,"開催日時",1));
      ETBs.add(new EvTextBox(width/16*2,height/10*6.75,width/2,height/12,"開催場所",1));
      ETBs.add(new EvTextBox(width/16*2,height/10*8,width/2,height/8,"URL",1));
    }
    if(Tpage==2){
      ETBs.add(new EvTextBox(width/8*6,0,width/8*2.03,height/12,"検索",0));
    }
  
  }
  
  public void ClearETBs(){
    for(int i=0; i<ETBs.size(); i++){
      ETBs.get(i).pane.remove(ETBs.get(i).field);
      //ETBs.get(i).pane.remove(ETBs.get(i).area);
      ETBs.get(i).pane.remove(ETBs.get(i).scrollPane);
    }
  }
  
  public void DrawETBs(){
    //if(Tpage<4){
      //textAlign(LEFT);
      fill(0,0,95);
      if(Tpage!=2)rect(width/16,-1,width,height+1);
      stroke(150);
      textSize(32);
      fill(0);
      if(Tpage==0)text("イベント作成",width/8,32);
      //f(Tpage==1)text("お気に入り",width/8,32);
      if(Tpage==1)text("ユーザ設定",width/8,32);
      //if(Tpage==3)text("設定",width/8,32);
      textSize(16);
      for(int i=0; i<ETBs.size(); i++){
        ETBs.get(i).Draw();
      //}
      //textAlign(CENTER);
      //noStroke();
    }
  }
}
