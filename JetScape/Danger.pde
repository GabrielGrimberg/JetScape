public class Danger extends MainObjects
{
  public Danger(float xPos, float yPos, float w, float h)
  {
    this.xPos = xPos;
    this.yPos = yPos;
    this.w = w;
    this.h = h;
  }
  
  @Override
  public void update()
  {
    noStroke(); //No outline on coin.
    ellipse(xPos,yPos,w,h); //Outter Coin.
    fill(0);
    
    ellipse(xPos,yPos,w / 3, h / 3); //Inner coin.
    stroke(255);
    fill(255,0,0);
    
    xPos = xPos - speedDanger; // Coin speed.
    
    //Player touching the coins.
    if(xPos >= player.xPos &&
       xPos <= player.xPos + player.w &&
       yPos >= player.yPos &&
       yPos <= player.yPos + player.h)
    {
      
      //Fix to correctly adding the score.
      this.h = 0;
      this.xPos = 0;
      this.yPos = 0;
      this.w = 0;
      
      playSound(dead);
      
      //Incrementing the score.
      gameState = 2;
    }
    
  }
  
    
}