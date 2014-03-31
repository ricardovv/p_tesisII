//LOADING DATA FROM EXTERNAL CSV
//Tables 

String filename = "test.csv";
Table rawData;

void setup() {
  size(300, 300);
  background(20);
  parseData();
}
void draw() {
}

void parseData() {
  rawData = loadTable(filename);
  println(rawData.getRowCount() + " total rows in table"); 

  int articleId = rawData.getInt(1, 0);
  String articleTitle = rawData.getString(1, 1);
  String articleContent = rawData.getString(1, 2);

  text("a- " + articleId, 20, 20, 200, 50);
  text("b- " + articleTitle, 20, 50, 200, 50);
  text("c- " + articleContent, 20, 100, 200, 200);
}

