/*
to do list

add branches
add flashes
optimize colors
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

/*(222, 255, 254) or (147, 185, 223) (Lightning Bolt Blue)
Storm Atmosphere: (34, 29, 84) (Deep background night blue)
Golden/Warm Flash: (252, 192, 30) (Lightning Yellow)
 Set your RGB light or bulb to a high-intensity white or pale blue strobe or 
 flashing mode to mimic a sudden flash.rapidly toggle the power on and off 
 to create a realistic, erratic storm rhythm.Color Gels/Mixing: 
 Add a slight cyan or blue hue to the bright white base to
 give the flash a dramatic, cinematic weather feel.
*/
void setup(){
  size(800, 800);
  background(0, 4, 53);
  savedTime = millis(); // store the starting time
}

void draw(){
  
  // how much time has passed since lsat save
  int passedTime = millis() - savedTime;
  
  /*
  if (passedTime > totalTime) {
    println("2 seconds have passed!");
    savedTime = millis(); // Reset the timer
  }
  */
  
  //REPLACE HERE
  if (passedTime > totalTime && endY <= height && endY >= 0){ // <--REPLACE
  //REPLACE HERE
  
  //if (passedTime > totalTime && endBranches[i + 1] <= height && endBranches[i + 1] >= 0){
    
    for (int i = 0; i < activeBranches*2; i += 2){
      //activeBranches limits how far it iterates thru the array of coords
      //replace x
     endBranches[i] = startBranches[i] + (int)(Math.random() * (3) * speed) - (int)(2.5 * speed);
     // replace y (stored an index past x)
     endBranches[i + 1] = startBranches[i] + (int)(Math.random() * 5 * speed);
     
     stroke(222, 255, 254);
     strokeWeight(thicc); //originally 2
     line(startBranches[i], startBranches[i + 1], endBranches[i], endBranches[i + 1]);
     
     startBranches[i] = endBranches[i];
     startBranches[i + 1] = endBranches[i + 1];
    }
    
    /*
    endX = startX + (int)(Math.random() * 3 * speed) - (int)(2.5 * speed);
    endY = startY + (int)(Math.random() * 5 * speed);
    
    stroke(222, 255, 254);
    strokeWeight(thicc); //originally 2
    line(startX, startY, endX, endY);

    startX = endX;
    startY = endY;
    
    */
    
    savedTime = millis();
    speed *= 1.5; //acceleration
    thicc = (int)(Math.random()*3) + 3;
  }
  
}

void mousePressed(){
  /// screen clear
  background(0, 4, 53); 
  thicc = (int)(Math.random()*4) + 2;
  
  /*
  //make it start from a random side
   startX = (int)(Math.random()*(width-250)) + 250;
   startY = 0;
   endX = (int)(Math.random()*width);
   endY = 0;
  */ 
  
   
   for (int i = 0; i <= activeBranches*2; i += 2){
   startBranches[i] = (int)(Math.random()*(width-250)) + 250;
   startBranches[i + 1] = 0; 
   endBranches[i] = (int)(Math.random()*width);
   endBranches[i + 1] = 0;
   }
   
   savedTime = millis(); //resave
   speed = 2.5;
}
