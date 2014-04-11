PImage guia;


//COLORS
//Orange home, BLUE HOME, CELESTE TOPICS
color[] colorsBg = { 
  #E0683D, #39677F, #62ACCF, #000000
};
//BGStaticMain,  
color[] colorsButton = {
  #1b373a
};
//Title bartop white,  
color[] colorsTypo = {
  #FFFFFF
};

int counter = 0;// counter to questionsHome

//TYPOS
PFont fontTitles;
PFont fontButtonsHome;
int w = 1024;
int h = 768;
int gridUnit = 20;
String filename = "test.csv";
Table rawData;

// PANELS
int panel = 2;

//DATA TO BE PARSED
String[] panelInfo;//PANEL INFO TEXT CONTENT
int articleId;
String articleTitle;
String articleContent;


void setup() {
  size(w, h);
  background(colorsBg[2]);//BG PALE BLUE ALL
  panelInfo =  loadStrings("panelInfo.txt");
  parseData();
  //Fonts
  fontTitles = loadFont("Futura-Medium-48.vlw");
  fontButtonsHome = loadFont("Georgia-Italic-48.vlw");

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
  if (panel == 4) {
    myNavs();
    panelInfo();
  }

  //  showText();
  textPressed();

  // TITLE ON TOP
  fill(255);
  panelTitles("                    HOME press 1 - Topics 2 - History 3 - About 4");

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

