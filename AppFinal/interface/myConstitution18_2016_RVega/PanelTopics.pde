// revisar panelW, lo necesito? 
// crear array boolean para on/of boxes 

void panelTopics() {
  int panelW = gridUnit*11;//width bg panel topics
  int panelH = h - gridUnit*2;
  //Topic Panel position 
  int menuX = 5;//position from left
//  int menuY = gridUnit*5;//position from top

  int menuY = int(visualPosY - boxChapterH);//position from top

  //IMPORTANT
  rectMode(CORNER);
  textFont(fontBodyText);  //sans font w createFont

  //QUESITONS AT THE TOP
//  questions(gridUnit*14, -10, 2);
  //VISUALIZATION STRUCTURE
  menuTopics(menuX, menuY);
  //TEXT PANEL WITH CONTENTS
  //FROM FORLOOPDISTRIBUTION08
  visualizationLabels( gridUnit*0, gridUnit*36 );
  chaptersTopDisplay();
  articlesDisplayBoxes();
  //Boxes to be opened on click article
  textContentPanel(textBoxPosY);

//TEST WHICH TEXT IS LOADING IN THE SCROLL TEXT PANEL  
  //textSize(60);
  //fill(200);
//text(scrollArticleSelected, 200, 100);


}//panelTopics ENDS



//7- void menuTopics(int _x, int _y){
//8- void textContentPanel() {
//9- BUTTONS CATEGORIES
//1- void  checkCategory() {
//2- void chaptersTopDisplay(){
//3- void chapterDetailsOverVisualization( float _newPosBoxX, float _newPosBoxY, String _chapterTitle, String _chapterDescription ) {  
//4- void articlesDisplayBoxes(){
//5- void articleDetailsOverVisualization( float _newPosBoxX, float _newPosBoxY, String _articleNumberText, int _articleWordsNum, String _articleTopics ) {  
//6- void visualizationLabels(float _x, float _y){



//7-MenuTOPICS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void menuTopics(int _x, int _y){
  int menuTopicX = _x;
  int menuTopicY = _y;
  int menuItemW = gridUnit*10;
  int menuItemH = 20;
  int menuTitleY = menuTopicY;
  int menuTitleH = 20;//gridUnit*2;
  //MENU TITLE
  noStroke();
  fill(colorsBgSectionsBlues[4]);//COLOR BG TIITLE
    rect(menuTopicX, menuTitleY, menuItemW, menuTitleH);//rect bg title
  fill(200);
    textAlign(LEFT, TOP);  textSize(10);
    text("SELECT TOPICS", menuTopicX+10, menuTitleY+5);//TITLE TEXT

  //A - MENU TOPICS - TEXT AND BOX
  for (int i=0; i<topicsCategoryNames.length; i++) {
      //bg cajas de cada topic
//  articlesButtonsCategories(int _x, int _y, int _w, int _h, int _i, String _t, int _n) {
    articlesButtonsCategories(menuTopicX, menuTitleY+menuTitleH+menuItemH*i, menuItemW, menuItemH, i, topicsCategoryNames[i], i);

  }//end for
}
//7- MenuTOPICS CLOSE - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




