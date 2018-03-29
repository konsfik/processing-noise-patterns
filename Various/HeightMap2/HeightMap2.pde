/*
  Author: Konstantinos Sfikas
  Date: March 2018
  Platform: Processing 3.3.6
*/



HeightMap hm1;
HeightMap hm2;
HeightMap hm3;

float time = 0;

void setup(){
  size(800,800);
  hm1 = new HeightMap(800,800,10,10,100);
  hm2 = new HeightMap(800,800,10,10,100);
  hm3 = new HeightMap(800,800,10.5,10.5,100);
  hm1.SetRange(0,255);
  hm2.SetRange(0,255);
  hm3.SetRange(0,255);
}

void draw(){
  time += 0.1;
  float ss1 = (float)Math.sin(time)*0.5 + 10.5;
  float ss2 = (float)Math.sin(time + Math.PI)*0.5 + 10.5;
  //float ss = ((float)mouseX/(float)width)*5 + 10;
  hm2.UpdateSelf(ss1,ss1,100);
  hm3.UpdateSelf(ss2,ss2,100);
  hm2.SetRange(0,255);
  hm3.SetRange(0,255);
  loadPixels();
  float[] cells1 = hm1.GetCells();
  float[] cells2 = hm2.GetCells();
  float[] cells3 = hm3.GetCells();
  for(int i = 0; i < cells1.length; i++){
    color c = color((int)cells1[i],(int)cells2[i],(int)cells3[i]);
    pixels[i] = c;
  }
  updatePixels();
}