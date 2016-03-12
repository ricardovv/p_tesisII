import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class myConstitution17 extends PApplet {

//VERSION CLEANED WITH TOPIC GRAPHISC INCORPORATED 
//what is textPressed?

//scrollArticleSelected THIS TAKE THE VALUE OF SELECTED ARTICLE TO LOAD IN:
PImage guia;


//PRINCIPAL OVERALL SETTINGS
int w = 1024;
int h = 768;
int gridUnit = 20;//basig nit of measure positions and sizes
int counter = 0;// counter to questionsHome
int section = 2;//initia panel to be loaded

// TOPICS ELEMENTS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
float visualPosX = gridUnit*14;//240;
float visualPosY = gridUnit*7;//160;

//TOPICS - CHAPTERS & ARTICLES DATA
String[] chaptersNumber = {"I","II","III","IV","V","VI","VII","VIII","IX","X","XI","XII","XIII","XIV","XV","TD"}; 
String[] chaptersTitle = {"Bases of Institutionally","Nationality and Citizenship","Constitutional Rights and Duties","Government","National Congress","Judicial Power","Public Ministry","Constitutional Tribunal","Electoral Justice","Office of the Comptroller General of the Republic","Armed Forces, Forces of Order and Public Security","Council of National Security","Central Bank","Government & Interior Administration of the State","Reform of the Constitution","Transitory Provisions"}; 
String[] chaptersDescriptions;
int[] chapterStartAt = {1,10,19,24,46+1,76+1,83+1,92+1,95+1,98+1,101+1,106+1,108+1,110+1,129+2,130+2};//addedone to compensate bis articles

int[] articlesLengthCategory = {3,1,2,1,2,2,2,3,3,3,2,2,2,2,1,3,2,3,19,2,3,2,3,2,3,4,3,3,4,3,1,6,2,2,2,1,3,3,3,1,4,3,3,3,2,3,1,1,2,2,1,3,6,5,5,2,1,4,3,2,4,3,1,5,4,4,3,3,2,2,3,3,1,3,2,2,3,4,5,2,3,2,2,4,3,3,3,3,2,2,1,1,4,9,3,4,3,1,3,4,2,3,1,2,3,2,3,3,1,3,2,3,2,4,2,4,2,1,4,3,2,2,2,2,3,1,3,2,3,3,3,1,3,1,2,1,1,1,3,2,1,1,1,3,4,3,1,1,1,1,1,1,1,2,3,1,2};
//int[] articlesCategoryHighligth = {1, 2, 3, 4, 5, 6, 7, 8, 8,8,11,12,13,14,15,15,15,15,19,20,21,15,23,24,15,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,15,59,60,61,62,63,64,65,66,67,68,69,70,71,72,15,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157};
//articlesCategoryHighligth
int[][] categ_ArticlesToHigh = {
  { 1, 8, 33, 64, 95 } , 
  { 6, 75, 81, 91, 109 } , 
  { 11, 21, 43, 64, 105 } ,
  { 16, 27, 48, 109, 120 } , 
  { 2, 22, 33, 84, 75 } , 
  { 16, 29, 78, 99, 129 } ,
  { 3, 43, 73, 84, 95 } , 
  { 6, 17, 28, 39, 40 } , 
  { 41, 52, 73, 94, 125 } ,
  { 26, 47, 58, 69, 120 } , 
  { 1, 22, 43, 54, 95 } ,
  { 36, 57, 85, 89, 106 } , 
  { 11, 22, 43, 44, 85 } , 
  { 6, 47, 68, 78, 94 } ,
  { 41, 72, 84, 104, 115 } , 
  { 26, 57, 78, 89, 108 } , 
  { 31, 52, 83, 94, 115 } ,
  { 26, 47, 78, 81, 99 } , 
  { 11, 22, 43, 94, 125 } ,
  { 7, 57, 61, 99, 109 } , 
};
int categ_ArticlesToHigh_colsLenght = categ_ArticlesToHigh.length;
int categ_ArticlesToHigh_rowsLenght = categ_ArticlesToHigh[0].length;

int[] articlesIdNumber = { 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157};
String[] articlesTitNumber = { 
  "1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","37 bis","38","39","40","41","42","43","44","45",
  "46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97",
  "98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","126 bis","127","128","129",
  "1st","2nd","3th","4th","5th","6th","7th","8th","9th","10th","11th","12th","13th","14th","15th","16th","17th","18th","19th","20th","21th","22th","23th","24th","25th","26th"
  /*"FIRST","SECOND","THIRTH","FOURTH","FIFTH","SIXTH","SEVENTH","EIGHT","NINTH","TENTH","ELEVENTH","TWELFTH","THIRTEENTH","FOURTEENTH","FIFTEENTH","SIXTEENTH","SEVENTEENTH","EIGHTEENTH","NINETEENTH","TWENTY","TWENTY FIRST","TWENTY SECOND","TWENTY THIRTH","TWENTY FOURTH","TWENTY FIFTH","TWENTY SIXTH" */
};

//TOPIC TEXT SCROLL - - - - - - - - 
String[] scrollArticlesAll;//CARGAR
String scrollArticlesAllJoined;//JOIN IN ONE STRING 
String[] scrollArticlesAllSplitted;//SPLIT IT BY A GIVEN SYMBOL 
int scrollArticleSelected;//int articleNumToScroll; //SPECIFIC NUMBER TO PASS
//CONTROLP5

ControlP5 cp5;
Textarea myTextScroll;

String[] scrollArticlesQuestions;//QUESTION FOR EACH ARTICLE, just example for each chapter
String[] scrollArticlesDefinitions;//QUESTION FOR EACH ARTICLE, just example for each chapter

int totalNumCharac;//COUNT NUMMBR OF CHARACTERS

int scrollW = 350;
int scrollH;
int scrollPosX = 320;
int scrollPosY = 180; 

int scrollTextSize = 12;
int charPerLine = 50; 
int artWords;
int artTextLenght;
int textScrollMapped;
float scrollBoxConstrain;
//TOPIC TEXT SCROLL CLOSE - - - - - - - - 

//ARTICLES TO PARSE DATA TO SCROLL TEXT
int[] articlesWordLength = {163,18,59,5,94,67,87,181,194,144,90,74,85,70,28,118,93,153,4209,84,219,82,104,84,140,287,152,178,326,162,34,818,84,61,61,26,104,111,103,49,252,173,171,210,93,105,49,37,61,80,38,238,790,547,569,79,47,279,154,81,469,178,31,532,267,449,104,234,93,68,175,196,24,131,76,77,197,257,575,68,217,64,64,277,127,163,180,136,62,97,21,23,435,1633,186,262,217,37,183,280,64,137,34,71,134,81,126,117,31,125,75,118,63,378,63,341,83,25,378,164,82,59,96,77,231,21,147,84,130,230,231,33,200,46,59,45,36,35,104,53,43,45,23,114,364,151,28,32,20,48,41,32,50,54,167,32,80};
int numberOfArticles = articlesIdNumber.length;
int[] articlesPosX = new int[articlesIdNumber.length];
int[] articlesPosY = new int[articlesIdNumber.length];
int[] articlesH   = new int[articlesIdNumber.length];

//Articles Boxes Values
float[] bH = new float[numberOfArticles];//stores articles box height values
float[] posY = new float[numberOfArticles+1];//initial articles box Y values of check ducplicated w articlesPosY[i]???
int articleBoxW = 42;//Articles box width, 35-45 optimal
int articleBoxHintial = 14;//Articles box height, 10-14 optimal
int countToRight = 0;//Counts initial chapter to mve right
float sep = 1.0f;//separator among articles and chapters
boolean articleBoxesActive = true; //to turn on and off the boxes while textscroll is up


//Boxes Chapters
float boxChapterH = gridUnit;
float boxChapterW = articleBoxW;
float boxChapterX;
float boxChapterY;
boolean[] boxOn = new boolean[numberOfArticles];//on and of articles boxes 
boolean[] boxOver = new boolean[numberOfArticles];//on and of articles boxes 

// TOPICS CATEGORIES - 25 so far - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
String[] topicsCategoryNames = {
"1Const. amendment procedure",
"2Birthright citizenship",
"3Campaign financing",
"4Restrictions on voting",
"5Head of state powers",
"6Emergency Provisions",
"7Attorney general",
"8On abinet/ministers",
"9Municipal government",
"10On Int. Human Rights Treaties",
"11Structure of the courts",
"12Approval of Gral. Legislation",
"13Organic laws",
"14Ref. to art/artists",
"15Ref. to fraternity or solidarity",
"16Central bank",
"17Military Service",
"18Children Rights guaranteed",
"19Right to appeal judicial...",
"20Environment Protection"
};
// CLOSE TOPICS ELEMENTS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



//TIMELINE - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//VARIABLES TIMELINE KEEP IT IN MAIN STRIUCTUE
PImage[] imgsTimeLine = new PImage[10];
int lado = 30;//dimensions box and timeline, borders?
int margenX = 100;// margin form the border
int tolerancia = 10;
int border = 3;
int barH =  80;// height ogf the bar top select yeatrs 
int posX = 100;
int displace = mouseX;//Displaces interactive bar to periods
//Positions Periods
int buttonPeriod1X = 0;
int buttonPeriod2X = 300;
int buttonPeriod3X = buttonPeriod2X + 275;
int buttonPeriod1W = 300;
int buttonPeriod2W = 275;
int buttonPeriod3W = 450;
int movingIndicatorPeriodX = buttonPeriod1X + 200;
//colors butotns historic periods
int timeLineColor1 = color(20, 40, 20);
int timeLineColor2 = color(70, 40, 0);
int timeLineColor3 = color(20, 40, 80);
//COLOR AREA SELECTOR
int timeLineAreaSelectorCurrentColor = timeLineColor1;





//GRAPHIC ELEMENTS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PShape graphics_logo;
PShape graphics_band;
PShape graphics_star;

//COLORS Orange home, BLUE HOME, CELESTE TOPICS, CELESTE HISTORY 
//Naranja, LAdrillo, COnnchevino
int[] colorsBgSectionsReds = { 0xffE65F46, 0xffBE2D28, 0xff821950, 0xffE84921 };
//CELESTE, Azul, Morado
int[] colorsBgSectionsBlues = { 0xff199BCD, 0xff146496, 0xff02232C, 0xff8BCADB, 0xff063B4D, 0xff062B39 };
int[] colorsBgButtonsTop = { 0xff146496, 0xff199BCD, 0xff3C286E  };
int[] colorsArticleBoxesBlues = { 0xff8BCADB, 0xff199BCD, 0xff146496, 0xff02232C  };
//Colot Font,  
int[] colorsFontTitles = {0xffFFFFFF };
int[] colorsFontButtons = {0xffFFFFFF };
int[] colorsFontBodytext = {0xffFFFFFF };

//TYPOS
PFont fontTitles;
PFont fontButtonsHome;
PFont fontBodyText;

//DATA - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
String filename = "test.csv";
Table rawData;

//TEXTSCROLL UP
//boolean articleTextPanelUp = false;//Text panel for articles buttons
//float articleTextPanelY;// initial position

//PANEL TEXTSCROLL UP
boolean  textBoxOver = false;//check overfor circle button on article scrolltext
boolean  textBoxUp = false;
float    textBoxPosY = 800;
//PANEL INFO UP
boolean  panelInfoOver = false;//check overfor circle button on panelInfo
boolean  panelInfoUp = false;
float    panelInfoY = 800; //INITIAL VALUE POS INFO 

//TEXT BOX ELEMENTS - INFO & TOPICS
ButCircle butCircleCloseTextInfo, butCircleCloseTextTopic;

//DATA TO BE PARSED
String[] panelInfo;//PANEL INFO TEXT CONTENT
int articleId;
String articleTitle;
String articleContent;





public void setup() {
  size(w, h);

  background(colorsBgSectionsBlues[0]);//BG PALE BLUE ALL

  //TOPICS
  //FIll array starting state
  for(int i=0;i<numberOfArticles;i++){
    boxOn[i] = false;//init topic categories button off
    boxOver[i] = false;//init topic categories button off
  }
  checkCategory();//BEfore in draw...
  // - - - articleTextPanelY = 800;//initial value text each article. 
  //Load chapters description from external file
  chaptersDescriptions =  loadStrings("chapters/chaptersDescriptions.txt");

  //TEXT BOX ELEMENTS - INFO & TOPICS  
  textBoxUp = false; 
  butCircleCloseTextInfo = new ButCircle(940, 160, 50, "close");
  //buttons text articles
  butCircleCloseTextTopic = new ButCircle(940, 120, 50, "close");

  //TOPIC SCROLL TEXT
  scrollArticlesQuestions = loadStrings("articles/articlesQuestions.txt");
  scrollArticlesDefinitions = loadStrings("articles/articlesDefinitions.txt");
  scrollTextIntial();

  //CONTROLP%
  cp5 = new ControlP5(this); 
  myTextScroll = cp5.addTextarea("txt")
//                .setPosition(50,50)
                .setSize(380,570)
                .setFont(createFont("arial",12))
                .setLineHeight(14)
                .setColor(color(200))
                .setColorBackground(color(20,100))
                .setColorForeground(color(255,100));
                ;
//  myTextScroll.setPosition(50,50);
//  myTextScroll.setText(scrollArticlesAllJoined);
  //TOPIC TEXT SCROLL CLOSE - - - - - - - - 

  //DATA
  panelInfo =  loadStrings("panelInfo.txt");
  //panelArticleDetailTest =  loadStrings("panelArticleDetail.txt");
  parseData();
  
  //GRAPHICS - Fonts & Logos
  fontTitles = loadFont("Futura-Medium-48.vlw");
  fontButtonsHome = loadFont("Georgia-Italic-48.vlw");
  //fontBodyText = loadFont("Georgia-48.vlw");
  fontBodyText = createFont("sans", 40);
  graphics_logo =  loadShape("graphics/graphic_logo.svg");
  graphics_band =  loadShape("graphics/graphic_band.svg");
  graphics_star =  loadShape("graphics/graphic_star.svg");
  smooth();
  ///  noCursor();
  guia = loadImage("img/guia.jpg");

//TINELINE
  //IMAGES TIMELINE
  for ( int i = 0; i < imgsTimeLine.length; i++ ) {
    imgsTimeLine[i] = loadImage("imgTimeLine/"+i+".jpg" );
    println("- " + imgsTimeLine[i]);
  }




//String[] scrollArticlesAllSplitted;
//String number = "Article 1 - %nPersons \nare born \\nfree and equal in dignity and rights.#The family is the fundamental nucleus of society.#The State recognizes and defends the intermediate groups through which society organizes and structures itself and guarantees them the adequate autonomy to fulfill their own specific objectives.#The State is at the service of the human person and its goal is to promote the common good, to which effect it must contribute to create the social conditions which permit each and every one of those composing the national community the greatest spiritual and material fulfillment possible, with full respect for the rights and guarantees that this Constitution establishes.*";


/*// / / /  TO SEPARATE LINES
String number = scrollArticlesAllSplitted[0];
String[] number_array = number.split("-|%n");
for(String s: number_array)
System.out.println(s.replace("\\n",""));
}
*/

// / / /  TO SEPARATE LINES
String number = scrollArticlesAllSplitted[0];
String[] number_array = number.split("-|%n");
for(String s: number_array)
System.out.println(s.replace("\\n",""));




}//CLOSE SETIUP





public void draw() {
  background(colorsBgSectionsBlues[2]);//BG PALE BLUE ALL
  rectMode(CORNER);
  //LOADING PANELS

  if (section == 1) {
    sectionHome();
  }
  if (section == 2) {
    questions(gridUnit*14, gridUnit*1, 2);
    panelTopics();
    myNavs();
    panelTitles("TOPICS");
      //QUESITONS AT THE TOP
  }
  if (section == 3) {
    questions(gridUnit*14, gridUnit*1, 3);
    sectionHistory(100);
    myNavs();
    panelTitles("HISTORY");
  }
  panelInfo(panelInfoY);//INITIAL POS INFO 
  //  showText();

    // BG IMage reference
  if (keyPressed == true) {
//    tint(255, 150);
  //  image(guia, 0, 0);
  }
  
  myTextScroll.setPosition(320,textBoxPosY+180);
  myTextScroll.setText(scrollArticlesAllSplitted[scrollArticleSelected]);



}//CLOSE DRAW



public void parseData() {
  rawData = loadTable(filename);
 // println(rawData.getRowCount() + " total rows in table"); 
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


public void myText(int _x, int _y, int _textSize, String _textAlign, int _textColor, String _textContent ) {
  pushMatrix();
  fill(_textColor);
  textAlign(CENTER);
  textSize(_textSize);
  text(_textContent, 0+_x, 0+_y);
  popMatrix();
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
//1- BUTOTN CIRCLE CLASS
//2- MAIN NAV BUTTONS AT THE TOP  
//3- BUTTONS CIRCLE CLOSE PANEL & TEXT SCROLL - - - - - - - - - - - - - - - - - - - - - - - - 
//4- TEXT BOX IN INFO SO FAR - - - - - - - - - - - - - - - - - - - - - - - - 
  
  
//1- BUTOTN CIRCLE CLASS - - - - - - - - - - - - - - - - - - - - - - - - 
//TO CLOSE AND OPEN TEXT BOXES IN TOPICS AND FOR INFO
class ButCircle {
  String text;
  float tw; 
  int circX, circY;  // Ellipse Button Pos
  int circSize;// Ellipse diameter
  int botColorNormal;
  int botColorOver;
  int botColorPressed;
  int botCurrentColor;
  boolean botOver;
int newY;
  //CONSTUCTOR
  ButCircle(int _x, int _y, int _size, String _t) {
    text = _t;
    tw = textWidth(text);
    circX = _x;
    circY = _y;
    circSize = _size + PApplet.parseInt(tw/2); 
    botColorNormal = color(30);
    botColorOver = color(100);
    botColorPressed = color(200, 0, 0);
    botCurrentColor = color(0);
    botOver = false;
  }//COONSTRUCTOR ENDS

  //METHODS
  //CHECK IF IS OVER OR NOT
  public void display(float _y, String _buttonName) {
    String buttonName = _buttonName; 
    newY = PApplet.parseInt(_y);//to track changes in Y position 
    
    //update 
    if ( overCircle(circX, circY+newY, circSize) ) {
      botOver = true;
      //FOR PANEL INFO - CHANGE OVER STATE
      if (panelInfoOver == true) { // load INFO  
        panelInfoOver = false;//check overfor circle button on article scrolltext
      }//close if button info
      else if (panelInfoOver == false) {
        panelInfoOver = true;//check overfor circle button on article scrolltext
      }

      //FOR TEXT SCROLL - CHANGE OVER STATE
      if (textBoxOver == true) { // load INFO  
        textBoxOver = false;//check overfor circle button on article scrolltext
      }//close if button info
      else if (textBoxOver == false) {
        textBoxOver = true;//check overfor circle button on article scrolltext
      }







    } else {
      botOver = false;
    }//end update 


      //change color button and state
    if (botOver) {
      if (mousePressed == true) {         
        botCurrentColor = botColorPressed;
      } else {//select button
        botCurrentColor = botColorOver;
      }//mousePressed end
    }//if (botOver) END
    else { 
      botCurrentColor = botColorNormal;
   }
   
   //ELLIPSE BUTTON
   fill(botCurrentColor); 
   noStroke();
   ellipseMode(CENTER);
   ellipse(circX, circY+newY, circSize, circSize);//newY to track Y new posiiton when change true or false
   //TEXT BUTTON
   fill(250);
   textAlign(CENTER); 
   textSize(14);
   text(text, circX, circY+4+newY);
  }//DISPLAY END  

  //CHECK IF IS INSIDE
  public boolean overCircle(int x, int y, int diameter) {  
    float disX = x - mouseX;
    float disY = y - mouseY + newY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } 
    else {
      return false;
    }
  }//overCircle

}//ButCircle CLASS CLOSE
//1- CLOSE BUTOTN CIRCLE CLASS - - - - - - - - - - - - - - - - - - - - - - - - 





//2- MAIN NAV BUTTONS AT THE TOP - - - - - - - - - - - - - - - - - - - - - - - - 
public void buttonsTop(int _x, int _y, String _t) {
  int x1 = _x;
  int x2 = _x + gridUnit*2;
  int y1 = _y;
  int y2 = _y + gridUnit*2;
  int found = -1;
  int onOver = colorsBgButtonsTop[0];
  String titleButton = _t;
  //check mouse over
  if (mouseX>_x && mouseX<x2 && mouseY>y1 && mouseY<y2 ) {//if the mouse position is inside the specific rect. 
    found = 1;//select that specific rect
  } else{found = -1;}

  //FOR PANEL INFO - CHANGE OVER STATE - TO panelInfoUp in mouseReleased - Also in the text panel as button circle
  if (titleButton == "i") { 
    //For onOver 
    if(found == 1){panelInfoUp = true;}      
    if(found == -1){panelInfoUp = false;}
    //For void onRelease 
//    if(found == 1){panelInfoOver = true;}      
 //   if(found == -1){panelInfoOver = false;} 
  }//close if button info

  
  if (found >=0) {//check if there is a specific rect available.    
    if (mousePressed) {
      onOver = colorsBgButtonsTop[2];
      //rect(x1, y1, x2, y2);//select the specific rect founded
      //test buttons to load HOME
      if (_t == "C") { // load HOME
        section = 1;
        panelInfoUp = false;//close info panel if is open
      }
      if (_t == "T") { // load TOPICS
        //TITLES AT THE TOP
        section = 2;
        panelInfoUp = false;//close info panel if is open
      }
      if (_t == "H") { // load HISTORY
        section = 3;
        panelInfoUp = false;//close info panel if is open
      }      
    }//close if (mousePressed)
    else {
      onOver = colorsBgButtonsTop[1];;
    }//close if mousePressed
  

}//close if found 
  
  rectMode(CORNERS);
  fill(onOver);
  rect(x1, y1, x2-1, y2);
  fill(255);
  textSize(20);  
  textAlign(CENTER);
  //puts logo instead a letter in button to home
  if (_t == "C") {
    shape(graphics_logo, 9+_x, 5+_y, 22, 30);
  }
  else {
    text(_t, 20+_x, 27+_y);
  }
}//2- LOSE MAIN NAV BUTTONS AT THE TOP - - - - - - - - - - - - - - - - - - - - - - - - 





//3- BUTTONS CIRCLE CLOSE PANEL & TEXT SCROLL - - - - - - - - - - - - - - - - - - - - - - - - 
public void mouseReleased() {   //PANEL INFO
/*  
  //PANEL INFO BUTTON - button in buttons top and paneltextScroll
 if(panelInfoOver == true){ //chek if buton is over
     if(panelInfoUp == true){  
          panelInfoUp = false;
      }else if(panelInfoUp == false) {
          panelInfoUp = true;
      }
  } //PANEL INFO BUTTON CLOSE
*/
  //PANEL INFO BUTTON - button in buttons top and paneltextScroll
 if(textBoxOver == true){ //chek if buton is over

     if(textBoxUp == true){  
          textBoxUp = false;//CLOSE SCROLL
          articleBoxesActive = true;//ON ARTICLE BOXES
      }  
      else if(textBoxUp == false) {
          textBoxUp = true;//UP SCROLL
          articleBoxesActive = false;//OFF ARTICLE BOXES

      }

  } //PANEL INFO BUTTON CLOSE
  

}//3- CLOSE BUTTONS CIRCLE CLOSE PANEL & TEXT SCROLL - - - - - - - - - - - - - - - - - - - - - - - - 




public void myNavs() {
  //grid();
//BART TOP TO HIDE TEXT SCROLL
  fill(colorsBgSectionsBlues[0], 0);//color bg orange
  rect(0, 0, w, gridUnit*2);//color bg orange
  navBarTop();
  }


//MAIN NAVIGATION TOP - - - - - - - - - - - - - - - - - - - - - - - - - 
public void navBarTop() {//Bacground of nav bar top in sectionsx`
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
public void panelTitles(String _title) {
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
public void questions (int _x, int _y, int _section) {
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
    "Civil rights, Decentralization, Education, Constitutional guarantees, Constitutional process \nArticles n\u00ba: 23, 57, 86", 
    "Environment, Parliamentary rules, Politics and power, Privacy, Intellectual property \nArticles n\u00ba: 4, 19, 116", 
    "Natural resources, Health, Job, Transparency and probity, International treaties  \nArticles n\u00ba: 12, 71, 65", 
};

  String[] questionsHistory = { 
    "Do you know that the Constitution was written by just 7 people?", 
    "Do you know that the Constitution was voted without official voter register at all?", 
    "Do you know that the Constitution was written during Pinochet's Dictatorship?" 
  };
  String[] answersHistory = { 
    "Topic A, Topic A, Topic B, Topic C.  &  Articles n\u00ba: 23, 57, 86", 
    "Topic A, Topic A, Topic B, Topic C.  &  Articles n\u00ba: 23, 57, 86", 
    "Topic A, Topic A, Topic B, Topic C.  &  Articles n\u00ba: 23, 57, 86", 
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
    fill(0xffB9EFFF);//BG Quesitons Home
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




//ALL FUNCITONS OF TIMELINE IN A SINGLE FUNCTION
public void sectionHistory(int _posX) {
  //TIMELINE MAIN
  timeLine();
  //Buttons to select period to see in timeline
  buttonsPeriods(buttonPeriod1X, height-120, buttonPeriod1W, "Parlamentary Democracy (1810-1973)", timeLineColor1 );
  buttonsPeriods(buttonPeriod2X, height-120, buttonPeriod2W, "Dictatorship (1973-1991)", timeLineColor2 );
  buttonsPeriods(buttonPeriod3X, height-120, buttonPeriod3W, "Transition to Democracy (1991-2010)", timeLineColor3 );
  //BAR 1 - CONSTITUTION 1925 
  drawArrow(413, height-70, 5, 0);
  constitutionsPeriodColorBars("CONSTITUTION OF 1925", timeLineColor1, 0, height-80, 300);
  //BAR 2 - CONSTITUTION 1980 
  //  drawArrow(427, height-60, 5, 180);  
  constitutionsPeriodColorBars("   CONSTITUTION OF 1980   ", timeLineColor3, 300, height-80, 725);

  // LINE 1973
  stroke(250, 50, 0);
  line(300, height-120, 300, height-91 );
  noStroke();  //color(50, 30, 0)

  // LINE 1980
  stroke(150, 150, 0);
  line(420, height-80, 420, height-60 );
  noStroke();  //color(50, 30, 0)
  //YEARS AT THE BOTTOM 

  yearsConstitution(100, height-10);
} //CLOSE TimeLineMain(int _posX)



//BUTTONS HISTORIC PERIODS 
public void buttonsPeriods(int _x, int _y, int _w, String _t, int _colorBg) {
  //fill(255, 255, 0);//rect(_x, 70, tW, 10);
  int x1 = _x;
  int x2 = _x + _w;
  int y1 = _y;
  int y2 = _y + 30;//Height of buttons
  int w = _w/2+x1;
  int foundBottonHome = -1;
  int colorBg = _colorBg;
  int onOver = color(255, 255, 150);

  //check mouse over
  if (mouseX>x1 && mouseX<x2 && mouseY>y1 && mouseY<y2 ) {//if the mouse position is inside the specific rect. 
    foundBottonHome = 1;//select that specific rect
    onOver = color(250); //OVER
  } 
  else {
    onOver = color(170);//Hold button color
  }    //close if mousePressed
  //check if there is a specific rect available.
  if (foundBottonHome >=0) {
    if (mousePressed) {
      onOver = color(255, 255, 0);

      //to change bg selector colors and move indicator of section
      if (_t == "Parlamentary Democracy (1810-1973)") {
        timeLineAreaSelectorCurrentColor = timeLineColor1;
        movingIndicatorPeriodX = buttonPeriod1X + buttonPeriod1W/2;
        displace = 0;//moves bar to posX Period 1
      }
      if (_t == "Dictatorship (1973-1991)") {
        timeLineAreaSelectorCurrentColor = timeLineColor2;
        movingIndicatorPeriodX = buttonPeriod2X + buttonPeriod2W/2;
        displace = 250;//moves bar to posX Period 2
      }
      if (_t == "Transition to Democracy (1991-2010)") {
        timeLineAreaSelectorCurrentColor = timeLineColor3;
        movingIndicatorPeriodX = buttonPeriod3X + buttonPeriod3W/2;
        displace = 1000;//moves bar to posX Period 3
      }
    }//COSE MOUSE PRESSED
    //} else {      //      onOver = 0;    //}    //close if mousePressed
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
  text(_t, w, y1 + 18);//place text in the middle of the button
  rectMode(CORNER);
  popMatrix();
}//END BUTTONS 




//HISTORIC CONSTITUTION PERIODS
public void constitutionsPeriodColorBars(String _title, int _color, int _posX, int _posY, int w) {
  int h = 20;
  int posX = _posX;

  //DRAW BLOCKS
  pushMatrix();
  rectMode(CORNER);
  //LINEA
  stroke(100);
  fill(200);
  rect(_posX, _posY+9, w, 1);

  //BGCOLOR TEXTOS
  float tW = textWidth(_title);
  rectMode(CENTER);
  fill(0);
  rect(_posX+w/2, _posY+10, tW, h);
  fill(190);
  textAlign(CENTER);
  textSize(10);
  text(_title, _posX+w/2, _posY+14);
  popMatrix();
}//CLOSE HISTORIC CONSTITUTION PERIODS FUNCTION 



//
public void drawArrow(int _x, int _y, int _w, float _rot) {
  pushMatrix();
  stroke(130);
  translate(_x, _y);
  rotate(radians(_rot));
  line(0, 0, _w, 0);
  line(_w, 0, _w - 6, -6);
  line(_w, 0, _w - 6, 6);
  noStroke();
  popMatrix();
}



//YEARS
public void yearsConstitution(int _posX, int _posY) {
  int posX = _posX-15;
  int posY = _posY;
  int w1 = 435;
  int w2 = 390;
  int h = 30;
  //all numbers 1925 to 2014 at the bottom  
  for (int i=1; i<57; i+=3) {
    pushMatrix();
    float factor = 15.25f;
    fill(120);
    textSize(10);
    textAlign(CENTER);
    text(1959+i, 85 + factor *i, posY-20);
    stroke(140);
    line(posX + factor *i, posY-33, posX + factor *i, posY-40);
    noStroke();
    popMatrix();
  }//end
}//END YEARS FUNCTION


//void panelHome() {
public void sectionHome() {
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


public void buttonsHome(int _x, int _y, String _t) {
  float tW = textWidth(_t);
 
  //fill(255, 255, 0);
  //rect(_x, 70, tW, 10);

  int x1 = _x;
  int x2 = _x + PApplet.parseInt(tW);
  int y1 = _y;
  int y2 = _y + 50;
  int foundBottonHome = -1;
  int onOver = color(255, 255, 150);

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



// hacer clases botones panel

//TEXT BOX FOR INFO
public void panelInfo(float _infoY) {
  int infoW = w - gridUnit*4;
  int infoH = h - gridUnit*3;
  float infoYAll = _infoY;
  rectMode(CORNER);

  //sans font w createFont
  textFont(fontBodyText);

  pushMatrix();
  translate(0, infoYAll);
  //CAJA 1
  fill(0, 150);
  noStroke();  
  rect(0, gridUnit*2, w, h);//position rect BG 

  //CAJA BG TRANSPARENT
  int infoX = gridUnit*2;
  int infoY = gridUnit*4;
  fill(colorsBgSectionsBlues[1]);//COLOR BG TEXT
  noStroke();  
  rect(infoX, infoY, infoW, infoH-gridUnit*3 );

  //BG IMAGE OR DESIGN?
  fill(0, 0, 250);
  noStroke();  
  //    rect(infoX, infoY, infoW, gridUnit*6);

  //TEXT
  int textPosX = infoX*10;
  int textPosY = infoY + gridUnit*2;//position of texts
  int textW = 500;
  smooth();
  fill(200);
  stroke(200);
  textFont(fontBodyText);
  textAlign(LEFT);
  textSize(20);
  text("ABOUT THE PROJECT\n", textPosX, textPosY-10, textW, 400);  
  textSize(14);
  text("MOTIVATION\n" + panelInfo[0], textPosX, textPosY+gridUnit*3, textW, 400);
  text("CREDITS & SOURCES\n" + panelInfo[1], textPosX, textPosY+gridUnit*9, textW, 400);
  text("ACKNOWLEDGMENTS\n" + panelInfo[2], textPosX, textPosY+gridUnit*15, textW, 400);
  text(panelInfo[3], textPosX, textPosY+gridUnit*25, textW, 400);

  shape(graphics_logo, 130, textPosY, 180, 240);


  if (panelInfoUp) {
    panelInfoY = lerp(panelInfoY, 0, .12f);
  }
  else {
    panelInfoY = lerp(panelInfoY, 800, .12f);
  }
  popMatrix();
  //TEXT PANET UP AND DOWN
  //butCircleCloseTextInfo.display(panelInfoY, "info");
}

// revisar panelW, lo necesito? 
// crear array boolean para on/of boxes 

public void panelTopics() {
  int panelW = gridUnit*11;//width bg panel topics
  int panelH = h - gridUnit*2;
  //Topic Panel position 
  int menuX = 5;//position from left
  int menuY = gridUnit*6;//position from top
  //IMPORTANT
  rectMode(CORNER);
  textFont(fontBodyText);  //sans font w createFont

  //QUESITONS AT THE TOP
//  questions(gridUnit*14, -10, 2);
  //VISUALIZATION STRUCTURE
  menuTopics(menuX, menuY);
  //TEXT PANEL WITH CONTENTS
  //FROM FORLOOPDISTRIBUTION08
  visualizationLabels( gridUnit*38, gridUnit*37 );
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
public void menuTopics(int _x, int _y){
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
public void articlesButtonsCategories(int _x, int _y, int _w, int _h, int _i, String _t, int _n) {
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
public void  checkCategory() {
//  posY[0] = 0;//starting at...
  for(int i=0; i<articlesLengthCategory.length; i++){
    fill(200);
    if(articlesLengthCategory[i]==1){ bH[i]  = articleBoxHintial*1.0f; }//category 1 & 2 the same
    if(articlesLengthCategory[i]==2){ bH[i]  = articleBoxHintial*1.0f; }
    if(articlesLengthCategory[i]==3){ bH[i]  = articleBoxHintial*1.5f; }
    if(articlesLengthCategory[i]==4){ bH[i]  = articleBoxHintial*2.0f; }//4 & 5 equals
    if(articlesLengthCategory[i]==5){ bH[i]  = articleBoxHintial*2.0f; }
    if(articlesLengthCategory[i]==6){ bH[i]  = articleBoxHintial*2.5f; }
    if(articlesLengthCategory[i]==7){ bH[i]  = articleBoxHintial*3.0f; }// from here 1 point less
    if(articlesLengthCategory[i]==8){ bH[i]  = articleBoxHintial*3.0f; }
    if(articlesLengthCategory[i]==9){ bH[i]  = articleBoxHintial*3.5f; }
    if(articlesLengthCategory[i]==10){ bH[i] = articleBoxHintial*4.0f; }
    if(articlesLengthCategory[i]==11){ bH[i] = articleBoxHintial*4.5f; }
    if(articlesLengthCategory[i]==12){ bH[i] = articleBoxHintial*6.0f; }
    if(articlesLengthCategory[i]==13){ bH[i] = articleBoxHintial*6.5f; }
    if(articlesLengthCategory[i]==14){ bH[i] = articleBoxHintial*7.0f; }
    if(articlesLengthCategory[i]==15){ bH[i] = articleBoxHintial*7.5f; }
    if(articlesLengthCategory[i]==16){ bH[i] = articleBoxHintial*8.0f; }
    if(articlesLengthCategory[i]==17){ bH[i] = articleBoxHintial*8.5f; }
    if(articlesLengthCategory[i]==18){ bH[i] = articleBoxHintial*9.0f; }
    if(articlesLengthCategory[i]==19){ bH[i] = articleBoxHintial*9.5f; }
  }
}//CLOSE 1- CHECK CATEGORY HEIGHT OR WIDTHS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


//2- DISPLAY CHAPTERS TOP - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
public void chaptersTopDisplay(){
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
public void chapterDetailsOverVisualization( float _newPosBoxX, float _newPosBoxY, String _chapterTitle, String _chapterDescription ) {  
  int boxW = 320;
  int boxH = 70;
  int boxPosX = -boxW/2;
  int dis = 4;
  noStroke();

//To avoid the details go out of screen
  if(mouseX>w-180){
    boxPosX = boxPosX-100;
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




//4- DISPLAY ARTICLES  - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
public void articlesDisplayBoxes(){
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
    articlesPosX[i] = PApplet.parseInt(visualPosX + articleBoxW*countToRight);
    articlesPosY[i] = PApplet.parseInt(visualPosY + posY[i] + sep);


    //DRAW ELLIPSE BOXES
    if(boxOn[i] == false){//change state from category button
      fill(colorsBgSectionsBlues[1]);// 190 color boxes still
    }else{
    //selected box
    fill(0xff34A508);
      //      fill(colorsBgSectionsReds[0]);
    }
    //DRAW BOXES    
    rect( articlesPosX[i] ,articlesPosY[i] ,articleBoxW-sep*5, bH[i]-sep );

    //DRAW TITLES TEXT 
    textSize(8);textAlign(LEFT);fill(250);
    text(articlesTitNumber[i], 2+articlesPosX[i], articlesPosY[i]+8);

    //DRAW  CROSS REFERENCES 
    fill(colorsBgSectionsBlues[0]); 
    int crossPointX = articlesPosX[i]+articleBoxW-16;     int crossPointY = articlesPosY[i]-0;
    int crossSz = 10;
    rectMode(CORNER);    rect( crossPointX, articlesPosY[i] , crossSz, crossSz ); 
     
    //DRAW REFERENCE LINES //TO HEAVY HERE
    if(  (mouseX>crossPointX && mouseX<crossPointX+crossSz)   &&     (mouseY>crossPointY && mouseY<crossPointY+crossSz)    ){
    stroke(0xffB3B909); //smooth();
    for(int j=0; j<140; j+=10){
      myOrigin = articlesIdNumber[i];//Originn of lines cross reference.
      //crossRefLine(articlesPosX[myOrigin]+articleBoxW-10 ,articlesPosY[myOrigin]+5,     articlesPosX[j]+articleBoxW-10 ,articlesPosY[j]+5    );
      line(articlesPosX[myOrigin-1]+articleBoxW-10 ,articlesPosY[myOrigin-1]+5,     articlesPosX[j]+articleBoxW-10 ,articlesPosY[j]+5    );
    }
    noStroke();
    }//CLOSE CROSS REFERENCE



  }//CLOSE FOR 1- ASSIGN VALUES



 //TO ON/OFF BOXES
 if(articleBoxesActive){
 //SHOW DETAILS ON ROLLOVERS
   for(int i=0; i<articlesLengthCategory.length; i++){
     if (  (mouseX>articlesPosX[i] && mouseX<articlesPosX[i]+articleBoxW-sep*5-10)  &&  (mouseY>articlesPosY[i] && mouseY<articlesPosY[i]+bH[i]-sep)  ) {
        articleDetailsOverVisualization( mouseX, mouseY, articlesTitNumber[i], articlesWordLength[i], "Civil rights, Constitutional guarantees, Environment, Politics and power, Privacy" );
        scrollArticleSelected = i; //SELECT NUMBER OF ARTOCLE TO LOAD   
        foundOverBox = 1; //Change state of overbutotns 
        //boxOver[i] = true;//no sirve 
        //TEST IF IS READING THE ARTICLE NUMBER
        //textSize(40);fill(200);
        //text("textBoxOver; "+foundOverBox, 500, 90);
     } //CLOSE IF MOUSE OVER
   //TEST IF IS OVER
   //textSize(40);fill(200);
   //text("textBoxOver; "+foundOverBox, 500, 90);  
    //To check if is over butotn or not, and change over state
    //  if (titleButton == "i") { 
    if(foundOverBox == 1){textBoxOver = true;
    }        
    if(foundOverBox == -1){textBoxOver = false;}    
    //  }//close if button info

   }
 }//CLOSE IF TO ON/OFF BOXES

}//4- CLOSE DISPLAY CHAPTER BOXES - - - - - - - - - - - - - - - - - - - - - - - - - - - - 





//5- DETAILS OVER ARTICLES BELLOW - on articlesDisplayBoxes()- - - - - - - - - - - - - - - 
public void articleDetailsOverVisualization( float _newPosBoxX, float _newPosBoxY, String _articleNumberText, int _articleWordsNum, String _articleTopics ) {  
  int boxW = 250;
  int boxH = 85;
  int boxPosX = 0;
  int moveX = -150;
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
    text("Article n\u00ba "+_articleNumberText, boxPosX+6, 6, boxW-13, boxH-10 );
    textSize(10);
    fill(20);//color text box
    text("Words: "+_articleWordsNum, boxPosX+180, 8, boxW-15, boxH-1 );
    text("Topics: "+_articleTopics, boxPosX+6, 32, boxW-15, boxH-15 );
    text("- click to view text", boxPosX+6, 66, boxW-15, boxH-15 );
  popMatrix();
}//5- CLOSE DETAILS OVER ARTICLES BELLOW - on articlesDisplayBoxes() - - - - - - - - - - - - - - -  


//6- LABELS VISUALIZATIONS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
public void visualizationLabels(float _x, float _y){
  float posX = _x;
  float posY = _y+10;
  float moveDown = 15;
  float bW=10;
  float bH=10;
  float sepX = bW+5;
  float sepY = bH+ 5;
  int colText = color(140);
  int col1 = colorsBgSectionsReds[3];//Color chapters;
  int col2 = colorsBgSectionsBlues[1];
  int col3 = colorsBgSectionsBlues[0];
  int col4 = color(0, 0, 200);


  noStroke();
  textSize(10); textLeading(11);
  textAlign(LEFT, TOP);

    //line
    fill(colorsBgSectionsBlues[1]);
    rect(gridUnit, posY-5, w-gridUnit*2, 1);

  //TITLES
    fill(colText);
    text("Chapters", posX+sepX, posY+sepY*0);
    fill(col1);
    rect(posX, 1+posY+sepY*0, bW, bH);

    fill(colText);
    text("Articles", posX+80+sepX, posY+sepY*0);
    fill(col2);
    rect(posX+80, 1+posY+sepY*0, bW, bH);

    fill(colText);
    text("Cross References", posX+140+sepX, posY+sepY*0);
    fill(col3);
    rect(posX+140, 1+posY+sepY*0, bW, bH);
} 
//6- END LABELS VISUALIZATIONS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



public void crossRefLine(int _x1, int _y1, int _x2, int _y2){
  int factor = 50;
  int x1 =_x1;
  int y1 =_y1;
  int x2 =_x2;
  int y2 =_y2;
  noFill();strokeWeight(0.1f);smooth();
  stroke(20, 250, 200); 
  bezier(x1, y1, 
//         x1+factor, y1-factor, 
//         x2-factor, y2+factor, 
         x1-factor, y1+factor, 
         x2+factor, y2-factor, 
         x2, y2
       );
}//CLOSE CROSS REFERENCE

//8-PANEL THAT UPS WITH TEXT WHEN CALLED - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
//2- //TOPIC TEXT SCROLL CLOSE - - - - - - - - 

//8-PANEL THAT UPS WITH TEXT WHEN CALLED - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
public void textContentPanel(float _textY) {
  int infoW = w - gridUnit*4;
  int infoH = h - gridUnit*3;
  float infoYAll = _textY;
  int infoX = gridUnit*2;
  int infoY = gridUnit*4;
  //TEXT
  int textPosX = infoX*2;//position of text box
  int textPosY = infoY+gridUnit*1;//position of text box
  int textW = 550;

  rectMode(CORNER);
  noStroke();  
  textFont(fontBodyText);  //sans font w createFont

  pushMatrix();
    translate(0, infoYAll);
    //CAJA 1 BG NEGRO
    fill(0, 100);
    rect(0, gridUnit*2, w, h);//position rect BG 
    textFont(fontBodyText);

    //PANEL TEXT ARTICLES UP
    if (textBoxUp == false) {
      textBoxPosY = lerp(textBoxPosY, 800, .12f);
    }
    else {
      textBoxPosY = lerp(textBoxPosY, 0, .12f);
    }
  
    //BG BoxTEXT
    fill(20);
    rect(infoX, infoY, infoW, infoH );
  
  
  
  
    //SCROLL
//    scrollText(0);
    fill(0); 
    rect(infoX, gridUnit*2, infoW, gridUnit*2 );//TO COVER TEXT SCROLL
  
    //BG IMAGE OR DESIGN?
    fill(40);
    rect(infoX, infoY, infoW, gridUnit*4 );
  
    //TITLES TEXT ATICLE PANEL
    fill(200);
    textAlign(LEFT);  textSize(20);
    text("ARTICLE N\u00ba "+articlesTitNumber[scrollArticleSelected], textPosX, textPosY, textW, 400);  
    //TITLE TOPICS
    textSize(12);
    text("Topics: ", textPosX, textPosY+25, textW/2, 400);
  //  text("Tools: " + panelArticleDetailTest[1], textPosX, textPosY+gridUnit*4, textW/2, 400);
  
    //TEXT PANET UP AND DOWN
    butCircleCloseTextTopic.display(textBoxPosY, "articletext");
    //TOOLS - textTools(int _textToolsX, int _textToolsY, int _chapterIsNumber 
    textTools(infoX, infoY, scrollArticleSelected);
    //FEEDBACK 
    textFeedback(infoX+665, infoY);

  //TOPIC TEXT SCROLL - - - - - - - -
  popMatrix();

}//CLOSE X-PANEL THAT UPS WITH TEXT WHEN CALLED - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  




//SCROLL INITIAL VALUES - - - - - - - - - - - - - - - - - - - - - - -  
public void scrollTextIntial() {

  scrollArticlesAll = loadStrings("articles/articlesAll.txt");//LOAD FILE
  scrollArticlesAllJoined = join(scrollArticlesAll, " ");//CREATE 1 STRING
  scrollArticlesAllSplitted = split(scrollArticlesAllJoined, "*");//SPLIT THE STRING BASED ON A CHARACTER
  scrollArticleSelected = 0;// SETS INITIAL ARTICLE NUMBER TO SHOW 
  
  totalNumCharac = scrollArticlesAllJoined.length();

//CALCULATE NUMBER OF WORDS TO LENGTH OF SCROLL
  boolean scrollOn = false;
  scrollBoxConstrain = scrollPosY+1;//initial value scroll box
  artWords = (totalNumCharac / charPerLine) *6 ;  
  artTextLenght = artWords;
  scrollH = artWords;
}//SCROLL INITIAL VALUES - - - - - - - - - - - - - - - - - - - - - - - 




//SCROLL GUI - - - - - - - - - - - - - - - - - - - - - - - 
public void scrollText(int _scrollBoxY) {
  // Scroll Cosntrain
  int scrollBoxX = scrollPosX+360;
  int scrollBoxY = _scrollBoxY;
  int scrollBoxW = 20;
  int scrollBoxH = 10;
  int scrollBoxTop = 0;
  //  int scrollBoxBottom = 400;
  int scrollBoxBottom = scrollPosY+346;
  noStroke();
  textSize(scrollTextSize);
  textAlign(LEFT);

//  myTextScroll.setText(scrollArticlesAllSplitted[scrollArticleSelected]);
//
//    //CONTROLP%
//    if(keyPressed && key==' ') {
//    myTextScroll.scroll((float)mouseX/(float)width);
//  }
//

/*
//CHECK MOUSE OVER
  if (  mousePressed && mouseX>scrollBoxX && mouseX<scrollBoxX+scrollBoxW   ) {
    scrollBoxConstrain = constrain(mouseY, scrollBoxY+scrollPosY, scrollBoxBottom);
  }  
  // Scroll Map
  float  posYMapped = map(scrollBoxConstrain, scrollPosY, scrollBoxBottom, 0, (scrollH+100)*-1);

  //SCROLL BAR
  fill(0);//color bg scroll
  rect(scrollBoxX-1, scrollPosY, scrollBoxW+2, scrollBoxX-91);//Bellow
  //  pushMatrix();
  fill(140);//color smal square
  rect(scrollBoxX, scrollBoxConstrain, scrollBoxW, scrollBoxH );
  //  popMatrix();

  //TextScroll
  fill(10, 0); 
  rect(scrollPosX, scrollPosY, scrollW, scrollH);
  fill(180);
  //THIS IS TO LOAD TEH TEXT IN THE SCROLL PANEL
  text(scrollArticlesAllSplitted[scrollArticleSelected], scrollPosX, scrollPosY+posYMapped, scrollW, scrollH+100);
*/
}//END SCROLL GUI - - - - - - - - - - - - - - - - - - - - - - - 



//TEXT TOOLS SIDE - - - - - - - - - - - - - - - - - - - - - - - 
public void textTools(int _textToolsX, int _textToolsY, int _chapterIsNumber){
  String[] textToolsQuestionsEachArticle = {};
  int textToolsX = _textToolsX;
  int textToolsY = _textToolsY*2;
  int textToolsSep = 20;
  int chapterIsNumber = 1;
  
  //PROVISIONAL - TO SELECTNUMBER OF CHAPTER TO DISPLAY QUESITON IN EACHA ARTICLE
  //Later, each article with a set of quesitons
    if(_chapterIsNumber>=1)   {  chapterIsNumber = 0;  }
    if(_chapterIsNumber>=10)   {  chapterIsNumber = 1;  }
    if(_chapterIsNumber>=19)   {  chapterIsNumber = 2;  }
    if(_chapterIsNumber>=24)   {  chapterIsNumber = 3;  }
    if(_chapterIsNumber>=47)   {  chapterIsNumber = 4;  }
    if(_chapterIsNumber>=77)   {  chapterIsNumber = 5;  }
    if(_chapterIsNumber>=84)   {  chapterIsNumber = 6;  }
    if(_chapterIsNumber>=93)   {  chapterIsNumber = 7;  }
    if(_chapterIsNumber>=96)   {  chapterIsNumber = 8;  }
    if(_chapterIsNumber>=99)   {  chapterIsNumber = 9;  }
    if(_chapterIsNumber>=102)   {  chapterIsNumber = 10;  }
    if(_chapterIsNumber>=107)   {  chapterIsNumber = 11;  }
    if(_chapterIsNumber>=109)   {  chapterIsNumber = 12;  }
    if(_chapterIsNumber>=111)   {  chapterIsNumber = 13;  }  
    if(_chapterIsNumber>=131)   {  chapterIsNumber = 14;  }
    if(_chapterIsNumber>=132)   {  chapterIsNumber = 15;  }
  
//BG COLOR OF PANEL LEFT 1 
  fill(30);
  rect(textToolsX, textToolsY, 260, 600);
//TITLES TOOLS QUESTIONS
  textAlign(LEFT);  textSize(20);
  textSize(16);  fill(30, 150, 255);//TITLE COLOR
  text("Some Questions", _textToolsX+textToolsSep, textToolsSep+textToolsY, 220, 600);
  //DETAIL
  textSize(12); fill(120);
  text(scrollArticlesQuestions[chapterIsNumber], _textToolsX+textToolsSep, textToolsSep+textToolsY+30, 220, 600);
//  text(panelArticleDetailTest[1], _textToolsX+textToolsSep, textToolsSep+textToolsY+30, 220, 600);


//TITLES TOOLS DEFINITIONS
  textAlign(LEFT);  textSize(20);
  textSize(16);fill(30, 150, 255);//TITLE COLOR
  text("Definitions", _textToolsX+textToolsSep, textToolsSep+textToolsY+300, 220, 600);
  //definitions detail
  textSize(12);  fill(120);
  text(scrollArticlesDefinitions[chapterIsNumber], _textToolsX+textToolsSep, textToolsSep+textToolsY+330, 220, 600);
//  text(panelArticleDetailTest[1], _textToolsX+textToolsSep, textToolsSep+textToolsY+330, 220, 600);
}//TEXT TOOLS SIDE CLOSE - - - - - - - - - - - - - - - - - - - - - - - 







//TEXT FEEDBACK SIDE - - - - - - - - - - - - - - - - - - - - - - - 
public void textFeedback(int _textFeedbackX, int _textFeedbackY){
  int textFeedbackX = _textFeedbackX;
  int textFeedbackY = _textFeedbackY*2;
  int textFeedbackSep = 20;

//BG COLOR
  fill(30);
  rect(textFeedbackX, textFeedbackY, 260, 600);

//TITLES FEEDBACK QUESTIONARY
  textAlign(LEFT);  textSize(20);
  textSize(16); fill(30, 150, 255);//TITLE COLOR
  text("Questionary", _textFeedbackX+textFeedbackSep, textFeedbackSep+textFeedbackY, 220, 600);
  //DETAIL
  textSize(12);  fill(120);
  text("Quesitonarie todo", _textFeedbackX+textFeedbackSep, textFeedbackSep+textFeedbackY+30, 220, 600);
  //text(panelArticleDetailTest[1], _textFeedbackX+textFeedbackSep, textFeedbackSep+textFeedbackY+30, 220, 600);

//TITLES FEEDBACK OPINION
  textAlign(LEFT);  textSize(20);
  //Opinion
  textSize(16);fill(30, 150, 255);//TITLE COLOR
  text("Your Brief Opinion", textFeedbackX+textFeedbackSep, textFeedbackSep+textFeedbackY+300, 220, 600);
  textSize(12);
  text("Your name...\n\n\nWrite your Opinion (max 140 ch.)", textFeedbackX+textFeedbackSep, textFeedbackSep+textFeedbackY+330, 220, 600);
  //Boxes Opinion
  fill(50);
  rect(textFeedbackX+textFeedbackSep, textFeedbackSep+textFeedbackY+350, 220, 20);
  rect(textFeedbackX+textFeedbackSep, textFeedbackSep+textFeedbackY+410, 220, 100);
//  fill(120);//TEXT COLOR

}//TEXT TOOLS SIDE CLOSE - - - - - - - - - - - - - - - - - - - - - - - 

//BASES ON AN EXAMPLE FORM INTERENET, I CAN REMEMBER WHERE. 

public void timeLine() {
  noStroke(); 
  //DISPLAY
  //    rectMode(CENTER);  //  textAlign(CENTER);  //  textSize(10);  //  x = margenX + lado;
  int selectorPosY = 160 + 375;
  int barColorW = 2024;

  //STRINGS & ARRAYS
  int colorsHistory[] = { 0xff79ACD9, 0xff085A8C, 0xff0C4459, 0xffD9A84E, 0xffBF5239, 0xffDFE0AF    };
  String[][] periodDictatorship = {  
      {  "1962", "Agrarian Reform", "Pretended improving agricultural production levels through the slow modification of the system of land tenure. Sought to end the old landowning order which had prevailed for more than 400 years, had come to an end. It was a key process in the coming social changes."  }, 
      {  "1970", "S. Allende President", "Allende began to carry out his platform of implementing a socialist programme called La v\u00eda chilena al socialismo (\"the Chilean Path to Socialism\"). This included nationalization of large-scale industries (notably copper mining and banking), and government administration of the health care system, educational system, a programme of free milk for children in the schools, etc."  }, 
      {  "1973", "Coup in Chile", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "1977", "Writers Team", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "1979", "New Constitution Sketch", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 

      {  "1980", "Voting New Constitution", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "1981", "New Constitution Enacted", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "1986", "Attempt on Pinochet", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "1988", "NO Plebiscite", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "1990", "Democrat President", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 

      };
      
  String[][] periodDemocracy = {  
      {  "1994", "E. Frei, President", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "1991", "J. Guzman  Killed", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "2005", "Constitution Reforms", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  },
      {  "2011", "Students Movement", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  },
/*      {  "2000", "Ricardo Lagos, President", "This is the text detail of number 3\n This is a new Line"  }, 

      {  "2006", "Michelle Bachelet, President", "This is the text detail of number 1\n This is a new Line"  }, 
      {  "2010", "Sebastian Pinera, President", "This is the text detail of number 2\n This is a new Line"  }, 
      {  "2011", "Students Movement", "This is the text detail of number 4\n This is a new Line"  },
      {  "2014", "Michelle Bachelet, President", "This is the text detail of number 3\n This is a new Line"  }, 
*/  
    };



  //BOX BG IMAGES AND TEXT
  pushMatrix();
    rectMode(CORNER);
    fill(10, 120 );
    rect(0, 100, 1024, /*capa[i].height +*/ 724);
    fill(5);
    rect(margenX, 115, 1024-margenX*2, /*capa[i].height +*/ 404);
  popMatrix();


//VER
  //CALC TIME 
//  if (mousePressed /*&& mouseButton == LEFT*/) {
    if ((mouseY > selectorPosY - lado / 2 - tolerancia) && (mouseY < selectorPosY + lado / 2 + tolerancia)) {
      float distancia = dist(mouseX, 0, posX, 0);
//      float vel = map(distancia, 10, width - 10, 0.5, 150);
      float vel = map(distancia, 5, width - 5, 0.5f, 150);

      if (mouseX > posX) {
        if (pmouseX < width - margenX/2 - lado/2) posX += vel;
      } else if (mouseX < posX) {
         if (pmouseX > margenX/2 + lado/2) posX -= vel;
      }
      //cmtstrains the marker
      //ORIG        posX = constrain(posX, (lado + border), (width - margenX/2 - lado - border));
        posX = constrain(posX, (lado + border), (width - margenX/2 - lado - border));
      }
//  }//close If calc time


//VER
 //COLOR AREA SELECTOR
 pushMatrix();
  fill(timeLineAreaSelectorCurrentColor);//BG FOR INTERACTIVE TIME BAR
  rect(0, selectorPosY, 1024, barH);
  fill(timeLineColor1);
  //BG 1 GREEN barra timeLine to be put i the  buttons??
  
  int largoBarraGreeen = barColorW-20;
  rect(margenX-displace, selectorPosY, largoBarraGreeen, barH);

  //BG 2 BROWN barra timeLine to be put i the  buttons??
  fill(timeLineColor2); 
  rect(margenX+450-displace, selectorPosY, barColorW - margenX*8, barH);
  // LINE 1973 ARRIBA
  stroke(250, 50, 0);line(margenX+450-displace, height-232, margenX+450-displace,  height-173 );
  noStroke();  //color(50, 30, 0)

  //BG 3 BLUE barra timeLine to be put i the  buttons??
  fill(timeLineColor3);
  rect(margenX+1020-displace, selectorPosY, barColorW - margenX*11, barH);
//  textSize(40);text(displace, 200, 100);//test displace, not to be shown


  //Moving indicatorPeriod
  pushMatrix();
    fill(timeLineAreaSelectorCurrentColor);
    beginShape();
      vertex(70+movingIndicatorPeriodX, 0+selectorPosY+barH);
      bezierVertex(movingIndicatorPeriodX+50,0+selectorPosY+barH,   movingIndicatorPeriodX+0,0+selectorPosY+barH,   movingIndicatorPeriodX+0,70+selectorPosY+barH );
      bezierVertex(0+movingIndicatorPeriodX,0+selectorPosY+barH,   -50+movingIndicatorPeriodX,0+selectorPosY+barH,   -70+movingIndicatorPeriodX,0+selectorPosY+barH);
    endShape();
  popMatrix();
  //  rect(movingIndicatorPeriodX, selectorPosY+barH, 10, barH);//element that moves

  //SELECTOR MOVE. small square. Once corrected the dates, use this
   fill(colorsBgSectionsBlues[0]);
  //  rect(posX, selectorPosY, 2*lado, lado - border);
   rect(posX, selectorPosY-15, lado/3, lado/2-2);
  popMatrix();


//Loop trough images and text
  for (int i = 0; i < periodDictatorship.length; i++) {
//ORIG    float pt = map(int(periodDictatorship[i][0]), 1960, 2014, margenX + lado, width - margenX - lado);
    float pt = map(PApplet.parseInt(periodDictatorship[i][0]), 1960, 2014, margenX + lado, barColorW - margenX - lado);
    textLeading(11);textAlign(LEFT);
   fill(colorsBgSectionsBlues[0]);
   text(periodDictatorship[i][1], pt-displace, selectorPosY+37, 55, 50);//titles of events

    if (dist(posX, selectorPosY, pt-displace, selectorPosY) <= lado) {
      fill(200, 0, 0);
      //        ellipse(pt, y, 5, 15);//Events Elements "onOver"
      //text(periodDemocracy[i][1], pt, selectorPosY - 40);

      //IMAGES AND TEXT PANEL 
      pushMatrix();
        image(imgsTimeLine[i], margenX+10, 125);//position image
        //TEXT TITLE
        fill(colorsBgSectionsBlues[0]);
        textSize(20); textAlign(LEFT); text(periodDictatorship[i][1], 490, 150); 
        //TEXT CONTENT
        fill(colorsBgSectionsBlues[0]);
        textSize(14); textAlign(LEFT); text(periodDictatorship[i][2], 490, 200, 380, 300); 
      popMatrix();
    }//CLOSE IF
//      else {// it works for something or not.? 
//        fill(0, 200, 0);//        //ellipse(pt, selectorPosY, 5, 15); }

//ver displace
  //EVENTS POINTS
    //    fill(150, 150, 200);
    rect(pt-displace, selectorPosY, 20, 15);// ellipses stand
    //YEARS
    fill(colorsHistory[5]);
    textAlign(CENTER);
    textSize(10);
    text(periodDictatorship[i][0], pt-displace, selectorPosY + 20, 30, 40); // TEXT YEARS BOTTOM SELECTOR
  }//CLOS E//Loop trough images and text

  noStroke(); 
}//ENDS TIMELINE CLASS

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#02232C", "--hide-stop", "myConstitution17" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
