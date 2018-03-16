/*
  Author: Konstantinos Sfikas
  Date: March 2018
  Platform: Processing 3.3.6
*/



HeightMap hm1;
HeightMap hm2;
HeightMap hm3;

void setup(){
  size(800,800);
  hm1 = new HeightMap(800,800,10,10,100);
  hm2 = new HeightMap(800,800,5,5,500);
  hm3 = new HeightMap(800,800,10,10,100);
  //hm1.AbsoluteSelf();
  //hm2.AbsoluteSelf();
  //hm3.AbsoluteSelf();
  // hm1.UpdateSelf();
  // hm2.UpdateSelf();
  // hm1.AddMap(hm2);
  hm1.AbsoluteSelf();
  hm1.SetRange(1,0);
  hm2.SetRange(0,1);
  hm1.MultiplyMap(hm2);
  hm1.SetRange(0,255);
}

void draw(){
  //hm1.NormalizeSelf();
  float sc1 = (float)mouseX/(float)width * 50 + 1;
  float sc2 = (float)mouseY/(float)height * 50 + 1;
  hm1.UpdateSelf(sc1,sc1,100);
  hm2.UpdateSelf(sc2,sc2,100);
  hm1.AbsoluteSelf();
  hm1.SetRange(1,0);
  hm2.SetRange(0.25,1);
  hm1.AddMap(hm2);
  hm1.SetRange(0,255);
  hm2.SetRange(0,255);
  loadPixels();
  float[] cells1 = hm1.GetCells();
  float[] cells2 = hm2.GetCells();
  for(int i = 0; i < cells1.length; i++){
    color c = color((int)cells1[i],(int)cells2[i],0);
    pixels[i] = c;
  }
  updatePixels();
}