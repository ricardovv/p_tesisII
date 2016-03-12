void myNavs() {
  //grid();
//BART TOP TO HIDE TEXT SCROLL
  fill(colorsBgSectionsBlues[0], 0);//color bg orange
  rect(0, 0, w, gridUnit*2);//color bg orange
  navBarTop();
  }


//MAIN NAVIGATION TOP - - - - - - - - - - - - - - - - - - - - - - - - - 
void navBarTop() {//Bacground of nav bar top in sectionsx`
  noStroke();
  rectMode(CORNER);
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
    fill(140,0);//WHITE
    rectMode(CORNER);
    rect(gridUnit*9, 0, gridUnit*6, gridUnit*2); //basic BG
  //  rect(0, gridUnit*4, gridUnit*8, gridUnit*2); //basic BG
  //  rect(0, gridUnit*4, tW, gridUnit*2);//extended bg
    fill(250);//WHITE
    textSize(16);
    textAlign(LEFT);
    text(_title, gridUnit*7, gridUnit*1+5);
  popMatrix();
}




//PANEL QUESTIONS - - - - - - - - - - - - - - - 
void questions (int _x, int _y, int _section) {
  //Dirferent Questiojs for each panel
  String[] questionsHome = {
    "Why do you need to read your Constitution?", 
    "Why the Constitution is so important?", 
    "How It is related to your life?"
  };
  String[] answersHome = {
    "A: To be aware about your rights, obligations, and the basic rules of living in our society.", 
    "A: Because it contains all the general rules for civic life, including your rights.", 
    "A: The Constitution says what you can do, or not, and why."
  };

  String[] questionsTopics = {  
    "Do you know how the Constitution affects your right to education, health, and your allowance?", 
    "Do you what the Constitution says about indigenous people?", 
    "Do you know how to protects you in case of infringement of your rights?" 
  };
  String[] answersTopics = {
    "Civil rights, Decentralization, Education, Constitutional guarantees, Constitutional process \nArticles nº: 23, 57, 86", 
    "Environment, Parliamentary rules, Politics and power, Privacy, Intellectual property \nArticles nº: 4, 19, 116", 
    "Natural resources, Health, Job, Transparency and probity, International treaties  \nArticles nº: 12, 71, 65", 
};

  String[] questionsHistory = { 
    "Do you know that the Constitution was written by just 7 people?", 
    "Do you know that the Constitution was voted without official voter register at all?", 
    "Do you know that the Constitution was written during Pinochet's Dictatorship?" 
  };
  String[] answersHistory = { 
    "Topic A, Topic A, Topic B, Topic C.  &  Articles nº: 23, 57, 86", 
    "Topic A, Topic A, Topic B, Topic C.  &  Articles nº: 23, 57, 86", 
    "Topic A, Topic A, Topic B, Topic C.  &  Articles nº: 23, 57, 86", 
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
  int questionsBgX = _x;//_x w/2
  int questionsBgY = _y;
  int questionsBgW = w;
  int questionsBgH = gridUnit*4;


  int questionsTextX = _x;//positions for quesitons text
  int questionsTextY = questionsBgY + gridUnit*2;
  int questionsTextW = 600;//positions for quesitons text
  int questionsTextH = 100;
  //bg questions rect
  noStroke();
  fill(255, 0);
  rect(questionsBgX, questionsBgY, questionsBgW, questionsBgH);//BG QUESTIONS
  //Text
  fill(colorsBgSectionsBlues[3]);
        textFont(fontButtonsHome);
  textSize(14);  
  textAlign(CENTER);

  //Select specific question to show
//QUESTIONS-ANSWERS HOME
  if (_section == 1) {
    fill(#B9EFFF);//BG Quesitons Home
    textAlign(CENTER);
    textSize(26);  
    text(questionsHome[counter], 200, questionsTextY+30, questionsTextW, questionsTextH);
    textSize(18);  
    text(answersHome[counter], 200, questionsTextY+80, questionsTextW, questionsTextH);

  }  
//QUESTIONS-ANSWERS TOPIC
  if (_section == 2) {
    textAlign(LEFT);
    textSize(16);  
    text(questionsTopics[counter], questionsTextX, questionsTextY);
        textFont(fontBodyText);    textSize(12);  fill(0, 150, 250); textLeading(14);
    text("answers? explore: "+answersTopics[counter], questionsTextX, questionsTextY+20);
  }  
//QUESTIONS-ANSWERS HISTORY
  if (_section == 3) {
    textAlign(LEFT);
    textSize(16);  
    text(questionsHistory[counter], questionsTextX, questionsTextY);
        textFont(fontBodyText);    textSize(12);  fill(0, 150, 250); textLeading(14);
    text("answers? explore: "+answersHistory[counter], questionsTextX, questionsTextY+20);
  }  
  popMatrix();
}//PANEL QUESTIONS ENDS 



