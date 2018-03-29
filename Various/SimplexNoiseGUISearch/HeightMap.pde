/*
  Author: Konstantinos Sfikas
  Date: March 2018
  Platform: Processing 3.3.6
*/



public class HeightMap{
  private int _numCellsX;
  private int _numCellsY;
  private float[] _cells;
  
  private float _rangeX;
  private float _rangeY;
  private float _translationZ;
  
  // class constructor
  public HeightMap(
    int numCellsX, 
    int numCellsY,
    float rangeX,
    float rangeY,
    float translationZ){
    
    _numCellsX = numCellsX;
    _numCellsY = numCellsY;
    _rangeX = rangeX;
    _rangeY = rangeY;
    _translationZ = translationZ;
    
    _cells = new float[_numCellsX * _numCellsY];
  }
  
  
  public void UpdateSelf(){
    UpdateSelf(_rangeX, _rangeY, _translationZ);
  }
  
  public void UpdateSelf(
    float rangeX,
    float rangeY,
    float translationZ){
      
    _rangeX = rangeX;
    _rangeY = rangeY;
    _translationZ = translationZ;
    
    int index = 0;
    for(float j = 0; j < _numCellsY; j++){
      for(float i = 0; i < _numCellsX; i++){
        float x = RemapValue(i, 0, _numCellsX, -rangeX/2, rangeX/2);
        float y = RemapValue(j, 0, _numCellsY, -rangeY/2, rangeY/2);
        float simplexValue = (float)SimplexNoise.noise(
          x, 
          y, 
          _translationZ
        );
        _cells[index] = simplexValue;
        index++;
      }
    }
  }
  
  public float[] GetCells(){
    return _cells;
  }
  
  public void NormalizeSelf(){
    float min = FindMinimumValue();
    float max = FindMaximumValue();
    for(int i = 0; i < _cells.length; i++){
      _cells[i] = RemapValue(_cells[i], min,max,0,255);
    }
  }
  
  private float FindMinimumValue(){
    float minVal = 1000000.0;
    for(float val : _cells){
      if(val < minVal){
        minVal = val;
      }
    }
    return minVal;
  }
  
  private float FindMaximumValue(){
    float maxVal = -1000000.0;
    for(float val : _cells){
      if(val > maxVal){
        maxVal = val;
      }
    }
    return maxVal;
  }
  
  private float RemapValue(float initVal, float initRangeMin, float initRangeMax, float finRangeMin, float finRangeMax){
    float finalVal = finRangeMin + (initVal-initRangeMin)*(finRangeMax-finRangeMin)/(initRangeMax-initRangeMin);
    return finalVal;
  }
    
  
}