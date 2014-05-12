
void timeLine() {
  noStroke(); 
  //DISPLAY
  //    rectMode(CENTER);  //  textAlign(CENTER);  //  textSize(10);  //  x = margenX + lado;
  int selectorPosY = 160 + 375;
  int barColorW = 2024;

  //STRINGS & ARRAYS
  color colorsHistory[] = { #79ACD9, #085A8C, #0C4459, #D9A84E, #BF5239, #DFE0AF    };
  String[][] periodDictatorship = {  
      {  "1962", "Agrarian Reform", "This is the text detail of number 1\n This is a new Line"  }, 
      {  "1970", "S. Allende is elected President", "This is the text detail of number 1\n This is a new Line"  }, 
      {  "1973", "Coup in Chile", "This is the text detail of number 1\n This is a new Line"  }, 
      {  "1977", "Team to Write a New Constitution", "Ortuzar Commision This is the text detail of number 2\n This is a new Line"  }, 
      {  "1979", "New Constitution First Sketch", "This is the text detail of number 2\n This is a new Line"  }, 

      {  "1980", "Voting for New Constitution", "This is the text detail of number 2\n This is a new Line"  }, 
      {  "1981", "New Constitution Enacted", "This is the text detail of number 2\n This is a new Line"  }, 
      {  "1986", "Attempt on Pinochet", "This is the text detail of number 2\n This is a new Line"  }, 
      {  "1988", "Plebiscite of NO", "This is the text detail of number 3\n This is a new Line"  }, 
      {  "1990", "New Democrat President", "This is the text detail of number 1\n This is a new Line"  }, 

      };
      
  String[][] periodDemocracy = {  
      {  "1994", "Eduardo Frei, President", "This is the text detail of number 2\n This is a new Line"  }, 
      {  "1991", "Jaime Guzman  Killed", "This is the text detail of number 2\n This is a new Line"  }, 
      {  "2005", "Constitutional Reforms", "This is the text detail of number 4\n This is a new Line"  },
      {  "2011", "Students Movement", "This is the text detail of number 4\n This is a new Line"  },
/*      {  "2000", "Ricardo Lagos, President", "This is the text detail of number 3\n This is a new Line"  }, 

      {  "2006", "Michelle Bachelet, President", "This is the text detail of number 1\n This is a new Line"  }, 
      {  "2010", "Sebastian Pinera, President", "This is the text detail of number 2\n This is a new Line"  }, 
      {  "2011", "Students Movement", "This is the text detail of number 4\n This is a new Line"  },
      {  "2014", "Michelle Bachelet, President", "This is the text detail of number 3\n This is a new Line"  }, 
*/  
    };



  //BOX BG IMAGES AND TEXT
  pushMatrix();
    rectMode(CORNER);
    fill(20);
    rect(0, 160, 1024, /*capa[i].height +*/ 374);
    fill(25);
    rect(margenX, 160, 1024-margenX*2, /*capa[i].height +*/ 374);
  popMatrix();

//VER
  //CALC TIME 
//  if (mousePressed /*&& mouseButton == LEFT*/) {
    if ((mouseY > selectorPosY - lado / 2 - tolerancia) && (mouseY < selectorPosY + lado / 2 + tolerancia)) {
      float distancia = dist(mouseX, 0, posX, 0);
//      float vel = map(distancia, 10, width - 10, 0.5, 150);
      float vel = map(distancia, 5, width - 5, 0.5, 150);

      if (mouseX > posX) {
        if (pmouseX < width - margenX/2 - lado/2) posX += vel;
      } else if (mouseX < posX) {
         if (pmouseX > margenX/2 + lado/2) posX -= vel;
      }
      //cmtstrains the marker
      //ORIG        posX = constrain(posX, (lado + border), (width - margenX/2 - lado - border));
        posX = constrain(posX, (lado + border), (width - margenX/2 - lado - border));
      }
//  }//close If calc time


//VER
 //COLOR AREA SELECTOR
 pushMatrix();
  fill(timeLineAreaSelectorCurrentColor);//BG FOR INTERACTIVE TIME BAR
  rect(0, selectorPosY, 1024, barH);
  fill(timeLineColor1);
  //BG 1 GREEN barra timeLine to be put i the  buttons??
  
  int largoBarraGreeen = barColorW-20;
  rect(margenX-displace, selectorPosY, largoBarraGreeen, barH);

  //BG 2 BROWN barra timeLine to be put i the  buttons??
  fill(timeLineColor2); 
  rect(margenX+450-displace, selectorPosY, barColorW - margenX*8, barH);
  // LINE 1973 ARRIBA
  stroke(250, 50, 0);line(margenX+450-displace, height-232, margenX+450-displace,  height-173 );
  noStroke();  //color(50, 30, 0)


  //BG 3 BLUE barra timeLine to be put i the  buttons??
  fill(timeLineColor3);
  rect(margenX+1020-displace, selectorPosY, barColorW - margenX*11, barH);

  textSize(40);text(displace, 200, 100);



  //Moving indicatorPeriod
  pushMatrix();
    fill(timeLineAreaSelectorCurrentColor);
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
//ORIG    float pt = map(int(periodDictatorship[i][0]), 1960, 2014, margenX + lado, width - margenX - lado);
    float pt = map(int(periodDictatorship[i][0]), 1960, 2014, margenX + lado, barColorW - margenX - lado);
    textLeading(10);textAlign(LEFT);
    text(periodDictatorship[i][1], pt-displace, selectorPosY+40, 55, 50);//titles of events

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
    }//CLOSE IF
//      else {// it works for something or not.? 
//        fill(0, 200, 0);//        //ellipse(pt, selectorPosY, 5, 15); }

//ver displace
  //EVENTS POINTS
    //    fill(150, 150, 200);
    rect(pt-displace, selectorPosY, 20, 15);// ellipses stand
    //YEARS
    fill(colorsHistory[5]);
    textAlign(CENTER);
    textSize(10);
    text(periodDictatorship[i][0], pt-displace, selectorPosY + 20, 30, 40); // TEXT YEARS BOTTOM SELECTOR
  }//CLOS E//Loop trough images and text

}//ENDS TIMELINE CLASS

