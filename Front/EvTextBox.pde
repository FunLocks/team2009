import javax.swing.*;
import java.awt.*;

class EvTextBox{
  private float etx;
  private float ety;
  private float etdx;
  private float etdy;
  private String ett;
  private int etswitch;
  
  public JLayeredPane pane;
  public JTextField field;
  public JTextArea area;
  public JScrollPane scrollPane = new JScrollPane(area);
    
  public EvTextBox(float etx, float ety, float etdx, float etdy, String ett, int etswitch){
    this.etx=etx;
    this.ety=ety;
    this.etdx=etdx;
    this.etdy=etdy;
    this.ett=ett;
    this.etswitch=etswitch;
    

    Canvas canvas = (Canvas) surface.getNative();
    pane = (JLayeredPane) canvas.getParent().getParent();
    
    field = new JTextField();
    
    area = new JTextArea();
    area.setBounds(10, 10, 150, 30);
    area.setLineWrap(true);
    area.setWrapStyleWord(true);
    scrollPane = new JScrollPane(area);
    
    if(etswitch==0){
      field.setBounds(int(etx), int(ety+16+5), int(etdx+2), int(etdy-16+1));
    }else{
      scrollPane.setBounds(int(etx), int(ety+16+5), int(etdx+2), int(etdy-16+1));
    }
    pane.add(field);
    pane.add(scrollPane);
  }
  
  
  public void Draw(){
    fill(0,0,95);
    rect(etx,ety,etdx,etdy);
    fill(0,0,30);
    text(ett,etx,ety+16);
  }
}
