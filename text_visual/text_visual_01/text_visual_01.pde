//First prototype for thesishttp://grooveshark.com/#!/album/Q+Are+We+Not+Men+A+We+Are+Devo/2363778

String[] myText = loadStrings("poem1.txt");

String[]  myText2 = split(myText[3], 'a');
int myLenght = myText.length;
println(myText2);


size(1000, 600);
background(20);
textSize(8);

//read text
for (int i=0; i<myText.length; i++) {
  text(myText[i], 20, 11*i, 400, 400);
}

//makemyText
translate(250, 200);
for (int i=1; i<myLenght; i++) {
  int posx = 20*i;
  textAlign(CENTER);
  text(i, posx, 10);
  stroke(200);
  line(posx, 0, posx, -40);
}

