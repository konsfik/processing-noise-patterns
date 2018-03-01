float noiseScale = 0.02;

float centerX = 0000;
float centerY = 0000;
HeightMap hm;

void setup(){
  size(800,800);
  
  hm = new HeightMap();
  print(hm._cells[0][0]);
}

void draw(){
  centerX += 0.1;
  loadPixels();
  int index = 0;
  for(float y = -height/2; y < height/2; y++){
    for(float x = -width/2; x < width/2; x++){
      //int index = y * width + x;
      float currentX = x/(mouseX/10 + 50) + centerX;
      float currentY = y/(mouseY/10 + 50) + centerY;
      
      float value = noise(currentX, currentY);
      float remappedValue = RemapValue(value, 0.0f, 1.0f, 64f, 255f);
      /*if(value < 0.65){
        remappedValue = RemapValue(value, 0.0f, 1.0f, 0f, 255f);
      }
      else{
        remappedValue = RemapValue(0.65, 0.0f, 1.0f, 0f, 255f);
      }*/
      color c = color(remappedValue);
      pixels[index] = c;
      
      index++;
    }
  }
  updatePixels();
}

public float RemapValue(float initVal, float initRangeMin, float initRangeMax, float finRangeMin, float finRangeMax){
  float finalVal = finRangeMin + (initVal-initRangeMin)*(finRangeMax-finRangeMin)/(initRangeMax-initRangeMin);
  return finalVal;
}