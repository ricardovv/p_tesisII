import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class interface02 extends PApplet {

int w = 1024;
int h = 768;
int gridSpacer = 20;
String filename = "test.csv";
Table rawData;

// PANELS
int panel = 2;

//DATA TO BE PARSED
int articleId;
String articleTitle;
String articleContent;


public void setup() {
  size(w, h);
  parseData();
}


public void draw() {
  background(20);
  rectMode(CORNER);

//LOADING PANELS
  if (panel == 1) {
    panelHome();
  }
  if (panel == 2) {
    myNavs();
    panelTopics();
  }
  if (panel == 3) {
    myNavs();
    panelHistory();
  }
  if (panel == 4) {
    myNavs();
    panelInfo();
    }

//  showText();
  textPressed();
}//CLOSE DRAW


public void parseData() {
  rawData = loadTable(filename);
  println(rawData.getRowCount() + " total rows in table"); 

  articleId = rawData.getInt(1, 0);
  articleTitle = rawData.getString(1, 1);
  articleContent = rawData.getString(1, 2);
}

public void showText() {
  textSize(10);
  fill(250);
  text("ID- " + articleId, 0, 20, 200, 50);
  text("TITLE- " + articleTitle, 0, 40, 200, 50);
  text("CONTENT- " + articleContent, 0, 60, 400, 400);
}

class Article {
//VARIABLES
int ID;  
String[] Article_Title = new String[158];  
String[] Article_SubTitle;  
int[] Article_Size;  
int Article_Tag;  
String Article_Contents;

//CONSTRUTOR
Article() {
}//CLOSE ARTICLE CONSTRUCTOR


//FUNCTIONS



}//CLOSE CLASS ARTICLE


//N O T E S
public void myNavs() {
  //grid();
  navBarTop();
  navBarLeft();
  textPressed();
}


public void navBarTop() {
  noStroke();
  fill(250, 100, 0);
  rectMode(CORNER);
  rect(gridSpacer*2, 0, w-gridSpacer*2, gridSpacer*2);
}//CLOSE navBarTop

public void navBarLeft() {
  //BG
  noStroke();
  fill(50, 50, 0);
  rectMode(CORNER);
  rect(0, 0, gridSpacer*2, h);

  //Button1
  buttonsLeft(0, 0, "C");
  //Button2
  buttonsLeft(0, 150, "H");
  //Button3
  buttonsLeft(0, 200, "T");
  //Button4
  buttonsLeft(0, h-40, "I");
}//CLOSE navBarLeft

public void panelTitles(String _title) {
  pushMatrix();
  fill(250, 200, 0);
  textSize(24);
  textAlign(LEFT);
  text(_title, 60, 28);
  popMatrix();
}

public void textPressed() {
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


public void buttonsLeft(int _x, int _y, String _t) {
  int x1 = _x;
  int x2 = _x + gridSpacer*2;
  int y1 = _y;
  int y2 = _y + gridSpacer*2;
  int found = -1;
  int onOver = 80;

  //check mouse over
  if (mouseX>_x && mouseX<x2 && mouseY>y1 && mouseY<y2 ) {//if the mouse position is inside the specific rect. 
    found = 1;//select that specific rect
  }

  if (found >=0) {//check if there is a specific rect available.
    if (mousePressed) {
      onOver = 150;
      //rect(x1, y1, x2, y2);//select the specific rect founded
      //test buttons for loading sections
      if (_t == "T") {
        rect(200, 200, 200, 200);
      }
    }
    else {
      onOver = 80;
    }    //close if mousePressed
  }//close if found

  rectMode(CORNERS);
  fill(onOver);
  rect(x1, y1, x2, y2);
  fill(200);
  textSize(20);  textAlign(CENTER);
  text(_t, 20 + _x, 26+_y);

}//END BUTTONS


public void grid() {
  for (int i=0; i<w; i++) {
    stroke(220);
    line(gridSpacer *i, 0, gridSpacer *i, h );
    for (int j=0; j<h; j++) {
      line(0, gridSpacer *j, w, gridSpacer *j );
    }
  }
}//CLOSE GRID


// hacer clases botones panel



public void panelHistory() {
  rectMode(CORNER);  //titles

  //Background
  int panelW = w - gridSpacer*2;
  int panelH = h - gridSpacer*2;
  fill(200, 0, 0);
  noStroke();

  rect(gridSpacer*2, gridSpacer*2, panelW, panelH);
  panelTitles("HISTORY RED");
}

//

public void panelHome(){
    rectMode(CORNER);  //titles

  //Background
  int panelW = w;
  int panelH = h;
  fill(20, 50, 10);
  noStroke();

 // rect(0, 0, panelW, panelH);
//TEXT
  fill(200);
  textAlign(CENTER);
  textSize(40);
  text("CONSTITUTION\nUnderstanding the text\nBla\nBla\nPRess 1, 2, 3, 4", panelW/2, panelH/2);

// TITLE ON TOP
panelTitles("HOME");

}
// hacer clases botones panel

public void panelInfo() {
    rectMode(CORNER);
  //titles

  //Background
  int panelW = w - gridSpacer*2;
  int panelH = h - gridSpacer*2;
  fill(0, 0, 200);
  noStroke();

  rect(gridSpacer*2, gridSpacer*2, panelW, panelH);

  //TEXT
  fill(200);
  textAlign(CENTER);
  textSize(40);
  text("INFORMATION ABOUT THE PROJECT\nBla\nBla", panelW/2, panelH/2);

  //TITLE ON TOP
  panelTitles("INFO AZUL");
}

// hacer clases botones panel

public void panelTopics() {
  rectMode(CORNER);
  int panelW = w/4 - gridSpacer*2;
  int panelH = h - gridSpacer*2;

  //A - MENU TOPICS
  for(int i=0; i<20; i++){
    int topicW = panelW;
    int topicH = panelH/20;
    fill(20, 30, 20);
    stroke(60);
    rect(gridSpacer*2 , gridSpacer*2 + topicH  * i, topicW, topicH );
    fill(120);
    textAlign(LEFT, TOP);
    textSize(14);
    text("Name of Category n " + i, gridSpacer*2 + 25, gridSpacer*2 + topicH  * i + 10);
  }//end for
//END MENU TOPICS

  //B - STRUCTURE VISUALIZATION
  int visualW = w - (gridSpacer*2 + panelW); 
  int visualH = h/2 - (gridSpacer*2); 
//CAJA
  fill(200);
  noStroke();
  rect(gridSpacer*2 + panelW, gridSpacer*2, visualW, visualH);

//ELEMENTS
  fill(200, 0, 0);
  noStroke();
  int visualPosX = gridSpacer*2 + panelW + 60;
  int visualPosY = gridSpacer*2 + visualH/2;
  int visualAreaW = visualW - 80;
  int visualAreaH = visualH - 20;

textSize(12);textAlign(RIGHT);
text("Chapters\nArticles", visualPosX-5, visualPosY-5);
  rect(visualPosX, visualPosY, visualAreaW, 2);//red line

  for(int i=0; i<22; i++){
    for(int j=0; j<10; j++){
      fill(200, 240, 240);
//      stroke(250);
      rect(visualPosX + 4 + 34 *i, 5+visualPosY +20 *j, 33, 18);//red line
//      text();
   }
  }


  //TEXT LOAD
  int textFrameW = visualW; 
  int textFrameH = panelH;
  fill(80);
  noStroke();  

  rect(gridSpacer*2 + panelW, gridSpacer + textFrameH/2, textFrameW, textFrameH/2 + gridSpacer);


  //titles
  panelTitles("TOPICS GREEN");

}//panelTopics ENDS

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--hide-stop", "interface02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
