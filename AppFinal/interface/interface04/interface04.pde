PImage guia;
PShape logo;
//COLORS
//Orange home, BLUE HOME, CELESTE TOPICS, CELESTE HISTORY 
color[] colorsBg = {    
  #E0683D, #39677F, #62ACCF, #AA0000
};
//BGStaticMain,  
color[] colorsButton = {   
  #1b373a
};
//Title bartop white,  
color[] colorsTypo = {   
  #FFFFFF
};

//QUESTIONS
int counter = 0;// counter to questionsHome

//TYPOS
PFont fontTitles;
PFont fontButtonsHome;
PFont fontBodyText;
int w = 1024;
int h = 768;
int gridUnit = 20;
String filename = "test.csv";
Table rawData;

// PANELS
int panel = 3;
//PANEL INFO UP
boolean panelInfoUp = false;
float panelInfoY;

//DATA TO BE PARSED
String[] panelInfo;//PANEL INFO TEXT CONTENT
int articleId;
String articleTitle;
String articleContent;

//TEXT BOX ELEMENTS - INFO & TOPICS
ButCircle butCircleOpenTextInfo, butCircleCloseTextInfo;
boolean textBoxUp;
float textBoxPosY;


void setup() {
  size(w, h);
  background(colorsBg[2]);//BG PALE BLUE ALL
  smooth();
  ///  noCursor();
//PANEL INFO
  panelInfoY = 800;

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
  fontBodyText = loadFont("Georgia-48.vlw");
  logo =  loadShape("logo.svg");
  guia = loadImage("guia.jpg");
}


void draw() {
  background(colorsBg[2]+50);//BG PALE BLUE ALL
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
//  if (panel == 4) {
//    myNavs();
////        panelInfo(panelInfoY);
//
//  }
    panelInfo(panelInfoY);

  //  showText();
  textPressed();

  // BG IMage reference
  if (keyPressed == true) {
    tint(255, 100);
    image(guia, 0, 0);
  }
}//CLOSE DRAW


void parseData() {
  rawData = loadTable(filename);
  println(rawData.getRowCount() + " total rows in table"); 

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