//9- BUTTONS CATEGORIES - - - - - - - - - - - - - - - - - - - - - - - - 
void articlesButtonsCategories(int _x, int _y, int _w, int _h, int _i, String _t, int _n) {
  int bX = _x;
  int bY = _y;
  int bW = _w;
  int bH = _h;
  int found = -1;
  int onOver = colorsBgSectionsBlues[5];
  String text = _t;
  int appearsInNArticles = _i;
  int myI = _i; 
  //check mouse over
  if (  (mouseX>bX && mouseX<bX+bW)   &&  (mouseY>bY && mouseY<bY+bH)  ) {//if the mouse position is inside the specific rect. 
    found = 1;//select that specific rect
  }
  if (found >=0) {//check if there is a specific rect available.
    if (mousePressed) {

      onOver = colorsBgSectionsBlues[1];
/*        //OPTION 1 Check button to highlight articles boxes
        for(int i=0; i<categ_ArticlesToHigh.length;i++){
          if (myI+1 == articlesCategoryHighligth[i]) { // check myI & categories are equal, myI+1 to avoid 0
             boxOn[i] = true;
          }             
        }//close forloop 
*/      
        //OPTION 2 Check button to highlight articles boxes
//        for(int i=0; i<categ_ArticlesToHigh.length;i++){
//          if (myI+1 == categ_ArticlesToHigh[i]) { // check myI & categories are equal, myI+1 to avoid 0
//             boxOn[i] = true;
//          }             
//        }//close forloop 
        
                // For every column I, visit every row J.
        for (int i = 0; i < categ_ArticlesToHigh_colsLenght; i++) {
          for (int j = 0; j < categ_ArticlesToHigh_rowsLenght; j++) {
            int toOn = categ_ArticlesToHigh[i][j];
                  boxOn[toOn] = false;//to off previous selections
            if (myI == i) { // check myI & categories are equal, myI+1 to avoid 0
               boxOn[toOn] = true;//Higlight box               
            }             
        text(myI, 220, 100);        

          }//close for j 
        }//close for i
        
        
     }else {
       onOver = colorsBgSectionsBlues[4];
       boxOn[myI] = false;
     }//close if mousePressed
  }//close if found
//  rectMode(CORNERS);
  fill(onOver);
    rect(bX, bY, bW, bH);
  fill(colorsBgSectionsBlues[4]+20);//COLOR BAR
    rect(bX, bY+2, (bW/2)+(appearsInNArticles*3), bH-4);//linea roja larga depende cuantor asticulos
  //BUTTON TITLE
  fill(190);
  textSize(10);  
  textAlign(LEFT);
  text(text + "   ("+appearsInNArticles+")", bX+10, bY+14);
}//2- LOSE MAIN NAV BUTTONS AT THE TOP - - - - - - - - - - - - - - - - - - - - - - - - 




//FROM FORLOOPDISTRIBUITON08
  
//1- CHECK CATEGORY HEIGHT OR WIDTHS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void  checkCategory() {
//  posY[0] = 0;//starting at...
  for(int i=0; i<articlesLengthCategory.length; i++){
    fill(200);
    if(articlesLengthCategory[i]==1){ bH[i]  = articleBoxHintial*1.0; }//category 1 & 2 the same
    if(articlesLengthCategory[i]==2){ bH[i]  = articleBoxHintial*1.0; }
    if(articlesLengthCategory[i]==3){ bH[i]  = articleBoxHintial*1.5; }
    if(articlesLengthCategory[i]==4){ bH[i]  = articleBoxHintial*2.0; }//4 & 5 equals
    if(articlesLengthCategory[i]==5){ bH[i]  = articleBoxHintial*2.0; }
    if(articlesLengthCategory[i]==6){ bH[i]  = articleBoxHintial*2.5; }
    if(articlesLengthCategory[i]==7){ bH[i]  = articleBoxHintial*3.0; }// from here 1 point less
    if(articlesLengthCategory[i]==8){ bH[i]  = articleBoxHintial*3.0; }
    if(articlesLengthCategory[i]==9){ bH[i]  = articleBoxHintial*3.5; }
    if(articlesLengthCategory[i]==10){ bH[i] = articleBoxHintial*4.0; }
    if(articlesLengthCategory[i]==11){ bH[i] = articleBoxHintial*4.5; }
    if(articlesLengthCategory[i]==12){ bH[i] = articleBoxHintial*6.0; }
    if(articlesLengthCategory[i]==13){ bH[i] = articleBoxHintial*6.5; }
    if(articlesLengthCategory[i]==14){ bH[i] = articleBoxHintial*7.0; }
    if(articlesLengthCategory[i]==15){ bH[i] = articleBoxHintial*7.5; }
    if(articlesLengthCategory[i]==16){ bH[i] = articleBoxHintial*8.0; }
    if(articlesLengthCategory[i]==17){ bH[i] = articleBoxHintial*8.5; }
    if(articlesLengthCategory[i]==18){ bH[i] = articleBoxHintial*9.0; }
    if(articlesLengthCategory[i]==19){ bH[i] = articleBoxHintial*9.5; }
  }
}//CLOSE 1- CHECK CATEGORY HEIGHT OR WIDTHS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


