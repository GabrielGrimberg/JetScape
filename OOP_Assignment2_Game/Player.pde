class Player
{
  float xPos; //X Position of player.
  float yPos; //Y Position of player.
  float playerSpeed; //Speed of player.
  float playerWidth; //Player width.
  float playerHeight; //Player height.
  
  Player(float xPos, float yPos, float playerSpeed, float playerWidth, float playerHeight)
  {
    this.xPos = xPos;
    this.yPos = yPos;
    this.playerSpeed = playerSpeed;
    this.playerWidth = playerWidth;
    this.playerHeight = playerHeight;
  }
  
  void updatePlayer()
  {
    noStroke();
    fill(0,0,255);
    
    if(yPos + playerHeight <= height - blockHeight * 0.5f)
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