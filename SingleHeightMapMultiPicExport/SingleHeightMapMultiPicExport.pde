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
float[] zTranslationValues = {0,100,200,400};
int[] picSizes = {64,128,256};

void setup(){
  size(100,100);  
  
  int numImages = rangesX.length * rangesY.length 
    * minHeightRanges.length * maxHeightRanges.length 
    * zTranslationValues.length * picSizes.length;
  int cnt = 0;
  for(float rangeX : rangesX){
    for(float rangeY : rangesY){
      for(float minHeightRange : minHeightRanges){
        for(float maxHeightRange : maxHeightRanges){
          for(float zTranslationValue : zTranslationValues){
            for(int picSize : picSizes){
              hm1 = new HeightMap(picSize,picSize,rangeX,rangeY,0,0,zTranslationValue);
              hm1.SetRange(minHeightRange,maxHeightRange);
              myImage = createImage(picSize,picSize,RGB);
              float[] cells = hm1.GetCells();
              for(int i = 0; i < cells.length; i++){
                myImage.pixels[i] = color((float)cells[i]);
              }
              String folderName = "Exports/";
              folderName += "size-" + str(picSize) + "/";
              String imageName = folderName + "img-";
              imageName += "rX-" + str(rangeX) + "-";
              imageName += "rY-" + str(rangeY) + "-";
              imageName += "mHr-" + str((int)minHeightRange) + "-";
              imageName += "MHr-" + str((int)maxHeightRange) + "-";
              imageName += "px-" + str(picSize) + "-";
              imageName += "zV-" + str(zTranslationValue) + "-";
              imageName += ".png";
              myImage.save(imageName);
              println("Image " + str(cnt) + " / " + str(numImages));
              cnt++;
            }
          }
        }
      }
    }
  }
}

void draw(){
  
  exit();
}