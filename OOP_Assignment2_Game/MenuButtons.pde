class MenuSelect
{
  /* Variables for Start Menu */
  float menuXPos; //Variable for the X Position.
  float menuYPos; //Variable for the Y Position.
  int boxSize = 100; //Variable for the size of the box
  int boxCurve = 50; //Variable for the curve of the box.
  
  MenuSelect(float boxXPoint, float boxYPoint, int sizeOfbox, int boxCurve)
  {
    this.menuXPos = boxXPoint;
    this.menuYPos = boxYPoint;
    this.boxSize = sizeOfbox;
    this.boxCurve = boxCurve;
  }
  
}