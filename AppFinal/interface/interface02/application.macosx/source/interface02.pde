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


void setup() {
  size(w, h);
  parseData();
}


void draw() {
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

