void myNavs() {
  //grid();
  navBarTop();
}


//MAIN NAVIGATION TOP - - - - - - - - - - - - - - - - - - - - - - - - - 
void navBarTop() {//Bacground of nav bar top in sectionsx`
  noStroke();
  rectMode(CORNER);
//BART TOP TO HIDE TEXT SCROLL
  fill(colorsBg[2]);//color bg orange
  rect(0, 0, w, gridUnit*2);//color bg orange
  //Button1
  buttonsTop(0, 0, "C");
  //Button2
  buttonsTop(gridUnit*2, 0, "T");
  //Button3
  buttonsTop(gridUnit*4, 0, "H");
  //Button4
  buttonsTop(w-gridUnit*2, 0, "i");
}//MAIN NAVIGATION TOP CLOSE - - - - - - - - - - - - - - - - - - - - - - - - - 



//TITLES BAR TOP
void panelTitles(String _title) {
  float tW = textWidth(_title);
  pushMatrix();
  fill(150);//WHITE
  rect(0, gridUnit*4, gridUnit*8, gridUnit*2); //basic BG
  rect(0, gridUnit*4, tW, gridUnit*2);//extended bg
  fill(250);//WHITE
  textSize(16);
  textAlign(LEFT);
  text(_title, gridUnit, gridUnit*3+5);
  popMatrix();
}




//PANEL QUESTIONS - - - - - - - - - - - - - - - 
void questions (int _x, int _y, int _section) {
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
  noStroke();
  fill(255, 0);
  rect(questionsBgX, questionsBgY, questionsBgW, questionsBgH);//BG QUESTIONS
  //Text
  fill(200);
  //      textFont(fontButtonsHome);
  textSize(14);  
  textAlign(CENTER);
  //Select specific question to show
  if (_section == 1) {
//    textAlign(CENTER);
    text(questionsHome[counter], w/2, questionsTextY-15);
  }  
  if (_section == 2) {
    text(questionsTopics[counter], w/2, questionsTextY);
  }  
  if (_section == 3) {
    text(questionsHistory[counter], w/2, questionsTextY);
  }  
  if (_section == 4) {
    text(questionsInfo[counter], questionsTextX, questionsTextY);
  }  
  popMatrix();
}//PANEL QUESTIONS ENDS 



