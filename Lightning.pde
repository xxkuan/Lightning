int startX = 0;
int startY = 150;
int endX = 0;
int endY = 150;
float speed = 2.5;

int savedTime;
int totalTime = 2000; // 2 seconds in milliseconds

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
  background(0, 0, 0);
  savedTime = millis(); // Store the starting time
}

void draw(){
  
  // Calculate how much time has passed
  int passedTime = millis() - savedTime;
  
  // Check if the desired time has passed
  if (passedTime > totalTime) {
    println("2 seconds have passed!");
    savedTime = millis(); // Reset the timer
  }
  
  stroke(222, 255, 254);
  strokeWeight(2);
  
  while (endX <= 800 && endX >= 0){
    endX = startX + (int)(Math.random()*1*speed);
    endY = startY + (int)(Math.random()*2*speed) - 2;
    line(startX, startY, endX, endY);

    startX = endX;
    startY = endY;
  }
}

void mousePressed(){
  //make it start from a random side
   startX = 0; 
   startY = (int)(Math.random()*800); 
   endX = 0; 
   endY = (int)(Math.random()*800);
}

/*

int savedTime;
int totalTime = 2000; // 2 seconds in milliseconds

void setup() {
  size(400, 400);
  savedTime = millis(); // Store the starting time
}

void draw() {
  background(255);
  
  // Calculate how much time has passed
  int passedTime = millis() - savedTime;
  
  // Check if the desired time has passed
  if (passedTime > totalTime) {
    println("2 seconds have passed!");
    savedTime = millis(); // Reset the timer
  }
  
  // Draw a shape that reacts to time
  fill(0);
  ellipse(width/2, height/2, passedTime / 10, passedTime / 10);
}

*/
