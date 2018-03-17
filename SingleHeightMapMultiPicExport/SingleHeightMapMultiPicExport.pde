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

float[] rangesX = {2,4,8,16,32,64,128};
float[] rangesY = {2,4,8,16,32,64,128};
float[] minHeightRanges = {0,63};
float[] maxHeightRanges = {191,255};


void setup(){
  // set the screen size to 800 x 800 pixels
  size(100,100);  
  int cnt = 0;
  for(float rangeX : rangesX){
    for(float rangeY : rangesY){
      for(float minHeightRange : minHeightRanges){
        for(float maxHeightRange : maxHeightRanges){
          float z = random(1000);
          hm1 = new HeightMap(1024,1024,rangeX,rangeY,0,0,z);
          hm1.SetRange(minHeightRange,maxHeightRange);
          myImage = createImage(1024,1024,RGB);
          float[] cells = hm1.GetCells();
          for(int i = 0; i < cells.length; i++){
            myImage.pixels[i] = color((float)cells[i]);
          }
          String imageName = "Exports/img-";
          imageName += "rX-" + str(rangeX) + "-";
          imageName += "rY-" + str(rangeY) + "-";
          imageName += "minhr-" + str((int)minHeightRange) + "-";
          imageName += "maxhr-" + str((int)maxHeightRange) + "-";
          imageName += ".png";
          myImage.save(imageName);
          cnt++;
        }
      }
    }
  }
}

void draw(){
  
  exit();
}