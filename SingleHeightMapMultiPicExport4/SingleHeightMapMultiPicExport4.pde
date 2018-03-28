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
PImage myImage;

void setup(){
  size(100,100); 
  
  Example1();
  Example2();
  Example3();
  Example4();
  Example5();
}

void draw(){
  
  exit();
}

public void Example1(){
  HeightMap hm1 = new HeightMap(1024,1024,5,5,0,0,100);
  hm1.SetRange(0,255);
  float[] cells = hm1.GetCells();
  PImage myImage = createImage(1024,1024,RGB);
  for(int cc = 0; cc < cells.length; cc++){
    myImage.pixels[cc] = color((float)cells[cc]);
  }
  myImage.save("Exports/Example1.png");
}

public void Example2(){
  HeightMap hm1 = new HeightMap(1024,1024,100,5,0,0,100);
  hm1.SetRange(0,255);
  float[] cells = hm1.GetCells();
  PImage myImage = createImage(1024,1024,RGB);
  for(int cc = 0; cc < cells.length; cc++){
    myImage.pixels[cc] = color((float)cells[cc]);
  }
  myImage.save("Exports/Example2.png");
}

public void Example3(){
  HeightMap hm1 = new HeightMap(1024,1024,5,5,0,0,100);
  hm1.SetRange(-1,1);
  hm1.AbsoluteSelf();
  hm1.SetRange(255,0);
  float[] cells = hm1.GetCells();
  PImage myImage = createImage(1024,1024,RGB);
  for(int cc = 0; cc < cells.length; cc++){
    myImage.pixels[cc] = color((float)cells[cc]);
  }
  myImage.save("Exports/Example3.png");
}

public void Example4(){
  HeightMap hm1 = new HeightMap(1024,1024,10,10,0,0,100);
  hm1.SetRange(-1,1);
  hm1.AbsoluteSelf();
  hm1.SetRange(1,0);
  HeightMap hm2 = new HeightMap(1024,1024,5,5,0,0,400);
  hm2.SetRange(0.25,0.75);
  hm1.MultiplyMap(hm2);
  hm1.SetRange(0,255);
  hm2.SetRange(0,255);
  float[] cells = hm1.GetCells();
  float[] cells2 = hm2.GetCells();
  PImage myImage = createImage(1024,1024,RGB);
  for(int cc = 0; cc < cells.length; cc++){
    myImage.pixels[cc] = color((float)cells[cc],(float)cells2[cc],(float)cells2[cc]);
  }
  myImage.save("Exports/Example4.png");
}

public void Example5(){
  HeightMap hm1 = new HeightMap(1024,1024,10,10,0,0,100);
  hm1.SetRange(-1,1);
  hm1.AbsoluteSelf();
  hm1.SetRange(60,120);
  
  HeightMap hm2 = new HeightMap(1024,1024,10,10,0,0,100);
  hm2.SetRange(-1,1);
  hm2.AbsoluteSelf();
  hm2.SetRange(63,255);


  float[] cells1 = hm1.GetCells();
  float[] cells2 = hm2.GetCells();
  PImage myImage = createImage(1024,1024,RGB);
  for(int cc = 0; cc < cells1.length; cc++){
    colorMode(HSB, 255);
    color col = color((int)cells1[cc],127,(int)cells2[cc]);
    myImage.pixels[cc] = col;
  }
  myImage.save("Exports/Example5.png");
}