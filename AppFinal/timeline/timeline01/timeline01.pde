PImage guia; // image bg 
int posXGuides;
PImage[] capa = new PImage[4];
TimeLine timeLine1;

void setup() {
  size(1024, 768);
  background(20);
  guia = loadImage("imgs/guia.jpg");//imagen bg
 
//REFEENCIA FINAL CLASS DATA
//  timeLine1 =  new Timeline(100, 1973, 1990, periodDictatorship, #AAFFFF);
  timeLine1 =  new TimeLine(100);
  //IMAGES
  for ( int i = 0; i < capa.length; i++ ) {
    capa[i] = loadImage("imgs/"+i+".jpg" );
    println("- " + capa[i]);
  }
}

void draw() {
   background(20);
   timeLine1.display();    
   
   //Bottom part of years and constiotution perdios bars 
   yearsConstitution(100, height);
   
  //Buttons to select period to see in timeline
  buttonsPeriods(100, height-120, 435, "Parlamentary Democracy (from 1810 to 1973)", color(0, 70, 60) );
  buttonsPeriods(535, height-120, 170, "Dictatorship (1973-1991)", color(70, 40, 0) );
  buttonsPeriods(100 + 435 + 170, height-120, 220, "New Democracy (1991-2015)", color(0, 40, 80) );

  // BG IMage reference
  if (keyPressed == true) {
    tint(255, 100);
    image(guia, 0, 0);
  }

}
 

//For the buttons of larger historic periods
void yearsConstitution(int _posX, int _posY){
  int posX = _posX;
  int posY = _posY;
  int w1 = 435;
  int w2 = 390;
  int h = 30;

  //BAR 1 - CONSTITUTION 1925 
  constitutionsPeriodColorBars("CONSTITUTION OF 1925", color(0, 50, 70), posX, posY-70, 515);
  //BAR 2 - CONSTITUTION 1980 
  constitutionsPeriodColorBars("CONSTITUTION OF 1980", color(60, 20, 0), posX+515, posY-70, 310);

  //all numbers 1925 to 2014 at the bottom  
  for(int i=0; i<95; i+=5){
    pushMatrix();
      fill(120);
      textSize(10);
      textAlign(LEFT);
      text(1925+i, 87 + 9.15 *i, posY-20);
      stroke(120);
      line(posX + 9.15 *i, posY-35, 100 + 9.15 *i, posY-45);
     popMatrix();
  }//end 
  
}//END periodHistory


 
//BUTTONS HISTORIC PERIODS 
void buttonsPeriods(int _x, int _y, int _w, String _t, color _colorBg) {
  //fill(255, 255, 0);
//rect(_x, 70, tW, 10);
  int x1 = _x;
  int x2 = _x + _w;
  int y1 = _y;
  int y2 = _y + 50;
  int w = _w/2+x1;
  int foundBottonHome = -1;
  color colorBg = _colorBg;
  color onOver = color(255, 255, 150);
  
  //check mouse over
  if (mouseX>x1 && mouseX<x2 && mouseY>y1 && mouseY<y2 ) {//if the mouse position is inside the specific rect. 
    foundBottonHome = 1;//select that specific rect
    onOver = color(250); //OVER
  } else {
    onOver = color(170);//Hold button color 
  }    //close if mousePressed
//check if there is a specific rect available.
  if (foundBottonHome >=0) {
    if (mousePressed) {
      onOver = color(255, 255, 0);
    } else {
      //      onOver = 0;
    }    //close if mousePressed
  }//close if found

  pushMatrix();
    rectMode(CORNERS);
    //  fill(onOver);
    fill(colorBg);
    noStroke();
      rect(x1, y1, x2, y2-1);
    fill(onOver);
  //  textFont(fontButtonsHome);
    textSize(12);  
    textAlign(CENTER);
    text(_t, w, y1 + 30);//place text in the middle of the button
    rectMode(CORNER);
  popMatrix();
}//END BUTTONS 









//HISTORIC CONSTITUTION PERIODS
void constitutionsPeriodColorBars(String _title, color _color, int _posX, int _posY, int w) {
  int h = 25;
  pushMatrix();
    rectMode(CORNER);
    fill(_color);
    rect(_posX, _posY, w, h);
    fill(150);
    textAlign(CENTER);
    textSize(10);
    text(_title, _posX+w/2, _posY+16);
  popMatrix();
} 





