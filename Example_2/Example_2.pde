float noiseScale = 0.02;

float centerX = 10000;
float centerY = 10000;

HeightMap hm;

PImage myImg;

int[] imageSizes = {4096};
float[] rangesX = {1,4,16,64,256,1024,4096};
float[] rangesY = {1,4,16,64,256,1024,4096};

void setup(){
  // size(800,800);
  int cnt = 0;
  for(int imageSize : imageSizes){
    for(float rangeX : rangesX){
      for(float rangeY : rangesY){
        // float fixedScale = scale * imageSize;
        myImg = createImage(imageSize, imageSize, RGB);
        myImg.loadPixels();
        for(float y = 0; y < imageSize; y++){
          for(float x = 0; x < imageSize; x++){
            //int index = y * width + x;
            float minX = centerX - rangeX / 2;
            float maxX = centerX + rangeX / 2;
            float minY = centerY - rangeY / 2;
            float maxY = centerY + rangeY / 2;
            
            float currentX = RemapValue(x, 0, imageSize, minX, maxX);//  x/(fixedScale) + centerX;
            float currentY = RemapValue(y, 0, imageSize, minY, maxY);
            
            double value = SimplexNoise.noise(currentX, currentY, currentX, currentY);
            float remappedValue = RemapValue((float)value, -1.0f, 1.0f, 64f, 255f);
            color c = color(remappedValue);
            /*color c = color(0);
            if(value > 0.6){
              c = color(255);
            }
            else if(value > 0.2){
              c = color(191);
            }
            else if(value > -0.2){
              c = color(127);
            }
            else if(value > -0.6){
              c = color(63);
            }
            else{
              c = color(0);
            }*/

            myImg.set((int)x,(int)y,c);
          }
        }
        myImg.updatePixels();
        String imgName = "images/size-" + imageSize + "-rangeX-" + rangeX +  "-rangeY-" + rangeY + ".png";
        myImg.save(imgName);
        cnt++;
        int num = imageSizes.length * rangesX.length * rangesY.length;
        print("Saved Image " + cnt + " / " + num + " : " + imgName + "\n");
      }
    }
  }
}

void draw(){
  //centerX += 0.1;
  exit();
}