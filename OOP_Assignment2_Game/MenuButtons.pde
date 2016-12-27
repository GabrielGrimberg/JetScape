class MenuButtons
{
  /* Variables for Start Menu */
  float menuXPos; //Variable for the X Position.
  float menuYPos; //Variable for the Y Position.
  int boxSize = 100; //Variable for the size of the box
  int boxCurve = 50; //Variable for the curve of the box.
  
  MenuButtons(float boxXPoint, float boxYPoint, int sizeOfbox, int boxCurve)
  {
    this.menuXPos = boxXPoint;
    this.menuYPos = boxYPoint;
    this.boxSize = sizeOfbox;
    this.boxCurve = boxCurve;
  }
  
  void StartButton()
  {
    rectMode(RADIUS);
    
    if(mouseX > menuXPos - menuYPos &&  //If statement to check
       mouseX < menuXPos + menuYPos &&  //If the mouse is anywhere
       mouseY > menuXPos - menuYPos &&  //near the box.
       mouseY < menuXPos + menuYPos)    
       
    {
      mouseStartButton = true; //Set true, continue to mousePressed()
    
    if(mousePressedStartButton == false) 
    { 
      fill(0,255,0);
    } 
  } 
  else 
  {
    stroke(153);
    fill(153);
    
    mouseStartButton = false;
  }
  
  //Drawing the box.
  rect(menuXPos, menuYPos, boxSize + 100, boxSize, boxCurve);
  fill(0);
  }
  
  void EndButton()
  {
    rectMode(RADIUS);
    
    if(mouseX > menuXPos - menuYPos &&  //If statement to check
       mouseX < menuXPos + menuYPos &&  //If the mouse is anywhere
       mouseY > menuXPos - menuYPos &&  //near the box.
       mouseY < menuXPos + menuYPos)    
       
    {
      mouseEndButton = true; //Set true, continue to mousePressed()
    
    if(mousePressedEndButton == false) 
    { 
      fill(0,255,0);
    } 
  } 
  else 
  {
    stroke(153);
    fill(153);
    
    mouseEndButton = false;
  }
  
  //Drawing the box.
  rect(menuXPos, menuYPos, boxSize + 100, boxSize, boxCurve);
  fill(0);
  }
  
  void SettingsButton()
  {
    rectMode(RADIUS);
    
    if(mouseX > menuXPos - menuYPos &&  //If statement to check
       mouseX < menuXPos + menuYPos &&  //If the mouse is anywhere
       mouseY > menuXPos - menuYPos &&  //near the box.
       mouseY < menuXPos + menuYPos)    
       
    {
      mouseSettingButton = true; //Set true, continue to mousePressed()
    
    if(mousePSettingButton == false) 
    { 
      fill(0,255,0);
    } 
  } 
  else 
  {
    stroke(153);
    fill(153);
    
    mouseSettingButton = false;
  }
  
  //Drawing the box.
  rect(menuXPos, menuYPos, boxSize + 100, boxSize, boxCurve);
  fill(0);
  }
  
}