
void timeLine() {
  noStroke(); 
  //DISPLAY
  //    rectMode(CENTER);
  //  textAlign(CENTER);
  //  textSize(10);
  //  x = margenX + lado;
  int selectorPosY = 160 + 375;
  int displace = mouseX;
  int barColorW = 2024;

//STRINGS & ARRAYS
  color colorsHistory[] = { #79ACD9, #085A8C, #0C4459, #D9A84E, #BF5239, #DFE0AF    };
  String[][] periodDictatorship = {  
      {  "1962", "Title of 1962", "This is the text detail of number 1\n This is a new Line"  }, 
      {  "1970", "Title of 1962", "This is the text detail of number 1\n This is a new Line"  }, 
      {  "1973", "Title of 1973", "This is the text detail of number 1\n This is a new Line"  }, 
      {  "1980", "Title of 1980", "This is the text detail of number 2\n This is a new Line"  }, 
      {  "1987", "Title of 1987", "This is the text detail of number 3\n This is a new Line"  }, 

      {  "1989", "Title of 1991", "This is the text detail of number 4\n This is a new Line"  },
      {  "1991", "Title of 1973", "This is the text detail of number 1\n This is a new Line"  }, 
      {  "1998", "Title of 1980", "This is the text detail of number 2\n This is a new Line"  }, 
      {  "2005", "Title of 1987", "This is the text detail of number 3\n This is a new Line"  }, 
      {  "2013", "Title of 1991", "This is the text detail of number 4\n This is a new Line"  },

      };
      
  String[][] periodDemocracy = {  
      {  "1991", "Title of 1973", "This is the text detail of number 1\n This is a new Line"  }, 
      {  "1998", "Title of 1980", "This is the text detail of number 2\n This is a new Line"  }, 
      {  "2005", "Title of 1987", "This is the text detail of number 3\n This is a new Line"  }, 
      {  "2013", "Title of 1991", "This is the text detail of number 4\n This is a new Line"  },
      };

//BOX BG IMAGES AND TEXT
  pushMatrix();
    rectMode(CORNER);
    fill(40);
    rect(0, 160, 1024, /*capa[i].height +*/ 374);
    fill(80);
    rect(margenX, 160, 1024-margenX*2, /*capa[i].height +*/ 374);
  popMatrix();

//VER
//CALC TIME 
  if (mousePressed && mouseButton == LEFT) {
    if ((mouseY > selectorPosY - lado / 2 - tolerancia) && (mouseY < selectorPosY + lado / 2 + tolerancia)) {
      float distancia = dist(mouseX, 0, posX, 0);
      float vel = map(distancia, 10, width - 10, 0.5, 150);

      if (mouseX > posX) {
        if (pmouseX < width - margenX/2 - lado/2) posX += vel;
      } else if (mouseX < posX) {
         if (pmouseX > margenX/2 + lado/2) posX -= vel;
      }
      //cmtstrains the marker
//ORIG        posX = constrain(posX, (lado + border), (width - margenX/2 - lado - border));
        posX = constrain(posX, (lado + border), (width - margenX/2 - lado - border));
      }
  }//close If calc tine


//VER
//COLOR AREA SELECTOR
 pushMatrix();
  fill(30);//BG of the BG
  rect(0, selectorPosY, 1024, barH);
  fill(timeLineAreaSelectorCurrentColor);//BG barra timeLine to be put i the  buttons??
  rect(margenX-displace, selectorPosY, barColorW - margenX*2, barH);

//Moving indicatorPeriod
  pushMatrix();
    beginShape();
      vertex(70+movingIndicatorPeriodX, 0+selectorPosY+barH);
      bezierVertex(movingIndicatorPeriodX+50,0+selectorPosY+barH,   movingIndicatorPeriodX+0,0+selectorPosY+barH,   movingIndicatorPeriodX+0,70+selectorPosY+barH );
      bezierVertex(0+movingIndicatorPeriodX,0+selectorPosY+barH,   -50+movingIndicatorPeriodX,0+selectorPosY+barH,   -70+movingIndicatorPeriodX,0+selectorPosY+barH);
    endShape();
  popMatrix();
//  rect(movingIndicatorPeriodX, selectorPosY+barH, 10, barH);//element that moves



//SELECTOR MOVE. small square. Once corrected the dates, use this
   fill(colorsHistory[4]);
//  rect(posX, selectorPosY, 2*lado, lado - border);
   rect(posX, selectorPosY-32, lado/2, lado);
 popMatrix();



//Loop trough images and text
  for (int i = 0; i < periodDictatorship.length; i++) {
    float pt = map(int(periodDictatorship[i][0]), 1960, 2014, margenX + lado, width - margenX - lado);

    text(periodDictatorship[i][1], pt-displace, selectorPosY+ 35);//titles of events

    if (dist(posX, selectorPosY, pt-displace, selectorPosY) <= lado) {
      fill(200, 0, 0);
      //        ellipse(pt, y, 5, 15);//Events Elements "onOver"
      //text(periodDemocracy[i][1], pt, selectorPosY - 40);

      //IMAGES AND TEXT PANEL 
      pushMatrix();
        image(imgsTimeLine[i], margenX+10, 170);//position image
        //TEXT TITLE
        fill(255);
        textSize(20); textAlign(LEFT); text(periodDictatorship[i][1], 480, 190); 
        //TEXT CONTENT
        fill(255);
        textSize(16); textAlign(LEFT); text(periodDictatorship[i][2], 480, 225); 
      popMatrix();
    }
//      else {// it works for something or not.? 
//        fill(0, 200, 0);
//        //ellipse(pt, selectorPosY, 5, 15);
//      }


//ver displace
  //EVENTS POINTS
//    fill(150, 150, 200);
    rect(pt-displace, selectorPosY, 20, 15);// ellipses stand
    //YEARS
    fill(colorsHistory[5]);
    textAlign(CENTER);
    textSize(10);
    text(periodDictatorship[i][0], pt-displace, selectorPosY + 55); // TEXT YEARS BOTTOM SELECTOR
  }

}//ENDS TIMELINE CLASS

