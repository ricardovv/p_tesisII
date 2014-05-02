//VERSION CLEANED WITH TOPIC GRAPHISC INCORPORATED 
//what is textPressed?


//PRINCIPAL OVERALL SETTINGS
int w = 1024;
int h = 768;
int gridUnit = 20;//basig nit of measure positions and sizes
int counter = 0;// counter to questionsHome
//int panel = 2;//initia panel to be loaded
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
int[] articlesCategoryHighligth = {1, 2, 3, 4, 5, 6, 7, 8, 8,8,11,12,13,14,15,15,15,15,19,20,21,15,23,24,15,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,15,59,60,61,62,63,64,65,66,67,68,69,70,71,72,15,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157};
int[] articlesIdNumber = { 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157};
String[] articlesTitNumber = { 
  "1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","37 bis","38","39","40","41","42","43","44","45",
  "46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97",
  "98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","126 bis","127","128","129",
  "1st","2nd","3th","4th","5th","6th","7th","8th","9th","10th","11th","12th","13th","14th","15th","16th","17th","18th","19th","20th","21th","22th","23th","24th","25th","26th"
/*"FIRST","SECOND","THIRTH","FOURTH","FIFTH","SIXTH","SEVENTH","EIGHT","NINTH","TENTH","ELEVENTH","TWELFTH","THIRTEENTH","FOURTEENTH","FIFTEENTH","SIXTEENTH","SEVENTEENTH","EIGHTEENTH","NINETEENTH","TWENTY","TWENTY FIRST","TWENTY SECOND","TWENTY THIRTH","TWENTY FOURTH","TWENTY FIFTH","TWENTY SIXTH"*/
};
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
float sep = 1.0;//separator among articles and chapters
//Boxes Chapters
float boxChapterH = gridUnit;
float boxChapterW = articleBoxW;
float boxChapterX;
float boxChapterY;
boolean[] boxOn = new boolean[numberOfArticles];//on and of articles boxes 
boolean articleTextPanelUp = false;//Text panel for articles buttons
float articleTextPanelY;// initial position
// CLOSE TOPICS ELEMENTS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


// TOPICS CATEGORIES - 25 so far - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
String[] topicsCategoryNames = {"Category Name 1","Category Name 2","Category Name 3","Category Name 4","Category Name 5","Category Name 6","Category Name 7","Category Name 8","Category Name 9","Category Name 10","Category Name 11","Category Name 12","Category Name 13","Category Name 14","Category Name 15","Category Name 16","Category Name 17","Category Name 18","Category Name 19", "Category Name 20", "Category Name 21", "Category Name 22", "Category Name 23", "Category Name 24","Category Name 25"}; 



//TOPIC TEXT SCROLL - - - - - - - - 
String[] scrollArticle;
String scrollArticleJoined;
int totalNumCharac;

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




//GRAPHIC ELEMENTS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PShape logo;
//COLORS Orange home, BLUE HOME, CELESTE TOPICS, CELESTE HISTORY 
color[] colorsBg = { #E0683D, 100, 50, #AA0000 };
//BGStaticMain,  
color[] colorsButton = { #1b373a };
//Title bartop white,  
color[] colorsTypo = {#FFFFFF };

//TYPOS
PFont fontTitles;
PFont fontButtonsHome;
PFont fontBodyText;

//DATA - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
String filename = "test.csv";
Table rawData;

//TEXTSCROLL UP
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






void setup() {
  size(w, h);
  background(colorsBg[2]);//BG PALE BLUE ALL

  //TOPICS
  //FIll array starting state
  for(int i=0;i<numberOfArticles;i++){
    boxOn[i] = false;//init topic categories button off
  }
  checkCategory();//BEfore in draw...
  articleTextPanelY = 800;//initial value text each article. 
  //Load chapters description from external file
  chaptersDescriptions =  loadStrings("chapters/chaptersDescriptions.txt");
  //PANEL INFO

  //TEXT BOX ELEMENTS - INFO & TOPICS  
  textBoxUp = false; 
  butCircleCloseTextInfo = new ButCircle(940, 160, 50, "close");
  //buttons text articles
  butCircleCloseTextTopic = new ButCircle(940, 160, 50, "close");

  //TOPIC SCROLL TEXT
  scrollArticle = loadStrings("articles/artText1.txt");//Initial text Loaded
  scrollTextIntial();
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
  logo =  loadShape("logo.svg");
  smooth();
  ///  noCursor();

}


void draw() {
  background(colorsBg[2]);//BG PALE BLUE ALL
  rectMode(CORNER);
  //LOADING PANELS
  if (section == 1) {
    sectionHome();
  }
  if (section == 2) {
    panelTopics();
    myNavs();
    panelTitles("TOPICS");
  }
  if (section == 3) {
    sectionHistory();
    myNavs();
    panelTitles("HISTORY");
  }
  panelInfo(panelInfoY);//INITIAL POS INFO 
  //  showText();

  
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




