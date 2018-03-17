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
boolean frameSaved = false;

// Settings
// You may change the values of these parameters and observe the changes in the resulting image.
float rangeX1 = 5;            // the X - range of the heightmap in actual units
float rangeY1 = 5;            // the Y - range of the heightmap in actual units
float centerX1 = 0;           // the X - value of the center of the map
float centerY1 = 0;           // the Y - value of the center of the map
float zTranslation1 = 500;    // the Z value of the map (a 3d version of simplex noise is used..)
float rangeX2 = 10;            // the X - range of the heightmap in actual units
float rangeY2 = 10;            // the Y - range of the heightmap in actual units
float centerX2 = 0;           // the X - value of the center of the map
float centerY2 = 0;           // the Y - value of the center of the map
float zTranslation2 = 600;    // the Z value of the map (a 3d version of simplex noise is used..)

void setup(){
  // set the screen size to 800 x 800 pixels
  size(800,800);  
  // create the heightmap
  hm1 = new HeightMap(800,800,rangeX1,rangeY1,centerX1,centerY1,zTranslation1);
  hm2 = new HeightMap(800,800,rangeX2,rangeY2,centerX2,centerY2,zTranslation2);
  hm1.SetRange(0,1);
  hm2.SetRange(0,0.5);  // set hm2's intensity a bit lower (range: 0 to 0.5)
  hm1.AddMap(hm2);
  hm1.SetRange(0,255);
}

void draw(){
  loadPixels();
  float[] cells = hm1.GetCells();
  for(int i = 0; i < cells.length; i++){
    color c = color((int)cells[i]);
    pixels[i] = c;
  }
  updatePixels();
  /* 
    Every time that the algorith is run, it will automatically
    save one frame as an image file.
  */
  if(frameSaved == false){
    String imageName = "Exports/Heightmap-Example-3.png";
    saveFrame(imageName);
    frameSaved = true;
  }
}