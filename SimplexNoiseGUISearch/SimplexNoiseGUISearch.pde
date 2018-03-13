/*
  Author: Konstantinos Sfikas
  Date: March 2018
  Platform: Processing 3.3.6
*/


float centerX = 10000;
float centerY = 10000;



float speed = 0.015;

/*
  Open - Ended Parameters...
*/
float rangeX = 6;
float rangeY = 6;
float ZTranslation = 0;
float heightRangeScale = 1;

float minimumBrightness = 0.0;
float maximumBrightness = 255.0;


void setup(){
  size(400,400);

}

void draw(){
  ZTranslation += speed;
  
  float yPercent = (float)mouseY / (float)height;
  float xPercent = (float)mouseX / (float)width;
  
  loadPixels();
  int index = 0;
  for(float j = 0; j < height; j++){
    for(float i = 0; i < width; i++){
      //int index = y * width + x;
      float x = RemapValue(i, 0, width, -rangeX/2, rangeX/2);
      float y = RemapValue(j, 0, height, -rangeY/2, rangeY/2);
      float currentX = x + centerX;
      float currentY = y + centerY;
      
      float simplexValue = (float)SimplexNoise.noise(
        currentX, 
        currentY, 
        ZTranslation
      );
      
      simplexValue = Math.abs(simplexValue);
      
      simplexValue *= xPercent * 4 - 2;
      simplexValue += yPercent * 4 - 2;
      
      int colorValue = (int)RemapValue(
        simplexValue, 
        -1, 1,
        minimumBrightness,maximumBrightness
      );
      
      if(colorValue < 0) colorValue = 0;
      else if(colorValue > 255) colorValue = 255;
      // else colorValue = 127;
      
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