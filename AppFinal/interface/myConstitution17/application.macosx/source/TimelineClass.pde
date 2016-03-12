//BASES ON AN EXAMPLE FORM INTERENET, I CAN REMEMBER WHERE. 

void timeLine() {
  noStroke(); 
  //DISPLAY
  //    rectMode(CENTER);  //  textAlign(CENTER);  //  textSize(10);  //  x = margenX + lado;
  int selectorPosY = 160 + 375;
  int barColorW = 2024;

  //STRINGS & ARRAYS
  color colorsHistory[] = { #79ACD9, #085A8C, #0C4459, #D9A84E, #BF5239, #DFE0AF    };
  String[][] periodDictatorship = {  
      {  "1962", "Agrarian Reform", "Pretended improving agricultural production levels through the slow modification of the system of land tenure. Sought to end the old landowning order which had prevailed for more than 400 years, had come to an end. It was a key process in the coming social changes."  }, 
      {  "1970", "S. Allende President", "Allende began to carry out his platform of implementing a socialist programme called La vía chilena al socialismo (\"the Chilean Path to Socialism\"). This included nationalization of large-scale industries (notably copper mining and banking), and government administration of the health care system, educational system, a programme of free milk for children in the schools, etc."  }, 
      {  "1973", "Coup in Chile", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "1977", "Writers Team", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "1979", "New Constitution Sketch", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 

      {  "1980", "Voting New Constitution", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "1981", "New Constitution Enacted", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "1986", "Attempt on Pinochet", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "1988", "NO Plebiscite", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "1990", "Democrat President", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 

      };
      
  String[][] periodDemocracy = {  
      {  "1994", "E. Frei, President", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "1991", "J. Guzman  Killed", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  }, 
      {  "2005", "Constitution Reforms", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  },
      {  "2011", "Students Movement", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  },
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
    fill(10, 120 );
    rect(0, 100, 1024, /*capa[i].height +*/ 724);
    fill(5);
    rect(margenX, 115, 1024-margenX*2, /*capa[i].height +*/ 404);
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
//  textSize(40);text(displace, 200, 100);//test displace, not to be shown


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
   fill(colorsBgSectionsBlues[0]);
  //  rect(posX, selectorPosY, 2*lado, lado - border);
   rect(posX, selectorPosY-15, lado/3, lado/2-2);
  popMatrix();


//Loop trough images and text
  for (int i = 0; i < periodDictatorship.length; i++) {
//ORIG    float pt = map(int(periodDictatorship[i][0]), 1960, 2014, margenX + lado, width - margenX - lado);
    float pt = map(int(periodDictatorship[i][0]), 1960, 2014, margenX + lado, barColorW - margenX - lado);
    textLeading(11);textAlign(LEFT);
   fill(colorsBgSectionsBlues[0]);
   text(periodDictatorship[i][1], pt-displace, selectorPosY+37, 55, 50);//titles of events

    if (dist(posX, selectorPosY, pt-displace, selectorPosY) <= lado) {
      fill(200, 0, 0);
      //        ellipse(pt, y, 5, 15);//Events Elements "onOver"
      //text(periodDemocracy[i][1], pt, selectorPosY - 40);

      //IMAGES AND TEXT PANEL 
      pushMatrix();
        image(imgsTimeLine[i], margenX+10, 125);//position image
        //TEXT TITLE
        fill(colorsBgSectionsBlues[0]);
        textSize(20); textAlign(LEFT); text(periodDictatorship[i][1], 490, 150); 
        //TEXT CONTENT
        fill(colorsBgSectionsBlues[0]);
        textSize(14); textAlign(LEFT); text(periodDictatorship[i][2], 490, 200, 380, 300); 
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

  noStroke(); 
}//ENDS TIMELINE CLASS

