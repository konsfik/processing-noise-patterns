/*
  Author: Konstantinos Sfikas
  Date: March 2018
  Platform: Processing 3.3.6
*/

float centerX = 10000;
float centerY = 10000;

float z = 0;

void setup(){
  size(400,400);
}

void draw(){
  z += 0.015;
  // centerX += 0.035;
  loadPixels();
  int index = 0;
  for(float j = 0; j < height; j++){
    for(float i = 0; i < width; i++){
      //int index = y * width + x;
      float x = RemapValue(i, 0, width, 0, 10.0);
      float y = RemapValue(j, 0, height,0, 10.0);
      float currentX = x + centerX;
      float currentY = y + centerY;
      
      float value = (float)SimplexNoise.noise(currentX, currentY, z);
      float absValue = Math.abs(value);
      float colorValue = RemapValue(absValue, 0, 1.0, 255, 0);
      
      color c = color(colorValue);
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