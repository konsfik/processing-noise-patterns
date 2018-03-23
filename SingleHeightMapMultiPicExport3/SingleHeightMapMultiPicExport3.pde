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

float[] rangesX = {2,4,8,16,32};
float[] rangesY = {2,4,8,16,32};
float[] minHeightRanges = {0,63,127,191,255};
float[] maxHeightRanges = {0,63,127,191,255};
float[] zTranslationValues = {0,100};
int[] picSizes = {4096};

void setup(){
  size(100,100);  
  
  int numImages = rangesX.length * rangesY.length 
    * minHeightRanges.length * maxHeightRanges.length 
    * zTranslationValues.length * picSizes.length;
  int cnt = 0;
  int numRangesX = rangesX.length;
  int numRangesY = rangesY.length;
  int numMinHeightRanges = minHeightRanges.length;
  int numMaxHeightRanges = maxHeightRanges.length;
  for(int i = 0; i < numRangesX; i++){
    for(int j = i; j < numRangesY; j++){
      for(int k = 0; k <= numMinHeightRanges-2; k++){
        for(int m = k+1; m <= numMaxHeightRanges-1; m++){
          for(float zTranslationValue : zTranslationValues){
            for(int picSize : picSizes){
              float rangeX = rangesX[i];
              float rangeY = rangesY[j];
              float minHeightRange = minHeightRanges[k];
              float maxHeightRange = maxHeightRanges[m];
              hm1 = new HeightMap(picSize,picSize,rangeX,rangeY,0,0,zTranslationValue);
              hm1.SetRange(minHeightRange,maxHeightRange);
              myImage = createImage(picSize,picSize,RGB);
              float[] cells = hm1.GetCells();
              for(int cc = 0; cc < cells.length; cc++){
                myImage.pixels[cc] = color((float)cells[cc]);
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