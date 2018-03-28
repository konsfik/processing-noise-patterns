/*
  Author: Konstantinos Sfikas
  Date: March 2018
  Platform: Processing 3.3.6
*/

/*
  Example 3:
  
  In this example, two separate maps are added together, using the
  HeightMap's AddMap() function
  The result is a noise that works on two scales.
  Multiple layers can be used in this way in order to create even more complex noises...
  
  The algorithm also stores snapshots, each time it is run (see below for more details)
*/

HeightMap hm1;
HeightMap hm2;
float time = 0;

void setup(){
  size(600,600);  
 
  hm1 = new HeightMap(600,600,20,20,0,0,100);
  hm2 = new HeightMap(600,600,5,5,0,0,100);
  
}

void draw(){
  time += 0.01;
  hm1.UpdateSelf(20,20,0,0,time);
  hm1.SetRange(0,1);
  hm1.UpdateSelf(5,5,0,0,time*4);
  hm2.SetRange(0,2);
  hm1.AddMap(hm2);
  hm1.SetRange(-1,1);
  hm1.AbsoluteSelf();
  hm1.SetRange(255,0);
  
  float[] cells = hm1.GetCells();
  loadPixels();
  int cnt = 0;
  for(float cell:cells){
    pixels[cnt] = color((int)cell);
    cnt++;
  }
  updatePixels();
}