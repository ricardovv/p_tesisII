//First prototype for thesishttp://grooveshark.com/#!/album/Q+Are+We+Not+Men+A+We+Are+Devo/2363778

String[] lines = loadStrings("poem1.txt");
int myLenght = lines.length;

size(1000, 600);
background(20);
textSize(8);

//read text
for(int i=0; i<lines.length; i++){
  text(lines[i], 20, 11*i, 400, 400);

}

println(myLenght);
//makelines
  translate(250, 50);
for(int i=1; i<myLenght; i++){
  stroke(200);
  line(10*i, 10, 10*i, 40);
}
