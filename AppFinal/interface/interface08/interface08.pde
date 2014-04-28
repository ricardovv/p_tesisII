//VERSION CLEANED WITH TOPIC GRAPHISC INCORPORATED 

//PRINCIPAL OVERALL SETTINGS
int w = 1024;
int h = 768;
int gridUnit = 20;//basig nit of measure positions and sizes
int counter = 0;// counter to questionsHome
int panel = 2;//initia panel to be loaded



// TOPICS ELEMENTS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//DO I NEED THIS???
//float visualX = 0;
//float visualY = 0;//160
//float visualAreaW;//Width elements
//float visualAreaH;//Height Elements

float visualPosX = gridUnit*12;//240;
float visualPosY = gridUnit*7;//160;

//TOPICS - CHAPTERS & ARTICLES DATA
String[] chaptersNumber = {"I","II","III","IV","V","VI","VII","VIII","IX","X","XI","XII","XIII","XIV","XV","TD"}; 
String[] chaptersTitle = {"Bases of Institutionally","Nationality and Citizenship","Constitutional Rights and Duties","Government","National Congress","Judicial Power","Public Ministry","Constitutional Tribunal","Electoral Justice","Office of the Comptroller General of the Republic","Armed Forces, Forces of Order and Public Security","Council of National Security","Central Bank","Government & Interior Administration of the State","Reform of the Constitution","Transitory Provisions"}; 
int[] chapterStartAt = {1,10,19,24,46+1,76+1,83+1,92+1,95+1,98+1,101+1,106+1,108+1,110+1,129+2,130+2};//addedone to compensate bis articles
int[] articlesLengthCategory = {3,1,2,1,2,2,2,3,3,3,2,2,2,2,1,3,2,3,19,2,3,2,3,2,3,4,3,3,4,3,1,6,2,2,2,1,3,3,3,1,4,3,3,3,2,3,1,1,2,2,1,3,6,5,5,2,1,4,3,2,4,3,1,5,4,4,3,3,2,2,3,3,1,3,2,2,3,4,5,2,3,2,2,4,3,3,3,3,2,2,1,1,4,9,3,4,3,1,3,4,2,3,1,2,3,2,3,3,1,3,2,3,2,4,2,4,2,1,4,3,2,2,2,2,3,1,3,2,3,3,3,1,3,1,2,1,1,1,3,2,1,1,1,3,4,3,1,1,1,1,1,1,1,2,3,1,2};
int[] articlesCategoryHighligth = {1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157};
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
boolean boxOn;//on and of articles boxes 
// CLOSE TOPICS ELEMENTS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


//GRAPHIC ELEMENTS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PShape logo;
//COLORS Orange home, BLUE HOME, CELESTE TOPICS, CELESTE HISTORY 
color[] colorsBg = { #E0683D, 100, 40, #AA0000 };
//BGStaticMain,  
color[] colorsButton = {   #1b373a };
//Title bartop white,  
color[] colorsTypo = {#FFFFFF };

//TYPOS
PFont fontTitles;
PFont fontButtonsHome;
PFont fontBodyText;
//CLOSE GRAPHIC ELEMENTS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



String filename = "test.csv";
Table rawData;

//PANEL INFO UP
boolean panelInfoUp = false;
float panelInfoY;
//TEXT BOX ELEMENTS - INFO & TOPICS
ButCircle butCircleOpenTextInfo, butCircleCloseTextInfo;
boolean textBoxUp;
float textBoxPosY;

//DATA TO BE PARSED
String[] panelInfo;//PANEL INFO TEXT CONTENT
int articleId;
String articleTitle;
String articleContent;






void setup() {
  size(w, h);
  background(colorsBg[2]);//BG PALE BLUE ALL
  smooth();
  ///  noCursor();
  //TOPICS
  boxOn = false;//init topic categories button off
  checkCategory();//BEfore in draw...
  //PANEL INFO
  panelInfoY = 800; //INITIAL VALUE POS INFO 

  //TEXT BOX ELEMENTS - INFO & TOPICS  textBoxUp = false; 
  textBoxUp = false;
  textBoxPosY = height;
  butCircleOpenTextInfo = new ButCircle(100, 100, 50, "open");
  butCircleCloseTextInfo = new ButCircle(940, 160, 50, "close");

  //DATA
  panelInfo =  loadStrings("panelInfo.txt");
  parseData();
  //Fonts & Logos
  fontTitles = loadFont("Futura-Medium-48.vlw");
  fontButtonsHome = loadFont("Georgia-Italic-48.vlw");
  //fontBodyText = loadFont("Georgia-48.vlw");
  fontBodyText = createFont("sans", 40);

  logo =  loadShape("logo.svg");

}


void draw() {
  background(colorsBg[2]+40);//BG PALE BLUE ALL
  rectMode(CORNER);
  //LOADING PANELS
  if (panel == 1) {
    panelHome();
  }
  if (panel == 2) {
    myNavs();
    panelTitles("TOPICS");
    panelTopics();
  }
  if (panel == 3) {
    myNavs();
    panelTitles("HISTORY");
    panelHistory();
  }
  panelInfo(panelInfoY);//INITIAL POS INFO 
  //  showText();
  textPressed();

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




