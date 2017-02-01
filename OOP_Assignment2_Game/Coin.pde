class Coin
{
  float xPos;
  float yPos;
  float cWidth;
  float cHeight;
  
  Coin(float xPos, float yPos, float cWidth, float cHeight)
  {
    this.xPos = xPos;
    this.yPos = yPos;
    this.cWidth = cWidth;
    this.cHeight = cHeight;
  }
  
  void coinUpdate()
  {
    noStroke(); //No outline on coin.
    ellipse(xPos,yPos,cWidth,cHeight); //Outter Coin.
    fill(0);
    
    ellipse(xPos,yPos,cWidth / 2, cHeight / 2); //Inner coin.
    stroke(255);
    fill(255,255,0);
    
    xPos = xPos - speedc; // Coin speed.
    
    //Player touching the coins.
    if(xPos >= player.xPos &&
       xPos <= player.xPos + player.playerWidth &&
       yPos >= player.yPos &&
       yPos <= player.yPos + player.playerHeight)
    {
      cHeight = 0;
      score = score + 1;
    }
    
  }
   
}