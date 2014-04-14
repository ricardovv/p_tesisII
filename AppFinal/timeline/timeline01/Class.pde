//CLASS
class TimeLine {
  //VARIABLES
  int lado, margenX;
  int tolerancia;
  float posX, y, borda;

  //CONSTRUCTOR 
  TimeLine(int _posX) {
    posX = _posX;

    //old variables
    lado = 30;//dimensions box and timeline, borders?
    margenX = 200;// margin form the border
    tolerancia = 20;
    borda = 3;
    //  x = margenX + lado;
    y = height - 180;
  }


  void display() {
    rectMode(CENTER);
    textAlign(CENTER);
    noStroke(); 
    textSize(10);
    color colorsHistory[] = { 
      #79ACD9, #085A8C, #0C4459, #D9A84E, #BF5239, #DFE0AF
    };
    String[][] periodDictatorship = {  
      {
        "1973", "Title of 1973", "This is the text detail of number 1\n This is a new Line"
      }
      , 
      {
        "1980", "Title of 1980", "This is the text detail of number 2\n This is a new Line"
      }
      , 
      {
        "1987", "Title of 1987", "This is the text detail of number 3\n This is a new Line"
      }
      , 
      {
        "1991", "Title of 1991", "This is the text detail of number 4\n This is a new Line"
      }
      ,
    };
    String[][] periodDemocracy = {  
      {
        "1991", "Title of 1973", "This is the text detail of number 1\n This is a new Line"
      }
      , 
      {
        "1998", "Title of 1980", "This is the text detail of number 2\n This is a new Line"
      }
      , 
      {
        "2005", "Title of 1987", "This is the text detail of number 3\n This is a new Line"
      }
      , 
      {
        "2013", "Title of 1991", "This is the text detail of number 4\n This is a new Line"
      }
      ,
    };

    //CALC TIME 
    if (mousePressed && mouseButton == LEFT) {
      if ((mouseY > y - lado / 2 - tolerancia) && (mouseY < y + lado / 2 + tolerancia)) {
        float distancia = dist(mouseX, 0, posX, 0);
        float vel = map(distancia, 10, width - 10, 0.5, 150);

        if (mouseX > posX) {
          if (pmouseX < width - margenX/2 - lado/2) posX += vel;
        }
        else if (mouseX < posX) {
          if (pmouseX > margenX/2 + lado/2) posX -= vel;
        }
        posX = constrain(posX, (0 + lado + borda), (width - margenX/2 - lado - borda));
      }
    }//close If calc tine


    //DRAWING
    fill(colorsHistory[3]);//BG barra timeLine
    rect(width / 2, y, width - margenX, lado);

    //Color Rect Time Selector
    fill(colorsHistory[4]);
    rect(posX, y, 2*lado, lado - borda);


    //box bg images
    pushMatrix();
    rectMode(CORNER);
    fill(90);
    rect(margenX/2, 160, width-margenX, /*capa[i].height +*/ 413);
    popMatrix();

    //Loop trough images and text
    for (int i = 0; i < periodDemocracy.length; i++) {
      float pt = map(int(periodDemocracy[i][0]), 1972, 2013, margenX + lado, width - margenX - lado);

      text(periodDemocracy[i][1], pt, y - 40);

      if (dist(posX, y, pt, y) <= lado) {
        fill(200, 0, 0);
        //        ellipse(pt, y, 5, 15);//Events Elements "onOver"
        text(periodDemocracy[i][1], pt, y - 40);

        //IMAGES AND TEXT PANEL 
        pushMatrix();
        image(capa[i], margenX/2+10, 170);//position image
        //TEXT TITLE
        textSize(24);
        textAlign(LEFT);
        fill(255);
        text(periodDemocracy[i][1], 480, 200); 
        //TEXT CONTENT
        textSize(16);
        textAlign(LEFT);
        fill(255);
        text(periodDemocracy[i][2], 480, 240); 
        popMatrix();
      }
      else {
        fill(0, 200, 0);
        ellipse(pt, y, 5, 15);
      }
      //EVENTS POINTS
      fill(0, 0, 200);
      ellipse(pt, y, 20, 20);
      //YEARS
      fill(colorsHistory[5]);
      textAlign(CENTER);
      textSize(14);
      text(periodDictatorship[i][0], pt, y + 35);
    }
  }
}//ENDS TIMELINE CLASS

