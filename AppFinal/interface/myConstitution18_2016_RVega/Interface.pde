void myNavs() {
  //grid();
//BART TOP TO HIDE TEXT SCROLL
  fill(colorsBgSectionsBlues[4]);//color bg orange
  rect(0, gridUnit*2, w, 1);//color bg orange
  navBarTop();  
}


//MAIN NAVIGATION TOP - - - - - - - - - - - - - - - - - - - - - - - - - 
void navBarTop() {//Bacground of nav bar top in sectionsx`
  noStroke();
  rectMode(CORNER);
  //Button1
//  buttonsTop(0, 0, "C");
//Forma para logo esquina

fill(colorsBgButtonsTop[1], 0);
rect(0, 0, 42, 40);

shape(graphics_logo, 10, 5, 22, 30);

  //Button2
 // buttonsTop(gridUnit*2, 0, "T");
  //Button3
//  buttonsTop(gridUnit*4, 0, "H");
  //Button4
  buttonsTop(w-gridUnit*2+2, 0, "i");
}//MAIN NAVIGATION TOP CLOSE - - - - - - - - - - - - - - - - - - - - - - - - - 



//TITLES BAR TOP
void panelTitles(String _title1, String _title2, int _posx, int _posy) {
  float tW = textWidth(_title1);
  pushMatrix();
    fill(  #4B0082);//WHITE
    rectMode(CORNER);
//    rect(_posx, 0, w, gridUnit*2); //basic BG
  //  rect(0, gridUnit*4, gridUnit*8, gridUnit*2); //basic BG
  //  rect(0, gridUnit*4, tW, gridUnit*2);//extended bg
    fill(colorsBgButtonsTop[1]); 
    textFont(fontTitles);
    textAlign(LEFT);
    textSize(20);
    text(_title1, _posx, _posy);

    textSize(14);
    text(_title2, _posx+gridUnit*8, _posy);
  popMatrix();
}




//PANEL QUESTIONS - - - - - - - - - - - - - - - 
void questions (int _x, int _y, int _section) {
  //Dirferent Questiojs for each panel
  String[] questionsAll = {
    "Why do you need to read your Constitution?", 
    "Why the Constitution is so important?", 
    "Do you know how the Constitution is related to your life?",

    "Do you know how the Constitution guarantee your right to education, health, and your allowance?", 
    "Do you what the Constitution says about indigenous people?", 
    "Do you know how to protects you in case of infringement of your rights?" ,

    "Do you know that the Constitution was written during Pinochet's Dictatorship?", 
    "Do you know that the Constitution was written by just 7 people?", 
    "Do you know that the Constitution was voted without official voter register at all?" 
  };


  String[] answersAll = {
    "To be aware about your rights, obligations, and the basic rules of living in our society.", 
    "Because it contains all the general rules for civic life, including your rights.", 
    "The Constitution says what you can do, or not, and why.",
    
    "Articles nº: 23, 57, 86", 
    "Articles nº: 4, 19, 116", 
    "Articles nº: 12, 71, 65", 

    "...and the same Constitution of 1980 last until today, with some minor fixed...",
    "It was written by Ortuzar Committee, seleced by Pinochet, with no participation of civil society.", 
    "And because of this there was no secure vay to count who voted or not..." 
  };


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
    if (counter == questionsAll.length) {//reset counter to 0
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
  color questionsFontColor = colorsBgButtonsTop[1];
  //bg questions rect
  noStroke();
  fill(255, 0);
  rect(questionsBgX, questionsBgY, questionsBgW, questionsBgH);//BG QUESTIONS
  //Text
  fill(questionsFontColor);
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
    text(questionsAll[counter], questionsTextX, questionsTextY);
    textFont(fontBodyText);
    
    textSize(10);
    text("A: "+answersAll[counter], questionsTextX+gridUnit, questionsTextY+20);
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



