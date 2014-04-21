
void panelHistory() {
  int historyW = w;
  int historyH = h - gridUnit*3;

  //Topic Panel position 
  int historyX = 0;
  int historyY = gridUnit*3;//position from top

  rectMode(CORNER);  //titles
  //Background
  fill(200, 0, 0);
  noStroke();

  rect(historyX, historyY, historyW, historyH);
  panelTitles("HISTORY RED");

  questions(historyX, historyY, 3);
  timeline();
}


void timeline() {
  float posX, posY;
  float   posNew;
  float posFinal;
  posX = width/2;
  posY =height/2;
  posNew = map(mouseX, posX-50, posX+50, 0, 600);


  if (mousePressed) {
  posFinal = posNew;
  }

  fill(0);
  fill(0, 0, 200);
  rect(posNew, posY-100, 100, 100);
  rectMode(CENTER);
  fill(200, 200, 0);
  rect(posX, posY+100, 100, 100);
}//endtimeline

