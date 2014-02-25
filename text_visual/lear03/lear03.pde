// Learning Processing // Daniel Shiffman  http://www.learningprocessing.com // Example 18-6: Analyzing King Lear


String[] kinglearWords;// all of the text
int counter = 0;// where starts in the text 
String delimiters = " ,.?!;:[]"; //delimiters

void setup() {
  size(1000,1000);  
  
  // Load text 
  String file = "poem01.txt";
  String[] rawtext = loadStrings(file);
  String everything = join(rawtext, "" );    // Join file array in one long string
  kinglearWords = splitTokens(everything, delimiters);   //All lines joined one String >> split up array individual words. 
  frameRate(5);
  textSize(9);
  textAlign(RIGHT);
  fill(0);
  stroke(0);
}

void draw() {
  background(255);
  translate(100, 20);

  String theword = kinglearWords[counter]; // Pick one word from King Lear
  int total = 0;   // Count how many times that word appears in King Lear
  
// FOR LOOP - - - - - - - - - - - - - - - 
  for (int i = 0; i < kinglearWords.length; i ++ ) {

    //R - PRESENTS AL THE WORDS
    String theword2 = kinglearWords[i];
    
    if (theword.equals(kinglearWords[i])) {
      total ++;
    }

    text(theword2,0,12*i);
    rect(10, 12*i, total/4, -10);
  
  }
// END FOR LOOP - - - - - - - - - - - - - - - 


  counter = (counter + 1) % kinglearWords.length;  // Move onto the next word
}
