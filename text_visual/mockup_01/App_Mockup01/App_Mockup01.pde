//GRAL SCREEN SETTINGS
int w = 1000;
int h = 700;
float border = 20;
//DATA
float[] articlesOnChapter = { 
  2, 6, 2, 4, 3, 4, 10, 6, 15, 8, 2, 3, 2, 4, 3, 4, 10, 6, 15, 8, 1, 3, 2, 4, 3, 4, 10, 6, 15, 8
}; 

//WORKING AREA
float workingAreaW = w - border*2;
float workingAreaH = h - border*2;

int numberOfRect = 16;
float rectW        = workingAreaW / numberOfRect;
float rectH        = (workingAreaH/2) / (numberOfRect * 2);
int rectSpacerW  = 1;
int rectSpacerWTodos = rectSpacerW * numberOfRect;
float rectWFinal = rectW - rectSpacerWTodos;
float rectHFinal = rectH - rectSpacerWTodos;


void setup() {
  size(w, h);
  //noStroke();
  for (int i=0; i<articlesOnChapter.length; i++) {
    articlesOnChapterTotal(i);
    text("arrayTot = " + articlesOnChapterTotal(i), 100, 100 );
  }
}

void draw() {
  background(#73CDFC);
  translate(border, border);

  //WORKING AREA
  workingArea( 0, 0, workingAreaW, workingAreaH, color(#FFFFFF) ); 
  //DISPLAY TITLES
  TextTitle("This is the Title", 16, color(0), 0, 12);

  //DISPLAY RECTS
  for (int i=0; i<numberOfRect; i++) {
    for (int j=0; j<articlesOnChapter.length; j++) {
      float rectHFinal = rectH - rectSpacerW;

      TextTitle(Integer.toString(i), 8, color(0), rectW * i, h/2);

      fill(#3232FF);
      float articlesOnChapterNew = articlesOnChapter[i];
      rect(rectW * i, 0 + articlesOnChapterNew *j, rectWFinal, rectWFinal);
      textSize(5);
    }//DRAW j FOR
  }//DRAW i CLOSE
}//DRAW CLOSE




