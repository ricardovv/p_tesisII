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
float visualPosX = gridUnit*12;//240;
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
import controlP5.*;
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
int articleBoxW = 47;//42 Articles box width, 35-45 optimal
int articleBoxHintial = 14;//Articles box height, 10-14 optimal
int countToRight = 0;//Counts initial chapter to mve right
float sep = 1.0;//separator among articles and chapters
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
color timeLineColor1 = color(20, 40, 20);
color timeLineColor2 = color(70, 40, 0);
color timeLineColor3 = color(20, 40, 80);
//COLOR AREA SELECTOR
color timeLineAreaSelectorCurrentColor = timeLineColor1;





//GRAPHIC ELEMENTS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PShape graphics_logo;
PShape graphics_band;
PShape graphics_star;

//COLORS Orange home, BLUE HOME, CELESTE TOPICS, CELESTE HISTORY 
//Naranja, LAdrillo, COnnchevino
color[] colorsBgSectionsReds = { #E65F46, #BE2D28, #821950, #E84921 };
//CELESTE, Azul, Morado
color[] colorsBgSectionsBlues = { #199BCD, #146496, #02232C, #8BCADB, #063B4D, #062B39 };
color[] colorsBgButtonsTop = { #146496, #199BCD, #3C286E  };
color[] colorsArticleBoxesBlues = { #8BCADB, #199BCD, #146496, #02232C  };
//Colot Font,  
color[] colorsFontTitles = {#FFFFFF };
color[] colorsFontButtons = {#FFFFFF };
color[] colorsFontBodytext = {#FFFFFF };

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



// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// S E T U P
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

void setup() {
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
//  fontTitles = loadFont("Futura-Medium-48.vlw");

  fontTitles = loadFont("HermeneusOne-Regular-48.vlw");
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



// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// D R A W 
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


void draw() {
  background(colorsBgSectionsBlues[2]);//BG PALE BLUE ALL
  rectMode(CORNER);
  //LOADING PANELS

  if (section == 1) {
    sectionHome();
  }
  if (section == 2) {
//    questions(gridUnit*14, gridUnit*1, 2);
    panelTopics();
//    panelTitles("TOPICS");
    panelTitles("My Constitution", "Exploring the Chilean Constitution of 1980", gridUnit*3, gridUnit+8);
      //QUESITONS AT THE TOP
    myNavs();
  }
  if (section == 3) {
    questions(gridUnit*14, gridUnit*1, 3);
    sectionHistory(100);
//    panelTitles("HISTORY", gridUnit*3);
    myNavs();
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



void parseData() {
  rawData = loadTable(filename);
 // println(rawData.getRowCount() + " total rows in table"); 
  articleId = rawData.getInt(1, 0);
  articleTitle = rawData.getString(1, 1);
  articleContent = rawData.getString(1, 2);
}


void showText() {
  textSize(10);
  fill(250);
  text("ID- " + articleId, 0, 20, 200, 50);
  text("TITLE- " + articleTitle, 0, 40, 200, 50);
  text("CONTENT- " + articleContent, 0, 60, 400, 400);
}


void myText(int _x, int _y, int _textSize, String _textAlign, color _textColor, String _textContent ) {
  pushMatrix();
  fill(_textColor);
  textAlign(CENTER);
  textSize(_textSize);
  text(_textContent, 0+_x, 0+_y);
  popMatrix();
}




