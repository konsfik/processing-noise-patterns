/*
  Author: Konstantinos Sfikas
  Date: March 2018
  Platform: Processing 3.3.6
*/



public class SeamlessHeightMap{
  private int _numCellsX;
  private int _numCellsY;
  private float[] _cells;
  
  private float _rangeX;
  private float _rangeY;
  private float _overlapX;
  private float _overlapY;
  private float _centerX;
  private float _centerY;
  private float _translationZ;
  
  // class constructor
  public SeamlessHeightMap(
    int numCellsX, 
    int numCellsY,
    float rangeX,
    float rangeY,
    float overlapX, 
    float overlapY,
    float centerX,
    float centerY,
    float translationZ){
    
    _numCellsX = numCellsX;
    _numCellsY = numCellsY;
    _rangeX = rangeX;
    _rangeY = rangeY;
    _overlapX = overlapX;
    _overlapY = overlapY;
    _centerX = centerX;
    _centerY = centerY;
    _translationZ = translationZ;
    
    _cells = new float[_numCellsX * _numCellsY];
    UpdateSelf();
  }
  
  
  public void UpdateSelf(){
    UpdateSelf(_rangeX, _rangeY, _centerX, _centerY, _overlapX, _overlapY, _translationZ);
  }
  
  public void UpdateSelf(
    float rangeX,
    float rangeY,
    float centerX,
    float centerY,
    float overlapX,
    float overlapY,
    float translationZ){
      
    _rangeX = rangeX;
    _rangeY = rangeY;
    _centerX = centerX;
    _centerY = centerY;
    _overlapX = overlapX;
    _overlapY = overlapY;
    _translationZ = translationZ;
    
    int index = 0;
    for(float j = 0; j < _numCellsY; j++){
      for(float i = 0; i < _numCellsX; i++){
        float x = RemapValue(i, 0, _numCellsX, -rangeX/2, rangeX/2);
        x += _centerX;
        float y = RemapValue(j, 0, _numCellsY, -rangeY/2, rangeY/2);
        y += _centerY;
        if( // inner area
          (x > _centerX - _rangeX / 2 + _overlapX)
          &&
          (x < _centerX + _rangeX / 2 - _overlapX)
          &&
          (y > _centerY - _rangeY / 2 + _overlapY)
          &&
          (Y < _centerY + _rangeY / 2 - _overlapY)
        ){
          float simplexValue = (float)SimplexNoise.noise(
            x, 
            y, 
            _translationZ
          );
        }
        else{
          x = 0;
          y = 0;
        }
        _cells[index] = simplexValue;
        index++;
      }
    }
  }
  
  public void AddMap(HeightMap hm){
    float[] otherMapCells = hm.GetCells();
    for(int i = 0; i < otherMapCells.length; i++){
      _cells[i] += otherMapCells[i];
    }
  }
  public void MultiplyMap(HeightMap hm){
    float[] otherMapCells = hm.GetCells();
    for(int i = 0; i < otherMapCells.length; i++){
      _cells[i] *= otherMapCells[i];
    }
  }
  
  public float[] GetCells(){
    return _cells;
  }
  
  public void AbsoluteSelf(){
    for(int i = 0; i < _cells.length; i++){
      _cells[i] = Math.abs(_cells[i]);
    }
  }
  
  public void SetRange(float from, float to){
    float min = FindMinimumValue();
    float max = FindMaximumValue();
    for(int i = 0; i < _cells.length; i++){
      _cells[i] = RemapValue(_cells[i], min,max,from,to);
    }
  }
  
  public void NormalizeSelf(){
    float min = FindMinimumValue();
    float max = FindMaximumValue();
    for(int i = 0; i < _cells.length; i++){
      _cells[i] = RemapValue(_cells[i], min,max,0,255);
    }
  }
  
  public void ReverseNormalizeSelf(){
    float min = FindMinimumValue();
    float max = FindMaximumValue();
    for(int i = 0; i < _cells.length; i++){
      _cells[i] = RemapValue(_cells[i], min,max,255,0);
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