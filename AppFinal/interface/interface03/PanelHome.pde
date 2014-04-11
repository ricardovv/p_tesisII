//

void panelHome() {
  rectMode(CORNER);  //titles

  //Background
  int panelW = w;
  int panelH = h;
  noStroke();
  //Blue box
  fill(colorsBg[0]);
  rect(0, 0, panelW, panelH);
  //Orange box
  fill(colorsBg[1]);
  rect(gridUnit, gridUnit, panelW-gridUnit*2, panelH-gridUnit*2);

  //TEXT TITLE
  fill(255);
  textAlign(CENTER);
  textFont(fontTitles);
  textSize(80);
  text("THE CONSTITUTION", panelW/2, panelH/2-160);
  textSize(25);
  text("Visual Exploration Trough Chilean Current Contitution", panelW/2, panelH/2-110);


  buttonsHome(250, panelH-200, "Explore Topics");
  buttonsHome(540, panelH-200, "Explore History");

  questionsHome(panelW/2, panelH/2+50);
}


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
    onOver = color(250); //OVER
  }
  else {
    onOver = color(250, 250, 150);
  }    //close if mousePressed



  if (foundBottonHome >=0) {//check if there is a specific rect available.
    if (mousePressed) {
      onOver = color(255, 255, 0);
      //rect(x1, y1, x2, y2);//select the specific rect founded

      //test buttons for loading sections
      //      if (_t == "T") {
      //        //        rect(200, 200, 200, 200);
      //      }
    }
    else {
      //      onOver = 0;
    }    //close if mousePressed
  }//close if found


  pushMatrix();
  rectMode(CORNERS);
  //  fill(onOver);
  fill(240, 100);
  //  rect(x1, y1, x2, y2);
  fill(onOver);
  textFont(fontButtonsHome);
  textSize(30);  
  textAlign(LEFT);
  text(_t, x1, y1 + 30);
  rectMode(CORNER);
  popMatrix();
}//END BUTTONS 



//PANEL QUESTIONS
void questionsHome (int _x, int _y) {
  String[] questionsHome = {
    "Question 0", "Question 1", "Question 2", "Question 3", "Question 4"
  };


  if (frameCount % 200 == 0) {// see if 
    println(frameCount);
    counter += 1;
    if (counter == 5) {//reset counter to 0
      counter = 0;
    }
  }



  fill(255);
  textFont(fontButtonsHome);
  textSize(40);  
  textAlign(CENTER);
  text(questionsHome[counter], _x, _y);
}



