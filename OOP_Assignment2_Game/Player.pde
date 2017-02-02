public class Player extends MainObjects
{
  float playerSpeed; //Speed of player.
  char space;
  
  public Player(float xPos, float yPos, float playerSpeed, float w, float h, char space)
  {
    this.xPos = xPos;
    this.yPos = yPos;
    this.playerSpeed = playerSpeed;
    this.w = w;
    this.h = h;
    
    this.space = space;
  }
  
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
    
    fill(255,255,0);
    image(playerChar,xPos,yPos); //Player on Screen.
    
  }
  

}