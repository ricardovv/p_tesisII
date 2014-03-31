//BUTTONS

int amt = 5;

int[] x1= new int[amt];
int[] x2= new int[amt];
int[] y1= new int[amt];
int[] y2= new int[amt];

color[] c = new color[amt];
color onClick;

void setup() {
  size(500, 500);
  background(20);
  rectMode(CORNERS);
  noStroke();

  //create positions for rects
  for (int i =0; i< amt; i++) {
    x1[i] = 0;
    x2[i] = 200;
    y1[i] = 50 *i;
    y2[i] = y1[i] + 50;
    c[i] = color( 250, 150, 150);
  }
}


void draw() {
  background(20);
  onClick = 100;

  int found = -1;//initial value to avoid conflict w array posiitons
  for (int i =0; i< amt; i++) {
    fill(c[i], onClick);
    rect(x1[i], y1[i], x2[i], y2[i]);

    //check mouse over
    if (mouseX>x1[i] && mouseX<x2[i] && mouseY>y1[i] && mouseY<y2[i] ) {//if the mouse position is inside the specific rect. 
      found = i;//select that specific rect
    }
  }

  //check if  is over specific rect
  if (found >=0) {//check if there is a specific rect available.
    if (mousePressed) {
      noFill();
      stroke(250);
      rect(x1[found], y1[found], x2[found], y2[found]);//select the specific rect founded
      noStroke();
    }//close if mousePressed
  }//close if found
}//CLOSE DRAW



/*
     -Educación
 espacio Público
 Privacidad
 Aguas
 Salud
 Patrimonio Público
 Igualdad de Género
 Libertad de Culto
 Derechos Humanos
 Elecciones
 Politicas Públicas
 Emprendimiento
 Sexualidad
 Libertad de Información
 Matrimonio
 Propiedad pirvada
 Acceso a la Información
 Cuidado a la Infancia
 Distribución de la Riqueza
 */
