
//void panelHome() {
void sectionHome() {
  rectMode(CORNER);  //titles

  //Background
  int panelHomeW = w;
  int panelHomeH = h;
  int panelHomeX = 0;
  int panelHomeY = 0;
  noStroke();
  //Blue box
  fill(colorsBgSectionsReds[0]);
  rect(panelHomeX, panelHomeY, panelHomeW, panelHomeH);
  //Orange box
  fill(colorsBgSectionsBlues[2]);
  rect(gridUnit, gridUnit, panelHomeW-gridUnit*2, panelHomeH-gridUnit*2);
//QUESRIONS FRAME
   fill(colorsBgSectionsBlues[2], 150);//BG Quesitons Home
    rect(gridUnit*1, gridUnit*15, panelHomeW-gridUnit*2, gridUnit*10);//BG QUESTIONS

  //SHAPES LOGO< STAR<BAND
  shape(graphics_logo, panelHomeW/2-30, gridUnit*3+0, 50, 70);
  shape(graphics_star, panelHomeW-gridUnit*4, panelHomeH/2-gridUnit*0, 30, 30);
  shape(graphics_star, gridUnit*4, panelHomeH/2-gridUnit*0, 30, 30);
  shape(graphics_band, gridUnit*24, panelHomeH/2-gridUnit*6, 50, 8);
//  shape(graphics_band, gridUnit*18, panelHomeH/2+gridUnit*5.55, 280, 6);

  fill(255);
  textAlign(CENTER);
  textFont(fontTitles);
  textSize(55);
  text("MyCONSTITUTION", panelHomeW/2, gridUnit*10);
  textSize(22);
  text("Exploring The Current Chilean Constitution", panelHomeW/2, gridUnit*12);

  buttonsHome(250, panelHomeH-160, "Explore Topics");
  buttonsHome(540, panelHomeH-160, "Explore History");
  questions(w/2, panelHomeH/3+40, 1);
} //panelHome ends


void buttonsHome(int _x, int _y, String _t) {
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
    onOver = color(255); //OVER
  }
  else {
    onOver = color(250, 150, 50);
  }    //close if mousePressed

  //check if there is a specific rect available.
  if (foundBottonHome >=0) {
    if (mousePressed) {
      onOver = color(255, 255, 0);
    }
    else {
      //      onOver = 0;
    }    //close if mousePressed

    //SELECT DESTINY
    if (mousePressed) {
      if (_t == "Explore Topics") {
        section = 2;
      }
      if (_t == "Explore History") {
        section = 3;
      }
    }//MOUSE PRESSED END
  }//close if found


  pushMatrix();
  rectMode(CORNER);//ex corners
  //  fill(onOver);
  fill(240, 100);
  //  rect(x1, y1, tW, 50);
  fill(onOver);
  textFont(fontButtonsHome);
  textSize(30);  
  textAlign(CENTER);
  text(_t, x1+tW/2, y1 + 30);
  rectMode(CORNER);//IMPORTANT
  if(foundBottonHome == 1){
    text("{                            }", x1+tW/2, y1 + 30);
  }
  
  popMatrix();
}//END BUTTONS 



