
void panelHistory() {
  int historyW = w;
  int historyH = h - gridUnit*3;
  //Topic Panel position 
  int historyX = 0;
  int historyY = gridUnit*4;//position from top
  rectMode(CORNER);  //titles  
  questions(gridUnit*8, 0, 3);
  timeline();
}

void timeline() {
  fill(0, 0, 200);
  rect(80, 80, 100, 100);
}//endtimeline

