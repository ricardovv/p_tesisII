//LOADING DATA FROM EXTERNAL CSV
String filename = "test.csv";
//String filename = "Constitution_Tables.csv";
String[] rawData;

void setup() {
  size(500, 500);
  background(20);
  parseData();
}

void draw() {
}

void parseData() { 
  rawData = loadStrings(filename);
  for (int i=1; i<rawData.length; i++) {//ROWS index 1 to avoid row names
    Article art = new Article();// creating new articles objects
    String[] thisRow = split(rawData[i], ",");

    printArray(thisRow);
     text(thisRow[2], 50, 50, 400, 400);

  }//close for loop

}//close parseData 


