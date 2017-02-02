public class Jetflame extends Player
{
  Jetflame()
  {
    super(250,290,5,120,60,' ');
  }
  
  @Override
  public void update()
  {
    int jetUp = 120;
    noStroke();
    fill(0,0,255);
    
    if(yPos + h <= height - 1 * 0.5f)
    {
      yPos = yPos + gravity;
    }
    
    if(keyCheck(space) && yPos >= jetUp)
    {
      yPos = yPos - playerSpeed * 3f; //How fast the player goes up.
    }

    if(keyCheck(space))
    {
      image(jetpackImg,xPos,yPos); //Jet flame on Screen.
    }
    
  }
  
  
}