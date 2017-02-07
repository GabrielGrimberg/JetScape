private class MovingBackground
{
  
  private void mvBack()
  {
    //Background scrolling.
    for(int i = 0; i < repeatBg.length; i++) //Lenght of background.
    {
      image(background[i],repeatBg[i],0);
      repeatBg[i] = repeatBg[i] - speedBg;
      
      if(repeatBg[i] + width <= 0) //Making the background go back to the start.
      {
        repeatBg[i] = width -= SPEEDCHANGE; //Then moving it to the left until it hits 0.
        speedBg += SPEEDCHANGE; //Changing the speed for the background.
        speedc += SPEEDCHANGE; //Changing the speed for coins.
        speedDanger += SPEEDCHANGE; //Changing the speed for Danger.
        level++; //Incrementing the leve every time a background gets completed.
      }  
    }
    
  }
  
  
}