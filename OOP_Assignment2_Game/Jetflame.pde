public class Jetflame extends Player
{
  Jetflame()
  {
    super(250,290,5,70,90,' ');
  }
  
  @Override
  public void update()
  {
    noStroke();
    fill(0,0,255);
    
    if(yPos + h <= height - blockHeight * 0.5f)
    {
      yPos = yPos + gravity;
    }
    
    if(keyCheck(space) && yPos >= 70)
    {
      yPos = yPos - playerSpeed * 3f; //How fast the player goes up.
    }

    if(keyCheck(space))
    {
      image(jetpackImg,xPos,yPos); //Jet flame on Screen.
    }
    
  }
  
  
}