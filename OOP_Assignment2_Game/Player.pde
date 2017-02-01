class Player extends MainObjects
{
  float playerSpeed; //Speed of player.
  
  Player(float xPos, float yPos, float playerSpeed, float w, float h)
  {
    this.xPos = xPos;
    this.yPos = yPos;
    this.playerSpeed = playerSpeed;
    this.w = w;
    this.h = h;
  }
  
  void update()
  {
    noStroke();
    fill(0,0,255);
    
    if(yPos + h <= height - blockHeight * 0.5f)
    {
      yPos = yPos + gravity;
    }
    
    if(keys[' '] && yPos >= 70)
    {
      yPos = yPos - playerSpeed * 3f; //How fast the player goes up.
    }
    
    fill(255,255,0);
    image(playerChar,xPos,yPos); //Player on Screen.
    
  }
  
}