//2- DISPLAY CHAPTERS TOP - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void chaptersTopDisplay(){ 
  for (int i=0; i<chaptersNumber.length; i++) {
      boxChapterX = visualPosX + boxChapterW*i;
      boxChapterY = visualPosY - boxChapterH;
      noStroke();
      fill(colorsBgSectionsReds[3]);//Color chapters
      rect(boxChapterX, boxChapterY, boxChapterW-sep*5, boxChapterH);//boxes each section, negative value to show at -height
      fill(250);textAlign(LEFT);textSize(10);
      text(chaptersNumber[i], 4+visualPosX+articleBoxW*i, boxChapterY+10);//boxes each article
      //BOXES ARTICLES
      if (i == 15) {//select first columt to color
        fill(150, 200, 250);
      }else {
        fill(200, 240, 140);
      }
    //BOX VIS ARTICLE TOP ROLLOVER
    if (  (mouseX>boxChapterX && mouseX<boxChapterX+articleBoxW-sep*5)  &&  (mouseY>boxChapterY && mouseY<boxChapterY+boxChapterH)  ) {
      chapterDetailsOverVisualization( mouseX, visualPosY, chaptersTitle[i], chaptersDescriptions[i]);
    }
  }//close for
}//2- BOXES CHAPTERS TOP - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


//3- DETAILS OVER CHAPTERS on chaptersTopDisplay() - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void chapterDetailsOverVisualization( float _newPosBoxX, float _newPosBoxY, String _chapterTitle, String _chapterDescription ) {  
  int boxW = 320;
  int boxH = 70;
  int boxPosX = -boxW/2;
  int dis = 4;
  noStroke();

