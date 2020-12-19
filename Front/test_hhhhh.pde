import javax.swing.*;
import java.awt.*;
JLayeredPane pane;
JTextField field1;
JTextField field2;
JTextArea area;
PImage p_image;
String name;
String name_store;
String ns="a";//サーバーの代わり
String n1="cardgame";
String n2="meeting";
String n3="onlinegame";
String n4="presentation";
String n5="textchat";
String n6="trpg";
String password;
void settings() {
  size(displayWidth, displayHeight);//1920,1080
}

void setup() {
  float dx=displayWidth;
  float dy=displayHeight;
  PFont font = createFont("Meiryo", 50);
  textFont(font);
  surface.setLocation(-3, 0);
  p_image=loadImage("seikin.png");
  Canvas canvas = (Canvas) surface.getNative();
  pane = (JLayeredPane) canvas.getParent().getParent();
  field1 = new JTextField();
  field1.setBounds(int(dx/4.26), int(dy/1.75), 200, 30);//firld.setBounds(x座標,y座標,ボックスの幅,ボックスの高さ)
  pane.add(field1);
  field2 = new JTextField();
  field2.setBounds(int(dx/4.26), int(dy/1.65), 200, 30);//firld.setBounds(x座標,y座標,ボックスの幅,ボックスの高さ)
  pane.add(field2);
}

void draw() {
  float dx=displayWidth;
  float dy=displayHeight;
  background(#FFFFF7);
  interest1(n1, dx/1.74, dy/7.2);
  interest2(n2, dx/1.74, dy/3.6);
  interest3(n3, dx/1.74, dy/2.4);
  interest4(n4, dx/1.74, dy/1.8);
  interest5(n5, dx/1.74, dy/1.44);
  interest6(n6, dx/1.74, dy/1.2);
  profile();
  prof_text();
}

void prof_text() {
  float dx=displayWidth;//1920
  float dy=displayHeight;
  name=field1.getText();
  stroke(#08DCFF);
  fill(#08DCFF);
  if (mouseX<=(dx/2.45+80)&&mouseX>=dx/2.45&&mouseY>=dy/1.65&&mouseY<=dy/1.6+30&&mousePressed==true) {
    fill(#017E93);
    name_store=field1.getText();
    password=field2.getText();
    RegistUser(name_store,password,i3,i6,i1,i2,i4,i5);
  }
  rect(dx/2.45, dy/1.65, 80, 24, 30);
  fill(#FA7C7C);
  stroke(#EA6F6F);
  if(mouseX<=(dx/2.2+80)&&mouseX>=dx/2.2&&mouseY>=dy/1.65&&mouseY<=dy/1.6+30&&mousePressed==true){
    fill(#E32E2E);
    name_store=field1.getText();
    password=field2.getText();
    LoginUser(name_store,password);//uid_storeにuidを格納
    println(uid_store);
  }
  rect(dx/2.2,dy/1.65,80,24,30);//login
  fill(0, 250);
  textSize(20);
  text("氏名", dx/2.9, dy/1.69);
  text("パスワード",dx/2.9,dy/1.6);
  fill(#FFFFF7);
  textSize(20);
  text("保存", dx/2.39, dy/1.60);
  text("Login",dx/2.16,dy/1.61);
  fill(0);
  textSize(60);
  text(name, dx/4.26, dy/1.9);
  if(fl_log==1){
  text("ログインしました",int(dx/4.26),dy/1.3);
  stroke(0);
  line(dx/4.26,dy/1.28,dx/2.09990+15,dy/1.28);
  }
}

void profile() {
  float dx=displayWidth;
  float dy=displayHeight;
  p_image.resize(200, 220);
  image(p_image, dx/9.6, dy/2-100);
  noFill();
  strokeWeight(50);
  stroke(#FFFFF7);
  ellipse(dx/6.4, dy/2, 250, 250);
  strokeWeight(5);
  stroke(0);
  ellipse(dx/6.4, dy/2, 200, 200);
  line(dx/4.26, dy/1.8, dx/2, dy/1.8);
}
