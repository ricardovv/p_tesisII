//int posXGuides;


//VARIABLES TIMELINE KEEP IT IN MAIN STRIUCTUE
//PImage guia; // image bg 
PImage[] imgsTimeLine = new PImage[10];

  int lado = 30;//dimensions box and timeline, borders?
  int margenX = 100;// margin form the border
  int  tolerancia = 20;
  int  borda = 3;
  int barH =  60;// height ogf the bar top select yeatrs 
  int posX = 100;
  
  //Positions Periods
 int buttonPeriod1X = 0;
 int buttonPeriod2X = 300;
 int buttonPeriod3X = buttonPeriod2X + 275;
 int buttonPeriod1W = 300;
 int buttonPeriod2W = 275;
 int buttonPeriod3W = 450;
 int movingIndicatorPeriodX = buttonPeriod1X + 200;
  
  //colors butotns historic periods
  color timeLineColor1 = color(30, 70, 40);
  color timeLineColor2 = color(70, 40, 0);
  color timeLineColor3 = color(20, 40, 80);
  //COLOR AREA SELECTOR
  color timeLineAreaSelectorCurrentColor = timeLineColor1;


void setup() {
  size(2024, 768);
//  guia = loadImage("imgs/guia.jpg");//imagen bg
 
  //IMAGES TIMELINE
  for ( int i = 0; i < imgsTimeLine.length; i++ ) {
    imgsTimeLine[i] = loadImage("imgs/"+i+".jpg" );
    println("- " + imgsTimeLine[i]);
  }
}//CLOSE SETUP

void draw() {
   background(20);
//TIMELINE
   TimeLineMain(100);    
   
  // BG IMage reference
  if (keyPressed == true) {
    tint(255, 100);
//    image(guia, 0, 0);
  }

}//CLOSE DRAW
 

