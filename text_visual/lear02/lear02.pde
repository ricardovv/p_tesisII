// Learning Processing // Daniel Shiffman  http://www.learningprocessing.com
// Example 18-6: Analyzing King Lear

String[] kinglear;// all of the text
int[] counter;// where starts in the text 
String delimiters = " ,.?!;:[]"; //delimiters

void setup() {
  size(1000,1000);  
  
  // Load text 
  String file = "poem01.txt";
  String[] rawtext = loadStrings(file);
  String everything = join(rawtext, "" );    // Join file array in one long string
  kinglear = splitTokens(everything,delimiters);   //All lines joined one String >> split up array individual words. 
  counter[] = new int[everything.length];
  frameRate(5);
  textSize(9);
  textAlign(RIGHT);
  fill(0);
  stroke(0);
}

void draw() {
  background(255);
  translate(100, 20);

  String theword = kinglear[counter]; // Pick one word from King Lear
  int total = 0;   // Count how many times that word appears in King Lear

  for (int i = 0; i < kinglear.length; i ++ ) {
    if (theword.equals(kinglear[i])) {
      total ++;
    }

    //R - PRESENTS AL THE WORDS
    int total2 = 0;
    String theword2 = kinglear[i];
    text(theword2,0,12*i);
    rect(10, 12*i, total/4, -10);
  
  }
  
  // Display the text and total times the word appears
  /*
  text(theword,10,90);
  text(total,10,110);
  fill(175);
  rect(10,50,total/4,20);
  */
  counter = (counter + 1) % kinglear.length;  // Move onto the next word
}
