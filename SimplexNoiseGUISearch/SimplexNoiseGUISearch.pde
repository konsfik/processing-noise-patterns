

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

void setup(){
  size(400,400);

}

void draw(){
  // z += speed;
  // centerX += 0.035;
  ZTranslation = (float)mouseX / 200;
  loadPixels();
  int index = 0;
  float maxV = (float)Math.sqrt(3.0)/2.0;
  println(maxV);
  for(float j = 0; j < height; j++){
    for(float i = 0; i < width; i++){
      //int index = y * width + x;
      float x = RemapValue(i, 0, width, -rangeX/2, rangeX/2);
      float y = RemapValue(j, 0, height, -rangeY/2, rangeY/2);
      float currentX = x + centerX;
      float currentY = y + centerY;
      
      float value = (float)SimplexNoise.noise(currentX, currentY, ZTranslation);
      
      value = RemapValue(value, -maxV, maxV, -1, 1);
      // value = Math.abs(value);
      int r = 0;
      int g = 0;
      int b = 0;
      if(value > 0){
        r = (int)RemapValue(value, 0, 1, 20, 225);
        g = (int)RemapValue(value, 0, 1, 30, 200);
        b = (int)RemapValue(value, 0, 1, 10, 160);
      }
      else{
        r = (int)RemapValue(value, 0, -1, 20, 100);
        g = (int)RemapValue(value, 0, -1, 30, 200);
        b = (int)RemapValue(value, 0, -1, 10, 160);
      }
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