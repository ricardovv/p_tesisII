//1- BUTOTN CIRCLE CLASS
//2- MAIN NAV BUTTONS AT THE TOP  
//3- BUTTONS CIRCLE CLOSE PANEL & TEXT SCROLL - - - - - - - - - - - - - - - - - - - - - - - - 
//4- TEXT BOX IN INFO SO FAR - - - - - - - - - - - - - - - - - - - - - - - - 
  
  
//1- BUTOTN CIRCLE CLASS - - - - - - - - - - - - - - - - - - - - - - - - 
//TO CLOSE AND OPEN TEXT BOXES IN TOPICS AND FOR INFO
class ButCircle {
  String text;
  float tw; 
  int circX, circY;  // Ellipse Button Pos
  int circSize;// Ellipse diameter
  color botColorNormal;
  color botColorOver;
  color botColorPressed;
  color botCurrentColor;
  boolean botOver;
int newY;
  //CONSTUCTOR
  ButCircle(int _x, int _y, int _size, String _t) {
    text = _t;
    tw = textWidth(text);
    circX = _x;
    circY = _y;
    circSize = _size + int(tw/2); 
    botColorNormal = color(30);
    botColorOver = color(100);
    botColorPressed = color(200, 0, 0);
    botCurrentColor = color(0);
    botOver = false;
  }//COONSTRUCTOR ENDS

  //METHODS
  //CHECK IF IS OVER OR NOT
  void display(float _y, String _buttonName) {
    String buttonName = _buttonName; 
    newY = int(_y);//to track changes in Y position 
    
    //update 
    if ( overCircle(circX, circY+newY, circSize) ) {
      botOver = true;
      //FOR PANEL INFO - CHANGE OVER STATE
      if (panelInfoOver == true) { // load INFO  
        panelInfoOver = false;//check overfor circle button on article scrolltext
      }//close if button info
      else if (panelInfoOver == false) {
        panelInfoOver = true;//check overfor circle button on article scrolltext
      }







      //FOR TEXT SCROLL - CHANGE OVER STATE
      if (textBoxOver == true) { // load INFO  
        textBoxOver = false;//check overfor circle button on article scrolltext
      }//close if button info
      else if (textBoxOver == false) {
        textBoxOver = true;//check overfor circle button on article scrolltext
      }







    } else {
      botOver = false;
    }//end update 


      //change color button and state
    if (botOver) {
      if (mousePressed == true) {         
        botCurrentColor = botColorPressed;
      } else {//select button
        botCurrentColor = botColorOver;
      }//mousePressed end
    }//if (botOver) END
    else { 
      botCurrentColor = botColorNormal;
   }
   
   //ELLIPSE BUTTON
   fill(botCurrentColor); 
   noStroke();
   ellipseMode(CENTER);
   ellipse(circX, circY+newY, circSize, circSize);//newY to track Y new posiiton when change true or false
   //TEXT BUTTON
   fill(250);
   textAlign(CENTER); 
   textSize(14);
   text(text, circX, circY+4+newY);
  }//DISPLAY END  

  //CHECK IF IS INSIDE
  boolean overCircle(int x, int y, int diameter) {  
    float disX = x - mouseX;
    float disY = y - mouseY + newY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } 
    else {
      return false;
    }
  }//overCircle

}//ButCircle CLASS CLOSE
//1- CLOSE BUTOTN CIRCLE CLASS - - - - - - - - - - - - - - - - - - - - - - - - 





//2- MAIN NAV BUTTONS AT THE TOP - - - - - - - - - - - - - - - - - - - - - - - - 
void buttonsTop(int _x, int _y, String _t) {
  int x1 = _x;
  int x2 = _x + gridUnit*2;
  int y1 = _y;
  int y2 = _y + gridUnit*2;
  int found = -1;
  int onOver = colorsButton[0];
  String titleButton = _t;
  //check mouse over
  if (mouseX>_x && mouseX<x2 && mouseY>y1 && mouseY<y2 ) {//if the mouse position is inside the specific rect. 
    found = 1;//select that specific rect
  } else{found = -1;}

  //FOR PANEL INFO - CHANGE OVER STATE - TO panelInfoUp in mouseReleased - Also in the text panel as button circle
  if (titleButton == "i") { 
    //For onOver 
    if(found == 1){panelInfoUp = true;}      
    if(found == -1){panelInfoUp = false;}
    //For void onRelease 
//    if(found == 1){panelInfoOver = true;}      
 //   if(found == -1){panelInfoOver = false;} 
  }//close if button info

  
  if (found >=0) {//check if there is a specific rect available.    
    if (mousePressed) {
      onOver = 150;
      //rect(x1, y1, x2, y2);//select the specific rect founded
      //test buttons to load HOME
      if (_t == "C") { // load HOME
        section = 1;
        panelInfoUp = false;//close info panel if is open
      }
      if (_t == "T") { // load TOPICS
        //TITLES AT THE TOP
        section = 2;
        panelInfoUp = false;//close info panel if is open
      }
      if (_t == "H") { // load HISTORY
        section = 3;
        panelInfoUp = false;//close info panel if is open
      }      
    }//close if (mousePressed)
    else {
      onOver = 80;
    }//close if mousePressed
  

}//close if found 
  
  rectMode(CORNERS);
  fill(onOver);
  rect(x1, y1, x2-1, y2);
  fill(colorsBg[0]);
  textSize(20);  
  textAlign(CENTER);
  //puts logo instead a letter in button to home
  if (_t == "C") {
    shape(logo, 5+_x, 10+_y, 240, 210);
  }
  else {
    text(_t, 20+_x, 27+_y);
  }
}//2- LOSE MAIN NAV BUTTONS AT THE TOP - - - - - - - - - - - - - - - - - - - - - - - - 





//3- BUTTONS CIRCLE CLOSE PANEL & TEXT SCROLL - - - - - - - - - - - - - - - - - - - - - - - - 
void mouseReleased() {   //PANEL INFO
  
/*  
  //PANEL INFO BUTTON - button in buttons top and paneltextScroll
 if(panelInfoOver == true){ //chek if buton is over

     if(panelInfoUp == true){  
          panelInfoUp = false;
      }  
      else if(panelInfoUp == false) {
          panelInfoUp = true;
      }

  } //PANEL INFO BUTTON CLOSE
*/

  //PANEL INFO BUTTON - button in buttons top and paneltextScroll
 if(textBoxOver == true){ //chek if buton is over

     if(textBoxUp == true){  
          textBoxUp = false;
      }  
      else if(textBoxUp == false) {
          textBoxUp = true;
      }

  } //PANEL INFO BUTTON CLOSE


}//3- CLOSE BUTTONS CIRCLE CLOSE PANEL & TEXT SCROLL - - - - - - - - - - - - - - - - - - - - - - - - 




