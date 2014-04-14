PImage[] capa = new PImage[4];
TimeLine timeLine1;

void setup() {
  size(1024, 768);
  background(50);
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
   background(50);
   timeLine1.display();    
   yearsConstitution(100, height-100);
}

//For the buttons of larger historic periods
void yearsConstitution(int _posX, int _posY){
  int posX = _posX;
  int posY = _posY;
  int w1 = 435;
  int w2 = 390;
  int h = 30;

//BAR 1 - CONSTITUTION 1925 
constitutionsPeriodsBars("CONSTITUTION OF 1925", color(0, 80, 90), posX, posY, 435);
//BAR 2 - CONSTITUTION 1980 
constitutionsPeriodsBars("CONSTITUTION OF 1980", color(0, 80, 90), posX, posY, 435);


//all numbers 1925 to 2014 at the bottom  
    for(int i=0; i<95; i+=5){
      pushMatrix();
        fill(120);
        textSize(10);
        textAlign(LEFT);
        text(1925+i, 87 + 9.15 *i, height-40);
        stroke(120);
        line(posX + 9.15 *i, height-70, 100 + 9.15 *i, height-55);
      popMatrix();
  }
  
}//END periodHistory




//HISTORIC CONSTITUTION PERIODS
void constitutionsPeriodsBars(String _title, color _color, int _posX, int _posY, int w) {
  int h = height-100;
  pushMatrix();
    rectMode(CORNER);
    fill(_color);
    rect(_posX, _posY, w, 30);
    fill(200);
    textAlign(CENTER);
    textSize(12);
    text(_title, _posX+w/2, _posY+20);
  popMatrix();
} 


//BUTTONS HISTORIC PERIODS 
void buttonsPeriods(int _x, int _y, String _t) {
  float tW = textWidth(_t);
  //fill(255, 255, 0);
  //rect(_x, 70, tW, 10);
  int x1 = _x;
  int x2 = _x + int(tW);
  int y1 = _y;
  int y2 = _y + 50;
  int foundBottonHome = -1;
  color onOver = color(255, 255, 150);
  
  //check mouse over
  if (mouseX>_x && mouseX<x2 && mouseY>y1 && mouseY<y2 ) {//if the mouse position is inside the specific rect. 
    foundBottonHome = 1;//select that specific rect
    onOver = color(250); //OVER
  } else {
    onOver = color(250, 250, 150);
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
    fill(240, 100);
    //  rect(x1, y1, x2, y2);
    fill(onOver);
  //  textFont(fontButtonsHome);
    textSize(30);  
    textAlign(LEFT);
    text(_t, x1, y1 + 30);
    rectMode(CORNER);
  popMatrix();
}//END BUTTONS 


