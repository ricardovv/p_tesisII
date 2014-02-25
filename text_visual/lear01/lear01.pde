// Learning Processing
// Daniel Shiffman  http://www.learningprocessing.com
// Example 18-6: Analyzing King Lear

String[] kinglear;    // The array to hold all of the text
int counter = 0;   // Where are we in the text (start later b/c Project Gutenberg has licensing info at beginning)

// We will use spaces and punctuation as delimiters
String delimiters = " ,.?!;:[]";

void setup() {
  size(800,600);  
  // Load King Lear into an array of strings
//  String url = "http://www.gutenberg.org/dirs/etext97/1ws3310.txt";
  String file = "poem01.txt";

  String[] rawtext = loadStrings(file);
  
  // Join the big array together as one long string
  String everything = join(rawtext, "" );
  
  // All the lines in King Lear are first joined as one big String and then split up into an array of individual words. 
  // Note the use of splitTokens() since we are using spaces and punctuation marks all as delimiters.  
  kinglear = splitTokens(everything,delimiters);
  frameRate(1);
}

void draw() {
  background(255);
  
  // Pick one word from King Lear
  String theword = kinglear[counter];
  
  // Count how many times that word appears in King Lear
  int total = 0;
  for (int i = 0; i < kinglear.length; i ++ ) {
    if (theword.equals(kinglear[i])) {
      total ++;
    }
  }
  
  // Display the text and total times the word appears
  fill(0);
  text(theword,10,90);
  text(total,10,110);
  stroke(0);
  fill(175);
  rect(10,50,total/4,20);
  
  // Move onto the next word
  counter = (counter + 1) % kinglear.length;
}
