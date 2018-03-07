

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


void setup(){
  size(400,400);

}

void draw(){
  // z += speed;
  // centerX += 0.035;
  // ZTranslation = (float)mouseX / 200;
  // heightRangeScale = RemapValue(mouseY, 0, height, 0.2,2.0);
  loadPixels();
  int index = 0;
  // calculate height range
  float heightRange = ((float)Math.sqrt(3.0)/2.0);
  println(heightRangeScale);
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
      
      /* simplexValue = (float)RemapValue(
        simplexValue, 
        -heightRange, heightRange, 
        -1.0, 1.0
      );*/
      
      simplexValue = Math.abs(simplexValue);
      
      int colorValue = (int)RemapValue(
        simplexValue, 
        0, 1,
        0.0,255.0
      );
      
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