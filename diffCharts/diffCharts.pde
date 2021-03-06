final int DEFAULT_CANVAS_WIDTH  = 900;
final int DEFAULT_CANVAS_HEIGHT = 700;
String CHART_TYPE = "R";   // P or B or R
String indep_var = "animate"; //dash or animate or bold
int P_count = 0;
int R_count = 1;
int B_count = 0;

import garciadelcastillo.dashedlines.*;

DashedLines dashed;
int dist = 0;

ExperimentKeeper experimentKeeper;

void setup(){
  fullScreen();
  int canvasWidth = DEFAULT_CANVAS_WIDTH;
  int canvasHeight = DEFAULT_CANVAS_HEIGHT;
  dashed = new DashedLines(this);
  dashed.pattern(10, 5);

  if(canvasWidth <= displayWidth && canvasHeight <= displayHeight){
    int canvasX = (displayWidth - canvasWidth) / 2;
    int canvasY = (displayHeight - canvasHeight) / 2;
    experimentKeeper = new ExperimentKeeper(canvasX, canvasY, canvasWidth, canvasHeight);
    surface.setResizable(false);
  }else{
    println("*** Display size < Canvas size ***");
    println("Display: " + displayWidth + "x" + displayHeight);
    println("Canvas: " + canvasWidth + "x" + canvasHeight);
    exit();
  }
}

void draw(){
  background(255);
  experimentKeeper.draw();  
}

void mouseClicked(){
  experimentKeeper.onMouseClickedAt(mouseX, mouseY);
}

void keyTyped(){
  experimentKeeper.onKeyTyped(key);
}