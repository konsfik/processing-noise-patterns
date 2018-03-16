/*
  Author: Konstantinos Sfikas
  Date: March 2018
  Platform: Processing 3.3.6
*/

/*
  
*/

HeightMap hm1;
HeightMap hm2;

float time = 0;

void setup(){
  size(400,400);
  hm1 = new HeightMap(400,400,10,10,0,0,100);
  hm2 = new HeightMap(400,400,5,5,0,0,100);
  hm1.SetRange(0,1);
  hm2.SetRange(0,0.5);
  hm1.MultiplyMap(hm2);
  hm1.SetRange(0,255);
}

void draw(){
  ApplyTransformations();
  loadPixels();
  float[] cells = hm1.GetCells();
  for(int i = 0; i < cells.length; i++){
    color c = color((int)cells[i]);
    pixels[i] = c;
  }
  updatePixels();
}

public void ApplyTransformations(){
  time += 0.005;
  float centerX1 = 0; // time * 1;
  float centerX2 = 0; // time * 2;
  float zt1 = time*2;
  float zt2 = time;
  hm1.UpdateSelf(10,10,centerX1,0,zt1+100);
  hm2.UpdateSelf(10,10,centerX2,0,zt2);
  hm1.AbsoluteSelf();
  hm2.AbsoluteSelf();
  hm1.SetRange(1,0);
  hm2.SetRange(0,1);
  hm1.MultiplyMap(hm2);
  hm1.SetRange(0,255);
}