//To avoid the details go out of screen
  if(mouseX>w-180){
    boxPosX = boxPosX-125;
  }
  if(mouseX<320){
    boxPosX = boxPosX+100;
  }

  pushMatrix();
    translate(_newPosBoxX, visualPosY-90);    //CHECK IF IS BEYOND WIDTH
    //TRIANGLE BELOW GRIS
    fill(50, 150); //COLOR BG colorTop[13]-200 
    triangle(-10+dis, dis+boxH-10, 10+dis, dis+boxH-10, 0+dis, dis+boxH);
    rect(boxPosX+dis, -10+dis, boxW, boxH);
    //BOX AND TRIANGE OVER
    fill(250, 150, 50); //COLOR TEXT 
    triangle(-10, boxH-10, 10, boxH-10, 0, boxH);
    fill(250, 150, 50); //COLOR TEXT 
    rect(boxPosX, -10, boxW, boxH);
      fill(colorsBgSectionsReds[3]); //COLOR BOX TOP 
      rect(boxPosX, -10, boxW, 25);
    //TEXT
    fill(255);
    textSize(12);
    textAlign(CENTER);textLeading(9);
    text(_chapterTitle, boxPosX+5, -5, boxW-10, boxH-15 );//TEXT TITLE
    textSize(10); textLeading(12);    fill(20);
    text(_chapterDescription, boxPosX+6, 18, boxW-14, boxH );//Text description
  popMatrix();
}//3- CLOSE OVER VISUALIZATIONS CHAPTER TOP - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//4- DISPLAY ARTICLES 
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void articlesDisplayBoxes(){
  //  posY[0] = 0;//starting at...
  int foundOverBox = -1;
  int myOrigin=0;
  
  //1- ASSIGN VALUES
  for(int i=0; i<articlesLengthCategory.length; i++){
    //CHECK THE STARTING ARTICE NUMBER TO ASIGN NEW X POS TO THE RIGHT
    for(int j=0; j<chapterStartAt.length; j++){
      if(articlesIdNumber[i] == chapterStartAt[j]){
        posY[i] = 0;
        posY[i+1] = posY[i]+bH[i];  
        if(chapterStartAt[j]>0){ 
           countToRight = j;//to avoid to move animated to the left...  
        } //to aoid to move one more W at start 
      }else {
        posY[i+1] = posY[i]+bH[i];  
      }//close if 
    }//CLOSE FOR 2
    articlesPosX[i] = int(visualPosX + articleBoxW*countToRight);
    articlesPosY[i] = int(visualPosY + posY[i] + sep);

    //draw ellipse boxes
    if(boxOn[i] == false){//change state from category button
      fill(colorsBgSectionsBlues[1]);// boxes still
    }else{
    //selected box
    fill(#34A508);//fill(colorsBgSectionsReds[0]);
    }
    //drawBoxes    
    rect( articlesPosX[i] ,articlesPosY[i] ,articleBoxW-sep*5, bH[i]-sep );

    //draw titles text 
    textSize(8);textAlign(LEFT);fill(250);
    text(articlesTitNumber[i], 2+articlesPosX[i], articlesPosY[i]+8);

    //draw cross reference squares 
    int crossSz = 7;
    //  int crossPointX = articlesPosX[i]+articleBoxW-16;    
    int crossPointX = articlesPosX[i]+articleBoxW-(crossSz*2)+1;    
    int crossPointY = articlesPosY[i]+1;
    fill(cajasCrossReference); 
//    rectMode(CORNER);    
//    rect( crossPointX, articlesPosY[i]+1 , crossSz, crossSz ); 
    ellipseMode(CORNER);    
    ellipse( crossPointX, articlesPosY[i]+1 , crossSz, crossSz ); 

    // draw refernce lines, to heavy here 
    if(  (mouseX>crossPointX && mouseX<crossPointX+crossSz)   &&     (mouseY>crossPointY && mouseY<crossPointY+crossSz)    ){
    stroke(cajasCrossReference); //smooth();
    for(int j=0; j<140; j+=10){
      myOrigin = articlesIdNumber[i];//Originn of lines cross reference.
      //crossRefLine(articlesPosX[myOrigin]+articleBoxW-10 ,articlesPosY[myOrigin]+5,     articlesPosX[j]+articleBoxW-10 ,articlesPosY[j]+5    );
      line(articlesPosX[myOrigin-1]+articleBoxW-10 ,articlesPosY[myOrigin-1]+5,     articlesPosX[j]+articleBoxW-10 ,articlesPosY[j]+5    );
    }
    noStroke();
    }//CLOSE CROSS REFERENCE

  }//CLOSE FOR 1- ASSIGN VALUES


 //on/off boxes 
 if(articleBoxesActive){
 //show details on rolllover
   for(int i=0; i<articlesLengthCategory.length; i++){
     if (  (mouseX>articlesPosX[i] && mouseX<articlesPosX[i]+articleBoxW-sep*5-10)  &&  (mouseY>articlesPosY[i] && mouseY<articlesPosY[i]+bH[i]-sep)  ) {
        articleDetailsOverVisualization( mouseX, mouseY, articlesTitNumber[i], articlesWordLength[i], "Civil rights, Constitutional guarantees, Environment, Politics and power, Privacy" );
        scrollArticleSelected = i; //SELECT NUMBER OF ARTOCLE TO LOAD   
        foundOverBox = 1; //Change state of overbutotns 
        //boxOver[i] = true;//no sirve 
     } //CLOSE IF MOUSE OVER
    //To check if is over butotn or not, and change over state
    //  if (titleButton == "i") { 
    if(foundOverBox == 1){textBoxOver = true;
    }        
    if(foundOverBox == -1){textBoxOver = false;}    
    //  }//close if button info

   }
 }//CLOSE IF TO ON/OFF BOXES

}//4- CLOSE DISPLAY CHAPTER BOXES - - - - - - - - - - - - - - - - - - - - - - - - - - - - 









// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//5- DETAILS OVER ARTICLES BELLOW - on articlesDisplayBoxes()- - - - - - - - - - - - - - - 
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void articleDetailsOverVisualization( float _newPosBoxX, float _newPosBoxY, String _articleNumberText, int _articleWordsNum, String _articleTopics ) {  
  int boxW = 250;
  int boxH = 85;
  int boxPosX = 0;
  int moveX = -190;
  int dis = 2;
  noStroke();
  pushMatrix();
    //CHECK IF IS BEYOND WIDTH
    if (mouseX > width-boxW) {
      boxPosX = boxPosX+ moveX;
    } else {
      boxPosX = 0;
    } 
    translate(_newPosBoxX-15, _newPosBoxY-boxH-15);
    //TRIANGLE BELOW
    fill(50, 150); //COLOR BG colorTop[13]-200 
    triangle(10+dis, boxH+dis, 20+dis, boxH+dis, 15+dis, boxH+dis+10);
    //CAJA Y TRIANG DEBAJO
    fill(20, 150); //COLOR BG colorTop[13]-200 
    rect(boxPosX+dis, 0+dis, boxW+dis, boxH+dis);
    //BOX AND TRIANGE OVER
    fill(150, 220, 250); //COLOR TEXT 
    triangle(10, boxH, 20, boxH, 15, boxH+10);
    rect(boxPosX, 0, boxW, boxH);
      fill(colorsBgSectionsBlues[0]); //COLOR TEXT 
      rect(boxPosX, 0, boxW, 28);//COLOR OF TITLE
    //TEXT
    fill(250);//color text top
    textSize(12);
    textAlign(LEFT);
    text("Article nº "+_articleNumberText, boxPosX+6, 6, boxW-13, boxH-10 );
    textSize(10);
    fill(20);//color text box
    text("Words: "+_articleWordsNum, boxPosX+180, 8, boxW-15, boxH-1 );
    text("Topics: "+_articleTopics, boxPosX+6, 32, boxW-15, boxH-15 );
    text("- click to view text", boxPosX+6, 66, boxW-15, boxH-15 );
  popMatrix();
}//5- CLOSE DETAILS OVER ARTICLES BELLOW - on articlesDisplayBoxes() - - - - - - - - - - - - - - -  


//6- LABELS VISUALIZATIONS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void visualizationLabels(float _x, float _y){
  float posX = _x;
  float posY = _y+5;
  float moveDown = 15;
  float displaceX = gridUnit*5;

  float bW=10;
  float bH=8;
  float sepX = bW+5;
  float sepY = bH+ 3;
  color colText = color(140);
  color col1 = colorsBgSectionsReds[3];//Color chapters;
  color col2 = colorsBgSectionsBlues[1];
  color col3 = color(220, 250, 0);
  color col4 = color(0, 0, 200);

  noStroke();
  textSize(10); textLeading(11);
  textAlign(LEFT, TOP);

    //line
    fill(colorsBgSectionsBlues[4]);
    rect(posX-4, posY-5, gridUnit*11, 1);

  //TITLES
    fill(colText);
    text("Chapters", posX+displaceX+sepX, posY+sepY*0);
    fill(col1);
    rect(posX+displaceX, 2+posY+sepY*0, bW, bH);

    fill(colText);
    text("Articles", posX+displaceX+sepX, posY+sepY*1);
    fill(col2);
    rect(posX+displaceX, 2+posY+sepY*1, bW, bH);

    fill(colText);
    text("Cross References", posX+displaceX+sepX, posY+sepY*2);
    fill(cajasCrossReference);
    rect(posX+displaceX, 2+posY+sepY*2, bW, bH);

} 
//6- END LABELS VISUALIZATIONS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

void crossRefLine(int _x1, int _y1, int _x2, int _y2){
  int factor = 50;
  int x1 =_x1;
  int y1 =_y1;
  int x2 =_x2;
  int y2 =_y2;
  noFill();strokeWeight(0.1); 
  stroke(20, 250, 200); 
  bezier(x1, y1, 
//         x1+factor, y1-factor, 
//         x2-factor, y2+factor, 
         x1-factor, y1+factor, 
         x2+factor, y2-factor, 
         x2, y2
       );
}//CLOSE CROSS REFERENCE

