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
      
      //Fix to correctly adding the score.
      this.cHeight = 0;
      this.xPos = 0;
      this.yPos = 0;
      this.cWidth = 0;
      
      //Incrementing the score.
      score++;
    }
    
  }
   
}