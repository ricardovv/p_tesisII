void myNavs() {
  //grid();
  navBarTop();
  textPressed();
}


void navBarTop() {//Beacground of nav bar top in sectionsx`
  noStroke();
  fill(colorsBg[0], 200);//color bg orange
  rectMode(CORNER);
  rect(0, gridUnit*2, gridUnit*8, gridUnit*2);//color bg orange

  //Button1
  buttonsTop(0, 0, "C");
  //Button2
  buttonsTop(gridUnit*2, 0, "T");
  //Button3
  buttonsTop(gridUnit*4, 0, "H");
  //Button4
  buttonsTop(gridUnit*6, 0, "I");
}//CLOSE navBarTop



//TITLES BAR TOP
void panelTitles(String _title) {
  float tW = textWidth(_title);
  pushMatrix();
  fill(250);//WHITE
  rect(0, gridUnit*4, gridUnit*8, gridUnit*2); //basic BG
  rect(0, gridUnit*4, tW, gridUnit*2);//extended bg
  fill(100);//WHITE
  textSize(16);
  textAlign(LEFT);
  text(_title, gridUnit, gridUnit*3+5);
  popMatrix();
}









//PANEL QUESTIONS - - - - - - - - - - - - - - - 
void questions (int _x, int _y, int _panel) {
  //Dirferent Questiojs for each panel
  String[] questionsHome = {
    "QuestionHome 0", "QuestionHome 1", "QuestionHome 2", "QuestionHome 3", "QuestionHome 4"
  };
  String[] questionsTopics = {  
    "QuestionTopics 0", "QuestionTopics 1", "QuestionTopics 2", "QuestionTopics 3", "QuestionTopics 4"
  };
  String[] questionsHistory = { 
    "QuestionHistory 0", "QuestionHistory 1", "QuestionHistory 2", "QuestionHistory 3", "QuestionHistory 4"
  };
  String[] questionsInfo = { 
    "QuestionInfo 0", "QuestionInfo 1", "QuestionInfo 2", "QuestionInfo 3", "QuestionInfo 4"
  };
  //To move through questions
  if (frameCount % 200 == 0) {// see if 
    println(frameCount);
    counter += 1;
    if (counter == 5) {//reset counter to 0
      counter = 0;
    }
  }
  //Display Questions
  pushMatrix();
  int questionsBgX = _x;
  int questionsBgY = _y;
  int questionsBgW = w-questionsBgX;
  int questionsBgH = gridUnit*4;
  int questionsTextX = questionsBgX + gridUnit*4;//positions for quesitons text
  int questionsTextY = questionsBgY + gridUnit*3+5;
  //bg questions rect
  pushMatrix();
  noStroke();
  fill(255, 0);
  rect(questionsBgX, questionsBgY, questionsBgW, questionsBgH);//BG QUESTIONS
  popMatrix();
  //Text
  fill(200);
  //      textFont(fontButtonsHome);
  textSize(14);  
  textAlign(CENTER);
  //Select specific question to show
  if (_panel == 1) {
//    textAlign(CENTER);
    text(questionsHome[counter], w/2, questionsTextY-15);
  }  
  if (_panel == 2) {
    text(questionsTopics[counter], w/2, questionsTextY);
  }  
  if (_panel == 3) {
    text(questionsHistory[counter], w/2, questionsTextY);
  }  
  if (_panel == 4) {
    text(questionsInfo[counter], questionsTextX, questionsTextY);
  }  
  popMatrix();
}//PANEL QUESTIONS ENDS 









// TO ELIMINATE???
void textPressed() {//may be eliminated? just to teschanges among panels 
  if (keyPressed) {
    if (key == '1') {
      stroke(250);
      textSize(30);
      text("1 is pressed", 500, 25);
      panel = 1;
    }// close key 1
    if (key == '2') {
      stroke(250);
      textSize(30);
      text("2 is pressed", 500, 25);
      panel = 2;
    }// close key 2
    if (key == '3') {
      stroke(250);
      textSize(30);
      text("3 is pressed", 500, 25);
      panel = 3;
    }// close key 3
    if (key == '4') {
      stroke(250);
      textSize(30);
      text("4 is pressed", 500, 25);
      panel = 4;
    }// close key 3
  }//close keyPressed
}//CLOSE textPressed

