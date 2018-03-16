/*
  Author: Konstantinos Sfikas
  Date: March 2018
  Platform: Processing 3.3.6
*/

/*
  Example 2: just a single height map, based on the simplex noise, 
  implemented by the use of the HeightMap class
  
  In this example, an abs() function is applied to the gradient map, 
  which creates an edge - like - effect.
  
  The algorithm also stores snapshots, each time it is run (see below for more details)
*/

HeightMap hm1;
boolean frameSaved = false;

// Settings
// You may change the values of these parameters and observe the changes in the resulting image.
float rangeX = 10;            // the X - range of the heightmap in actual units
float rangeY = 10;            // the Y - range of the heightmap in actual units
float centerX = 0;           // the X - value of the center of the map
float centerY = 0;           // the Y - value of the center of the map
float zTranslation = 500;    // the Z value of the map (a 3d version of simplex noise is used..)

void setup(){
  // set the screen size to 800 x 800 pixels
  size(800,800);  
  // create the heightmap
  hm1 = new HeightMap(800,800,rangeX,rangeY,centerX,centerY,zTranslation);
  hm1.SetRange(-1,1);
  hm1.AbsoluteSelf();
  // set the range of the heightmap to 0 - 255, so that it corresponds to black -> white
  hm1.SetRange(255,0);
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
    The image's name will contain information about the settings that produced it.
    in this way, you are able to reproduce the variations that you produce 
    while experimenting with the settings.
  */
  if(frameSaved == false){
    String imageName = "Exports/Heightmap-Example-2-";
    imageName += "RangeX-" + str(rangeX) + "-";
    imageName += "RangeY-" + str(rangeY) + "-";
    imageName += "centerX-" + str(centerX) + "-";
    imageName += "centerY-" + str(centerY) + "-";
    imageName += "Z-Translation-" + str(zTranslation) + "-";
    saveFrame(imageName);
    frameSaved = true;
  }
}