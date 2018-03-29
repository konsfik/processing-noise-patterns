public class HeightMap{
  private int _sizeX;
  private int _sizeY;
  private float _centerX;
  private float _centerY;
  private float _extentX;
  private float _extentY;
  
  int[][] _cells;
  
  public HeightMap(){
    _cells = new int[5][5];
  }
}