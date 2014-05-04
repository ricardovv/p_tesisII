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
    "QuestionHome 1, QuestionHome 1, QuestionHome 1, QuestionHome 1", 
    "QuestionHome 2", 
    "QuestionHome 3"
  };
  String[] answersHome = {
    "AnswerHome 1, AnswerHome 1, AnswerHome 1, AnswerHome 1, AnswerHome 1, AnswerHome 1, AnswerHome 1", 
    "AnswerHome 2", 
    "AnswerHome 3"
  };

  String[] questionsTopics = {  
    "QuestionTopics 1", 
    "QuestionTopics 2", 
    "QuestionTopics 3" 
  };
  String[] answersTopics = {
    "Topic A, Topic AA, Topic AAA", 
    "Topic B, Topic BB, Topic BBB", 
    "Topic C, Topic CC, Topic CCC"
  };

  String[] questionsHistory = { 
    "QuestionHistory 1", 
    "QuestionHistory 2", 
    "QuestionHistory 3" 
  };
  String[] answersHistory = { 
    "Topic A, Topic AA, Topic AAA", 
    "Topic B, Topic BB, Topic BBB", 
    "Topic C, Topic CC, Topic CCC"
  };


  //To move through questions
  if (frameCount % 200 == 0) {// see if 
    counter += 1;
    if (counter == questionsHome.length) {//reset counter to 0
      counter = 0;
    }
  }
  //Display Questions
  pushMatrix();
  int questionsBgX = 0;//_x w/2
  int questionsBgY = _y;
  int questionsBgW = w;
  int questionsBgH = gridUnit*4;


  int questionsTextX = questionsBgX + gridUnit*4;//positions for quesitons text
  int questionsTextY = questionsBgY + gridUnit*2;
  int questionsTextW = 600;//positions for quesitons text
  int questionsTextH = 100;
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
//QUESTIONS-ANSWERS HOME
  if (_section == 1) {
    fill(#325A78, 150);//BG Quesitons Home
      rect(questionsBgX, questionsBgY, questionsBgW, questionsBgH*3);//BG QUESTIONS
    fill(220);//BG Quesitons Home
    textAlign(CENTER);
    textSize(20);  
    text(questionsHome[counter], 200, questionsTextY, questionsTextW, questionsTextH);
    textSize(18);  
    text(answersHome[counter], 200, questionsTextY+80, questionsTextW, questionsTextH);

  }  
//QUESTIONS-ANSWERS TOPIC
  if (_section == 2) {
    textSize(16);  
    text(questionsTopics[counter], 60+w/2, questionsTextY);
    textSize(10);  fill(0, 150, 250);
    text("answers? explore: "+answersTopics[counter], 60+w/2, questionsTextY+gridUnit);
  }  
//QUESTIONS-ANSWERS HISTORY
  if (_section == 3) {
    textSize(16);  
    text(questionsHistory[counter], 60+w/2, questionsTextY);
    textSize(10);  fill(0, 150, 250);
    text("answers? explore: "+answersHistory[counter], 60+w/2, questionsTextY+gridUnit);
  }  
  popMatrix();
}//PANEL QUESTIONS ENDS 



