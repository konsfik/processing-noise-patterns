float noiseScale = 0.02;

void setup(){
  size(1600,1600);
  
  
}

void draw(){
  loadPixels();
  int index = 0;
  for(float y = 0; y < height; y++){
    for(float x = 0; x < width; x++){
      //int index = y * width + x;
      float value = noise(1000+x/(float)mouseX,1000+y/(float)mouseY);
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