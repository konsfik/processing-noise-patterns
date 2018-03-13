/*
  Author: Konstantinos Sfikas
  Date: March 2018
  Platform: Processing 3.3.6
*/



public class HeightMap{
  private int _numCellsX;
  private int _numCellsY;
  private int[] _cells;
  
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
    _cells = new int[_numCellsX * _numCellsY];
  }
  
  
  public void UpdateSelf(){
    
  }
  
  public void NormalizeSelf(){
    
  }
  
  private void FindMinimumValue(){
  
  }
  
  private void FindMaximumValue(){
    
  }
  
  
}