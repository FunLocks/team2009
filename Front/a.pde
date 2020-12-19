float gxs1=0, gxs2=0, gxs3=0, gxs4=0, gxs5=0, gxs6=0;
float gx1=0, gx2=0, gx3=0, gx4=0, gx5=0, gx6=0;
float d;
String i1, i2, i3, i4, i5, i6;
int kk=0;
void interest1(String s, float x, float y) {
  textSize(30);
  text("興味度",x+500,y-50);
  if (gxs1==0) {
    gxs1=x+450;
  }
  stroke(0, 200);
  fill(0, 200);
  line(x+50, y+50, x+350, y+50);
  line(x+430, y+25, x+670, y+25);
  rect(x, y, 20, 20);
  textSize(40);
  text(s, x+55, y+20);
  if (mousePressed==true&&mouseX>=x+430&&mouseX<=x+670) {
    d=pow(gxs1-mouseX, 2)+pow(y+25-mouseY, 2);
    if (d<900) {
      gx1=mouseX;
      gxs1=gx1;
    }
  }
  ellipse(gxs1, y+25, 30, 30);
  textSize(15);
  text(1, x+450, y+65);
  text(2, x+500, y+65);
  text(3, x+550, y+65);
  text(4, x+600, y+65);
  text(5, x+650, y+65);
  if (gxs1>=x+430&&gxs1<x+500) {
    i1="1";
    line(x+450,y+75,x+460,y+75);
  } else if (gxs1>=x+500&&gxs1<x+550) {
    i1="2";
    line(x+500,y+75,x+510,y+75);
  }else if (gxs1>=x+550&&gxs1<x+600) {
    i1="3";
    line(x+550,y+75,x+560,y+75);
  }else if (gxs1>=x+600&&gxs1<x+650) {
    i1="4";
    line(x+600,y+75,x+610,y+75);
  }else if (gxs1>=x+650&&gxs1<=x+670) {
    i1="5";
    line(x+650,y+75,x+660,y+75);
  }
}

void interest2(String s, float x, float y) {
  if (gxs2==0) {
    gxs2=x+450;
  }
  stroke(0, 200);
  fill(0, 200);
  line(x+50, y+50, x+350, y+50);
  line(x+430, y+25, x+670, y+25);
  rect(x, y, 20, 20);
  textSize(40);
  text(s, x+55, y+20);
  if (mousePressed==true&&mouseX>=x+430&&mouseX<=x+670) {
    d=pow(gxs2-mouseX, 2)+pow(y+25-mouseY, 2);
    if (d<900) {
      gx2=mouseX;
      gxs2=gx2;
    }
  }
  ellipse(gxs2, y+25, 30, 30);
  textSize(15);
  text(1, x+450, y+65);
  text(2, x+500, y+65);
  text(3, x+550, y+65);
  text(4, x+600, y+65);
  text(5, x+650, y+65);
    if (gxs2>=x+430&&gxs2<x+500) {
    i2="1";
    line(x+450,y+75,x+460,y+75);
  } else if (gxs2>=x+500&&gxs2<x+550) {
    i2="2";
    line(x+500,y+75,x+510,y+75);
  }else if (gxs2>=x+550&&gxs2<x+600) {
    i2="3";
    line(x+550,y+75,x+560,y+75);
  }else if (gxs2>=x+600&&gxs2<x+650) {
    i2="4";
    line(x+600,y+75,x+610,y+75);
  }else if (gxs2>=x+650&&gxs2<=x+670) {
    i2="5";
    line(x+650,y+75,x+660,y+75);
  }
}

void interest3(String s, float x, float y) {
  if (gxs3==0) {
    gxs3=x+450;
  }
  stroke(0, 200);
  fill(0, 200);
  line(x+50, y+50, x+350, y+50);
  line(x+430, y+25, x+670, y+25);
  rect(x, y, 20, 20);
  textSize(40);
  text(s, x+55, y+20);
  if (mousePressed==true&&mouseX>=x+430&&mouseX<=x+670) {
    d=pow(gxs3-mouseX, 2)+pow(y+25-mouseY, 2);
    if (d<900) {
      gx3=mouseX;
      gxs3=gx3;
    }
  }
  ellipse(gxs3, y+25, 30, 30);
  textSize(15);
  text(1, x+450, y+65);
  text(2, x+500, y+65);
  text(3, x+550, y+65);
  text(4, x+600, y+65);
  text(5, x+650, y+65);
    if (gxs3>=x+430&&gxs3<x+500) {
    i3="1";
    line(x+450,y+75,x+460,y+75);
  } else if (gxs3>=x+500&&gxs3<x+550) {
    i3="2";
    line(x+500,y+75,x+510,y+75);
  }else if (gxs3>=x+550&&gxs3<x+600) {
    i3="3";
    line(x+550,y+75,x+560,y+75);
  }else if (gxs3>=x+600&&gxs3<x+650) {
    i3="4";
    line(x+600,y+75,x+610,y+75);
  }else if (gxs3>=x+650&&gxs3<=x+670) {
    i3="5";
    line(x+650,y+75,x+660,y+75);
  }
}

