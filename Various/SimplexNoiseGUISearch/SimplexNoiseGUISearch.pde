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


HeightMap hm;

void setup(){
  size(400,400);
  hm = new HeightMap(400,400,20,20,100);
  hm.UpdateSelf();
  hm.NormalizeSelf();
}

void draw(){
  
  loadPixels();
  float[] cells = hm.GetCells();
  for(int i = 0; i < cells.length; i++){
    pixels[i] = color((int)cells[i]);
  }
  updatePixels();
}