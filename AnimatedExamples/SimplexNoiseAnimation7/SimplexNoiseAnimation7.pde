/*
  Author: Konstantinos Sfikas
  Date: March 2018
  Platform: Processing 3.3.6
*/

float centerX = 10000;
float centerY = 10000;

float z = 0;
float rangeX = 6;
float rangeY = 6;
float speed = 0.015;

void setup(){
  size(800,800);
}

void draw(){
  z += speed;
  // centerX += 0.035;
  loadPixels();
  int index = 0;
  for(float j = 0; j < height; j++){
    for(float i = 0; i < width; i++){
      //int index = y * width + x;
      float x = RemapValue(i, 0, width, -rangeX/2, rangeX/2);
      float y = RemapValue(j, 0, height, -rangeY/2, rangeY/2);
      float currentX = x + centerX;
      float currentY = y + centerY;
      
      float value = (float)SimplexNoise.noise(currentX, currentY, z);
      value = Math.abs(value);
      int r = (int)RemapValue(value, 0, 1, 20, 225);
      int g = (int)RemapValue(value, 0, 1, 0, 200);
      int b = (int)RemapValue(value, 0, 1, 10, 160);
      color c = color(r,g,b);
      pixels[index] = c;
      
      index++;
    }
  }
  updatePixels();
}

public float RemapValue(float initVal, float initRangeMin, float initRangeMax, float finRangeMin, float finRangeMax){
  float finalVal = finRangeMin + (initVal-initRangeMin)*(finRangeMax-finRangeMin)/(initRangeMax-initRangeMin);
  return finalVal;
}