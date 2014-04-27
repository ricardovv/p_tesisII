
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
  void display(float _y) {
      newY = int(_y);//to track changes in Y position 
    //update 
    if ( overCircle(circX, circY+newY, circSize) ) {
      botOver = true;
    } 
    else {
      botOver = false;
    }//end update 

      //change color button state
      //change color button and state
    if (botOver) {
      if (mousePressed == true) {         
        botCurrentColor = botColorPressed;
        //select button
        if (text == "close") { 
          textBoxUp = false;
        }
        if (text == "open") { 
          textBoxUp = true;
        }

      //JUST FOR THE INFO PANEL
      if(panelInfoUp) {
        if (text == "close") { 
          panelInfoUp = false;
        }
        else if(text == "open") { 
          panelInfoUp = true;
        }
      }//CLOSE JUST FOR PANEL
    } 
      else {
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

void textBox(float _posX, float _posY) {
  float  posX = _posX;
  //  float posY =_posY;
  if (textBoxUp) {
    textBoxPosY = lerp(textBoxPosY, 100, .1);
  }
  else {
    textBoxPosY = lerp(textBoxPosY, 600, .1);
  }
  pushMatrix();
//  translate(0, textBoxPosY);
//      panelInfo(0);
  rect(0, 0, 400, 200);
  
  popMatrix();
}//CLOSE textBox



