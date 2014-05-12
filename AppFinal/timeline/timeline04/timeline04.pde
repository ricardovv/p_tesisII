//int posXGuides;
//lado

//VARIABLES TIMELINE KEEP IT IN MAIN STRIUCTUE
PImage[] imgsTimeLine = new PImage[10];
int lado = 30;//dimensions box and timeline, borders?
int margenX = 100;// margin form the border
int tolerancia = 10;
int border = 3;
int barH =  80;// height ogf the bar top select yeatrs 
int posX = 100;
    int displace = mouseX;//Displaces interactive bar to periods

//Positions Periods
int buttonPeriod1X = 0;
int buttonPeriod2X = 300;
int buttonPeriod3X = buttonPeriod2X + 275;
int buttonPeriod1W = 300;
int buttonPeriod2W = 275;
int buttonPeriod3W = 450;
int movingIndicatorPeriodX = buttonPeriod1X + 200;
  
//colors butotns historic periods
color timeLineColor1 = color(20, 40, 20);
color timeLineColor2 = color(70, 40, 0);
color timeLineColor3 = color(20, 40, 80);
//COLOR AREA SELECTOR
color timeLineAreaSelectorCurrentColor = timeLineColor1;

void setup() {
  size(1024, 768); 
  //IMAGES TIMELINE
  for ( int i = 0; i < imgsTimeLine.length; i++ ) {
    imgsTimeLine[i] = loadImage("imgTimeLine/"+i+".jpg" );
    println("- " + imgsTimeLine[i]);
  }

}//CLOSE SETUP


void draw() {
  background(10);
  //TIMELINE
  TimeLineMain(100);      
}//CLOSE DRAW
 