void interest4(String s, float x, float y) {
  if (gxs4==0) {
    gxs4=x+450;
  }
  stroke(0, 200);
  fill(0, 200);
  line(x+50, y+50, x+350, y+50);
  line(x+430, y+25, x+670, y+25);
  rect(x, y, 20, 20);
  textSize(40);
  text(s, x+55, y+20);
  if (mousePressed==true&&mouseX>=x+430&&mouseX<=x+670) {
    d=pow(gxs4-mouseX, 2)+pow(y+25-mouseY, 2);
    if (d<900) {
      gx4=mouseX;
      gxs4=gx4;
    }
  }
  ellipse(gxs4, y+25, 30, 30);
  textSize(15);
  text(1, x+450, y+65);
  text(2, x+500, y+65);
  text(3, x+550, y+65);
  text(4, x+600, y+65);
  text(5, x+650, y+65);
    if (gxs4>=x+430&&gxs4<x+500) {
    i4="1";
    line(x+450,y+75,x+460,y+75);
  } else if (gxs4>=x+500&&gxs4<x+550) {
    i4="2";
    line(x+500,y+75,x+510,y+75);
  }else if (gxs4>=x+550&&gxs4<x+600) {
    i4="3";
    line(x+550,y+75,x+560,y+75);
  }else if (gxs4>=x+600&&gxs4<x+650) {
    i4="4";
    line(x+600,y+75,x+610,y+75);
  }else if (gxs4>=x+650&&gxs4<=x+670) {
    i4="5";
    line(x+650,y+75,x+660,y+75);
  }
}

void interest5(String s, float x, float y) {
  if (gxs5==0) {
    gxs5=x+450;
  }
  stroke(0, 200);
  fill(0, 200);
  line(x+50, y+50, x+350, y+50);
  line(x+430, y+25, x+670, y+25);
  rect(x, y, 20, 20);
  textSize(40);
  text(s, x+55, y+20);
  if (mousePressed==true&&mouseX>=x+430&&mouseX<=x+670) {
    d=pow(gxs5-mouseX, 2)+pow(y+25-mouseY, 2);
    if (d<900) {
      gx5=mouseX;
      gxs5=gx5;
    }
  }
  ellipse(gxs5, y+25, 30, 30);
  textSize(15);
  text(1, x+450, y+65);
  text(2, x+500, y+65);
  text(3, x+550, y+65);
  text(4, x+600, y+65);
  text(5, x+650, y+65);
    if (gxs5>=x+430&&gxs5<x+500) {
    i5="1";
    line(x+450,y+75,x+460,y+75);
  } else if (gxs5>=x+500&&gxs5<x+550) {
    i5="2";
    line(x+500,y+75,x+510,y+75);
  }else if (gxs5>=x+550&&gxs5<x+600) {
    i5="3";
    line(x+550,y+75,x+560,y+75);
  }else if (gxs5>=x+600&&gxs5<x+650) {
    i5="4";
    line(x+600,y+75,x+610,y+75);
  }else if (gxs5>=x+650&&gxs5<=x+670) {
    i5="5";
    line(x+650,y+75,x+660,y+75);
  }
}

void interest6(String s, float x, float y) {
  if (gxs6==0) {
    gxs6=x+450;
  }
  stroke(0, 200);
  fill(0, 200);
  line(x+50, y+50, x+350, y+50);
  line(x+430, y+25, x+670, y+25);
  rect(x, y, 20, 20);
  textSize(40);
  text(s, x+55, y+20);
  if (mousePressed==true&&mouseX>=x+430&&mouseX<=x+670) {
    d=pow(gxs6-mouseX, 2)+pow(y+25-mouseY, 2);
    if (d<900) {
      gx6=mouseX;
      gxs6=gx6;
    }
  }
  ellipse(gxs6, y+25, 30, 30);
  textSize(15);
  text(1, x+450, y+65);
  text(2, x+500, y+65);
  text(3, x+550, y+65);
  text(4, x+600, y+65);
  text(5, x+650, y+65);
    if (gxs6>=x+430&&gxs6<x+500) {
    i6="1";
    line(x+450,y+75,x+460,y+75);
  } else if (gxs6>=x+500&&gxs6<x+550) {
    i6="2";
    line(x+500,y+75,x+510,y+75);
  }else if (gxs6>=x+550&&gxs6<x+600) {
    i6="3";
    line(x+550,y+75,x+560,y+75);
  }else if (gxs6>=x+600&&gxs6<x+650) {
    i6="4";
    line(x+600,y+75,x+610,y+75);
  }else if (gxs6>=x+650&&gxs6<=x+670) {
    i6="5";
    line(x+650,y+75,x+660,y+75);
  }
}
