// hacer clases botones panel

void panelInfo(float _infoY) {
  rectMode(CORNER);
  //Background
  int infoW = w - gridUnit*4;
  int infoH = h - gridUnit*4;
  float infoYAll = _infoY;
  
  pushMatrix();
  translate(0, infoYAll);
  //CAJA 1
  fill(0, 150);
  noStroke();  
  rect(0, gridUnit*3, w, h);

  //CAJA BG TRANSPARENT
  int infoX = gridUnit*2;
  int infoY = gridUnit*6;
  fill(0, 0, 200);
  noStroke();  
  rect(infoX, infoY, infoW, infoH-gridUnit*5 );

//IMAGE OR DESIGN?
  fill(0, 0, 250);
  noStroke();  
  rect(infoX, infoY, infoW, gridUnit*8 );


  //TEXT
  int textPosX = infoX*10;
  int textPosY = infoY + gridUnit*10;
  int textW = 550;
  smooth();
  fill(200);
  stroke(200);
  textFont(fontBodyText);
  textAlign(LEFT);
  textSize(22);
  text("ABOUT THE PROJECT\n", textPosX, textPosY, textW, 400);  
  textSize(14);
  text("MOTIVATION\n" + panelInfo[0], textPosX, textPosY+gridUnit*2, textW, 400);
  text("CREDITS\n" + panelInfo[1], textPosX, textPosY+gridUnit*6, textW, 400);
  text("SOURCES\n" + panelInfo[2], textPosX, textPosY+gridUnit*12, textW, 400);

  //TITLE ON TOP
//  panelTitles(INFO AZUL");


  if (panelInfoUp) {
    panelInfoY = lerp(panelInfoY, 0, .12);
  }
  else {
    panelInfoY = lerp(panelInfoY, 800, .12);
  }
  popMatrix();
  //TEXT PANET UP AND DOWN
  butCircleCloseTextInfo.display(panelInfoY);


}

