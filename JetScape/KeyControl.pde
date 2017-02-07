public void mousePressed()
{
  quitClicked();
  startClicked();
  hClicked();
  highClicked();
}

public void mouseReleased() 
{
  //If mouse released set it back to false.
  mscbtnStr = false;
  mscbtnEnd = false; 
  mscbtnH = false;
  mscbtnHigh = false;
}

public void keyPressed()
{
  keys[keyCode] = true;
  
  //Up arrow to go to main menu when dead.
  if(keyCode == UP && gameState == 2 || gameState == 3 || gameState == 4)
  {
    reset();
    cursor();
  }
  
}

public void keyReleased()
{
  keys[keyCode] = false;
}

public boolean keyCheck(int x)
{
  if (keys.length >= x) 
  {
    return keys[x] || keys[Character.toUpperCase(x)];  
  }
  return false;
}