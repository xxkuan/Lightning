/*
to do list

add branches - done
add flashes - fading into background color - done
optimize colors - nah
*/

/*(222, 255, 254) or (147, 185, 223) (Lightning Bolt Blue)
Storm Atmosphere: (34, 29, 84) (Deep background night blue)
Golden/Warm Flash: (252, 192, 30) (Lightning Yellow)
 Set your RGB light or bulb to a high-intensity white or pale blue strobe or 
 flashing mode to mimic a sudden flash.rapidly toggle the power on and off 
 to create a realistic, erratic storm rhythm.Color Gels/Mixing: 
 Add a slight cyan or blue hue to the bright white base to
 give the flash a dramatic, cinematic weather feel.
*/

int startX = 400;
int startY = 0;
int endX = 0;
int endY = 10;
float speed = 1.0;
float thicc = (int)(Math.random()*4) + 2;
int[] startBranches = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int[] endBranches = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
//store pairs, there are 10 total slots and 10/2 = 5 storable pairs
int activeBranches = 1;
//active branches will NOT go past 5!!

int savedTime;
int totalTime = 30; // milliseconds, control how fast segments generate

float flashAlpha = 0; //the transparency (A) in RGBA is alpha
float fadeSpeed = 5; //originally 15

//constant layer for drawing lightning
PGraphics lightningCanvas;

void setup(){
  size(800, 800);
  savedTime = millis(); // store the starting time
  
  //initialize canvas layer
  lightningCanvas = createGraphics(800, 800);
  lightningCanvas.beginDraw();
  lightningCanvas.background(0, 0, 0, 0);
  lightningCanvas.endDraw();
}

void draw(){
  background(0, 4, 53); 

  if (flashAlpha > 0) {
    fill(252, 192, 30, flashAlpha); 
    noStroke();
    rect(0, 0, width, height);
    flashAlpha -= fadeSpeed; 
  }
  
  //draw lightning canvas over background/flash
  image(lightningCanvas, 0, 0);

  int passedTime = millis() - savedTime;
  
  if (passedTime > totalTime && //brute force y coor check cuz lazy
  endBranches[1] <= height && endBranches[1] >= 0
  && endBranches[3] <= height && endBranches[3] >= 0
  && endBranches[5] <= height && endBranches[5] >= 0
  && endBranches[7] <= height && endBranches[7] >= 0
  && endBranches[9] <= height && endBranches[9] >= 0
  ){
    
    // basically like beginShape
    lightningCanvas.beginDraw();
    
    //loop through all active branches only
    for (int i = 0; i < activeBranches * 2; i += 2){
      endBranches[i] = startBranches[i] + (int)(Math.random() * (3) * speed) - (int)(2.5 * speed);
      endBranches[i + 1] = startBranches[i + 1] + (int)(Math.random() * 5 * speed);

      lightningCanvas.stroke(222, 255, 254);
      lightningCanvas.strokeWeight(thicc); 
      lightningCanvas.line(startBranches[i], startBranches[i + 1], endBranches[i], endBranches[i + 1]);
      
      startBranches[i] = endBranches[i];
      startBranches[i + 1] = endBranches[i + 1];
     
      if ((int)(Math.random()*20) == 0 && activeBranches < 5){
        // setup new start coords
        startBranches[activeBranches * 2] = startBranches[i];
        startBranches[activeBranches * 2 + 1] = startBranches[i + 1];
        activeBranches += 1;
        flashAlpha = 75;
        fadeSpeed += 3;
      }
    }
    
    lightningCanvas.endDraw(); // basically like endShape
    
    savedTime = millis();
    speed *= 1.1; //1.05 slow, 1.5 originally fast
    thicc = (int)(Math.random()*3) + 3;
  }
}

void mousePressed(){
  flashAlpha = 255; 
  
  // reset canvas
  lightningCanvas.beginDraw();
  lightningCanvas.background(0, 0, 0, 0);
  lightningCanvas.endDraw();
  
  thicc = (int)(Math.random()*4) + 2;
  activeBranches = 1;
  
  for (int i = 0; i < activeBranches * 2; i += 2){
    startBranches[i] = (int)(Math.random()*((int)width-250)) + 250;
    startBranches[i + 1] = 0; 
    endBranches[i] = startBranches[i];
    endBranches[i + 1] = 0;
  }
   
  //reset all coords
  for (int i = activeBranches * 2; i < 10; i++) {
    startBranches[i] = 0;
    endBranches[i] = 0;
  }
   
  savedTime = millis(); 
  speed = 2.5;
}
