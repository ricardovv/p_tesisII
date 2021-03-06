// hacer clases botones panel

//TEXT BOX FOR INFO
void panelInfo(float _infoY) {
  int infoW = w - gridUnit*4;
  int infoH = h - gridUnit*3;
  float infoYAll = _infoY;
  rectMode(CORNER);

  //sans font w createFont
  textFont(fontBodyText);

  pushMatrix();
  translate(0, infoYAll);
  //CAJA 1
  fill(0, 150);
  noStroke();  
  rect(0, gridUnit*2, w, h);//position rect BG 

  //CAJA BG TRANSPARENT
  int infoX = gridUnit*2;
  int infoY = gridUnit*4;
  fill(colorsBgSectionsBlues[1]);//COLOR BG TEXT
  noStroke();  
  rect(infoX, infoY, infoW, infoH-gridUnit*3 );

  //BG IMAGE OR DESIGN?
  fill(0, 0, 250);
  noStroke();  
  //    rect(infoX, infoY, infoW, gridUnit*6);

  //TEXT
  int textPosX = infoX*10;
  int textPosY = infoY + gridUnit*2;//position of texts
  int textW = 500;
  smooth();
  fill(200);
  stroke(200);
  textFont(fontBodyText);
  textAlign(LEFT);
  textSize(20);
  text("ABOUT THE PROJECT\n", textPosX, textPosY-10, textW, 400);  
  textSize(14);
  text("MOTIVATION\n" + panelInfo[0], textPosX, textPosY+gridUnit*3, textW, 400);
  text("CREDITS & SOURCES\n" + panelInfo[1], textPosX, textPosY+gridUnit*9, textW, 400);
  text("ACKNOWLEDGMENTS\n" + panelInfo[2], textPosX, textPosY+gridUnit*15, textW, 400);
  text(panelInfo[3], textPosX, textPosY+gridUnit*25, textW, 400);

  shape(graphics_logo, 130, textPosY, 180, 240);


  if (panelInfoUp) {
    panelInfoY = lerp(panelInfoY, 0, .12);
  }
  else {
    panelInfoY = lerp(panelInfoY, 800, .12);
  }
  popMatrix();
  //TEXT PANET UP AND DOWN
  //butCircleCloseTextInfo.display(panelInfoY, "info");
}

