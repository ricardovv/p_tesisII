
//ALL FUNCITONS OF TIMELINE IN A SINGLE FUNCTION
void TimeLineMain(int _posX) {
//TIMELINE MAIN
  timeLine();


  //Buttons to select period to see in timeline
  buttonsPeriods(buttonPeriod1X, height-120, buttonPeriod1W, "Parlamentary Democracy (1810-1973)", timeLineColor1 );
  buttonsPeriods(buttonPeriod2X, height-120, buttonPeriod2W, "Dictatorship (1973-1991)", timeLineColor2 );
  buttonsPeriods(buttonPeriod3X, height-120, buttonPeriod3W, "New Democracy (1991-2015)", timeLineColor3 );


  //BAR 1 - CONSTITUTION 1925 
  constitutionsPeriodColorBars("CONSTITUTION OF 1925", color(25, 35, 60), 0, height-70, 300);
  //BAR 2 - CONSTITUTION 1980 
  constitutionsPeriodColorBars("CONSTITUTION OF 1980", color(50, 30, 0), 300, height-70, 725);


  //YEARS BOTTOM 
   yearsConstitution(100, height);

} 




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

      //to change bg selector colors and move indicator of section
      if(_t == "Parlamentary Democracy (1810-1973)"){
        timeLineAreaSelectorCurrentColor = timeLineColor1;
        movingIndicatorPeriodX = buttonPeriod1X + buttonPeriod1W/2;
      }
      if(_t == "Dictatorship (1973-1991)"){
        timeLineAreaSelectorCurrentColor = timeLineColor2;
        movingIndicatorPeriodX = buttonPeriod2X + buttonPeriod2W/2;
      }
      if(_t == "New Democracy (1991-2015)"){
        timeLineAreaSelectorCurrentColor = timeLineColor3;
        movingIndicatorPeriodX = buttonPeriod3X + buttonPeriod3W/2;
      }
    
   }//COSE MOUSE PRESSED

    //} else {
      //      onOver = 0;
    //}    //close if mousePressed
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
  int posX = _posX;


//DRAW BLOCKS
  pushMatrix();
    rectMode(CORNER);
    fill(_color);
    rect(_posX, _posY, w, h);
    fill(130);
    textAlign(CENTER);
    textSize(10);
    text(_title, _posX+w/2, _posY+16);
  popMatrix();

}//CLOSE HISTORIC CONSTITUTION PERIODS FUNCTION 





//YEARS
void yearsConstitution(int _posX, int _posY){
  int posX = _posX-15;
  int posY = _posY;
  int w1 = 435;
  int w2 = 390;
  int h = 30;


  //all numbers 1925 to 2014 at the bottom  
  for(int i=1; i<57; i+=3){
    pushMatrix();
    float factor = 15.25;
      fill(120);
      textSize(10);
      textAlign(CENTER);
      text(1959+i, 85 + factor *i, posY-20);
      stroke(120);
      line(posX + factor *i, posY-35, posX + factor *i, posY-45);
     popMatrix();
  }//end 
  
}//END YEARS FUNCTION
